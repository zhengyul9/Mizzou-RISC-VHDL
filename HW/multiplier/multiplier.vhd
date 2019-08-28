library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_bit.all;

entity mul is
port(Clk, St: in bit;
Mplier, Mcand: in unsigned(3 downto 0);
Done: out bit);
end mul;

architecture behave of mul is
signal State: integer range 0 to 9;
signal Q: unsigned(8 downto 0); 
alias M: bit is Q(0); 
begin

process(Clk)
begin
    if Clk'event and Clk = '1' then 
       case State is
    when 0 => 
             if St = '1' then
                 Q(8 downto 4) <= "00000"; 
                 Q(3 downto 0) <= Mplier; 
                 State <= 1;
             end if;
    when 1 | 3 | 5 | 7 => 
             if M = '1'  then 
                 Q(8 downto 4) <= '0' & Q(7 downto 4) + Mcand;
                 State <= State + 1;
                 else
                 Q <= '0' & Q(8 downto 1); 
                 State <= State + 2;
             end if;
    when 2 | 4 | 6 | 8 => 
                 Q <= '0' & Q(8 downto 1); 
                 State <= State + 1;
    when 9 => 
                 State <= 0;
       end case;
    end if;
end process;
Done <= '1' when State = 9 else '0';
end behave;