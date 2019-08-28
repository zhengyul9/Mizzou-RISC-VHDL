library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity addma is
port( A: in std_logic; B: in std_logic ; C: out std_logic );
end addma;

architecture arch of addma is
type matrix is array ( natural range <>, natural range<>) of integer;
begin
procedure ADDMATRIX ( signal A,B: in matrix; signal C: out matrix ) is
--variable A1:(matrix(A'length(1)-1 downto 0, A'length(2)-1 downto 0):= A;
--variable B1:(matrix(B'length(1)-1 downto 0, B'length(2)-1 downto 0):= B;
--variable C1:(matrix(C'length(1)-1 downto 0, C'length(2)-1 downto 0):= C;
begin
assert(A'high(1) = B'high(1) and A'high(2) = B'high(2));
report "Length must be equal!"
severity error;
loop_row: for i in 0 to A'high(1) loop
  loop_column: for j in0 to A'high(2) loop
 C(i,j)<= A(i,j) + B(i,j);
 end loop;
end loop;
end ADDMATRIX;
end arch; 