--library ieee;
--use ieee.std_logic_1164.all;

--entity orgate is
--port( M,N: in bit_vector; P: out bit_vector);
--end orgate;

--architecture archi of orgate is
--begin
--process(M,N)
--begin
--P <= M or N;
--end process;
--end archi;
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL; 
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY complement IS
PORT(clk : in std_logic;
         a : in std_logic_vector (7 downto 0);
         b : out std_logic_vector (7 downto 0));
END complement;
ARCHITECTURE arch OF complement IS
BEGIN 
PROCESS(clk)
variable temp : std_logic_vector (7 downto 0);
begin
   if clk'event and clk = '1' then
       temp := a XOR "01111111";   
       temp := conv_std_logic_vector(conv_integer(temp)+1,8); 
       b <= temp; 
   end if;
end process;
end arch;