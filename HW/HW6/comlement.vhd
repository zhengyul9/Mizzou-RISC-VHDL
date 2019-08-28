library ieee;
use ieee.std_logic_1164.all;
entity  problem1 is
port ( A: in std_logic_vector;
       B: out std_logic_vector);
end problem1;
architecture behave of problem1 is
function complement (datavec: std_logic_vector; N:positive)
return std_logic_vector is
--signal n: integer:= a'length;
--signal c:std_logic_vector(n-1 downto 0);
signal c:std_logic_vector(n-1 downto 0);
aaa: for i in 0 to 4 loop
c(i) <= not datavec;
end loop aaa;
c <= c+'1';
return c;
end complement;
begin 
 signal q: std_logic_vector(N-1 downto 0);
q <= complement(A,A'length);
end complement;