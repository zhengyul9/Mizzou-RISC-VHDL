library ieee;
use ieee.std_logic_1164.all;

entity andgate is
port( M,N: in bit_vector; P: out bit_vector);
end andgate;

architecture archi of andgate is
begin
process(M,N)
begin
P <= M and N;
end process;
end archi;