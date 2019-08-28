library ieee;
use ieee.numeric_bit.all;
use ieee.numeric_bit.unsigned;

entity divider is
 port(St, clk: in bit; input: in unsigned(15 downto 0); 
      quotient: out unsigned(15 downto 0));
end divider;

architecture stru of divider is
 signal Ld1, Ld2, Su, Sh, B, K: bit;
 signal Divisor, ACC, Dividend: unsigned(15 downto 0);
 signal Counter: unsigned(4 downto 0);
 signal state, nextstate: integer range 0 to 3;
begin
 quotient <= Dividend;
 K <= '1' when Counter = 16 else '0';
 B <= '1' when ACC < Divisor else '0';
process(state, St, B, K)
begin
Ld1 <= '0'; Ld2 <= '0'; Su <= '0'; Sh <= '0';
case state is
  when 0 => if St = '1' then nextstate <= 1; Ld1 <= '1';
            else nextstate <= 0; end if;
  when 1 => nextstate <= 2; Ld2 <= '1';
  when 2 => nextstate <= 3; Sh <= '1';
  when 3 => if B = '1' and K = '0' then nextstate <= 3; Sh <= '1';
            elsif B = '0' and K = '0' then nextstate <= 3; Su <= '1';
            elsif B = '1' and K = '1' then nextstate <= 0;
            else nextstate <= 0; Su <= '1'; 
            end if;
end case;
end process;

process(clk)
begin
 if clk'event and clk = '1' then state <= nextstate;
 if Ld1 = '1' then Divisor <= input; end if;
 if Ld2 = '1' then Dividend <= input; ACC <= "0000000000000000"; end if;
 if Sh = '1' then ACC <= ACC(14 downto 0) & Dividend(15);
  Dividend <= dividend sll 1; Counter <= Counter + 1; end if;
 if Su = '1' then ACC <= ACC - Divisor; Dividend(0) <= '1'; end if;
 end if;
end process;
end stru;
