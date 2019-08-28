library ieee;
use ieee.std_logic_1164.all;

entity twocomplement is
 port(Xin, Yin: in bit_vector(15 downto 0); clk, St: in bit;
      X, Y :inout bit_vector(15 downto 0); V: out bit);
end twocomplement;

architecture two of twocomplement is
 signal state, nextstate: integer range 0 to 1;
 signal C: integer range 0 to 16;
 signal S,CA,CB,YP,Load,Shift,SetV,C15,OV: bit;
begin
C15 <= '1' when C = 15 else '0';
OV <= (not X(0) and not YP and S) or (X(0) and YP and not S);
YP <= not Y(0);
S <= X(0) xor YP xor CA;
CB <= (X(0) and CA) or (YP and CA) or (X(0) and YP);
process( state, St, C15, OV )
begin
 Load <= '0'; Shift <= '0'; SetV <= '0';
 case state is
   when 0 => if St = '1'then Load <= '1'; nextstate <= 1; else nextstate <=0; end if;
   when 1 => Shift <= '1'; if C15 = '0' then nextstate <= 1; 
                           elsif OV = '0' then nextstate <= 0;
                           else SetV <= '1'; nextstate <= 0; end if;
  end case;
end process;
process(clk)
begin
 if clk'event and clk = '1' then state <= nextstate;
 if Load = '1'then
  X <= Xin; Y <= Yin; CA <= '1'; C <= 0; V <='0';
 end if;
 if Shift = '1' then
  X <= S & X(15 downto 1); Y <= '0' & Y(15 downto 1);
  CA <= CB; C <= C + 1;
 end if;
 if SetV = '1' then V <= '1'; end if;
 end if;
end process;
end two;