
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
--use IEEE.numeric_bit.all;
entity bcdc is
port(D: in std_logic_vector(3 downto 0);
     en,l,up,clr,clk: in std_logic;
     Q: out std_logic_vector(3 downto 0);
     Co:out std_logic);
end bcdc;

architecture behav of bcdc is
signal Qi:signed (3 downto 0);
signal W: std_logic_vector(3 downto 0);
begin
Co <= '1' when ((Qi = 0000 and up = '0' and clr = '1' ) or (Qi = 1001 and up = '1' and clr ='1'))
     else '0';  
process(clk,clr)
begin
w <= std_logic_vector(Qi);
if clr = '0' then Qi<= (others => '0');
elsif(clk = '1' and clk'event) then
 if(en = '1'and l ='1') then Qi <= signed(D);
 elsif(w = "1001" and en ='1' and up ='1') then  Qi <= "0000";
 elsif(w = "0000" and en= '1' and up ='0') then  Qi <="1001";
 elsif(l='0' and en ='1' and up ='1') then Qi <= Qi + 1;
 elsif(l='0' and en= '1' and up ='0') then Qi <= Qi - 1;
 end if;
end if;
end process;
Q <= std_logic_vector(Qi);
end behav; 