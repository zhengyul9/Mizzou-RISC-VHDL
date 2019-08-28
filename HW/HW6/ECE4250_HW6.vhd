library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

package ECE4250_HW6 is
  function COMLEMENT (Datavec: std_logic_vector; N: integer) return std_logic_vector;
 -- procedure ADDMATRIX ( signal A,B: in matrix; signal C: inout matrix );
  type matrix is array ( natural range <>, natural range<>) of integer;
end ECE4250_HW6;

package body ECE4250_HW6 is

function COMLEMENT (Datavec: std_logic_vector; N: integer) return std_logic_vector;
variable comp: std_logic_vector( N-1 downto 0);
variable com: std_logic_vector( N-1 downto 0);
begin
for i in 0 to N-1 loop
comp(i):= not Datavec(i);
end loop;
com:= comp + 1;
return com;
end COMLEMENT;

procedure ADDMATRIX (signal A, B : matrix; C : out matrix) is
begin
assert(A'high(1)=B'high(1) and A'high(2)=B'high(2))
report"Length should be equal"

looprow: for i in 0 to A'high(1) loop
  loopcolumn: for j in 0 to A'high(2) loop
     C(i,j)<=A(i,j)+B(i,j);
  end loop loopcolumn;
end loop looprow;
end ADDMATRIX;