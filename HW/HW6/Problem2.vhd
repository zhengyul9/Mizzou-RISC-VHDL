library ieee;
use ieee.std_logic_1164.all;
entity problem2 is
end entity;

architecture behave of problem2 is
type matrix is array ( natural range <>, natural range<>) of integer;
procedure ADDMATRIX ( signal A,B: in matrix; signal C: inout matrix ) is
variable A1:(matrix(A'length(1)-1 downto 0, A'length(2)-1 downto 0):= A;)
variable B1:(matrix(B'length(1)-1 downto 0, B'length(2)-1 downto 0):= B;)
variable C1:(matrix(C'length(1)-1 downto 0, C'length(2)-1 downto 0):= C;)
begin
assert((A1'length(1) = B1'length(1)) and ( A1'length(2) = B1'length(2));
report "Length of two arrays are not equal!"
severity error;
for i in A1'range(1) loop
 for j in A1'range(2) loop
 C1(i,j):= A1(i,j) + B(i,j);
 end loop;
end loop;
C <= C1;
end ADDMATRIX; 
end behave;