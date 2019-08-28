library ieee;
use ieee.std_logic_1164.all;

entity andgate is
generic(N : natural);
   port( M,F: in bit_vector(N-1 downto 0); 
         P: out bit_vector(N-1 downto 0));
end andgate;

architecture archi of andgate is
begin
process(M,F)
begin
P <= M and F;
end process;
end archi;