library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity complement is
port( A: in std_logic_vector; B: out std_logic_vector);
end complement;
architecture behave of complement is
signal N: integer:= A'length;
function COMLEMENT (Datavec: std_logic_vector; N: positive)
return std_logic_vector is
variable comp: std_logic_vector( N-1 downto 0);
variable com: std_logic_vector( N-1 downto 0);
begin
for i in 0 to N-1 loop
comp(i):= not Datavec(i);
end loop;
com:= comp + 1;
return com;
end COMLEMENT;
begin
begin
B <= COMLEMENT( A, N );

end behave;