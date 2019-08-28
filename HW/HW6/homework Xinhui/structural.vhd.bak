library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity structural is
    generic (N: Natural := 4);
    port( A: in bit_vector(N-1 downto 0);
          B: in bit; 
          C: out bit_vector(N-1 downto 0));
end structural;

architecture struc of structural is

component sele
   generic(N : Natural := 4);
   port ( E: out bit_vector ; SEL: in bit);
end component;

component andgate
 generic(N : Natural := 4);
 port( M,F: in bit_vector; P: out bit_vector);
end component;

--constant F: bit_vector( N-1 downto 0):= others => '0';
--constant H: bit_vector( N-1 downto 0):= others => '1';
signal G: bit_vector(N-1 downto 0);
signal D: bit;
begin
D <= B;
se   : sele   port map(D,G);
and1 : andgate port map(G,A,C);
--and2 : andgate port map(H,A,C);
end struc;
