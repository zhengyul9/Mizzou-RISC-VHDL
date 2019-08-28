library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;
entity complement is
port( clk: in bit; A: in bit_vector; B: out bit_vector);
end complement;
architecture arc of complement is
signal N: integer:= A'length;
function COMLEMENT (Datavec: bit_vector; N: positive)
return bit_vector is
variable comp: bit_vector( N-1 downto 0);
variable com: bit_vector( N-1 downto 0);
begin
for i in 0 to N-1 loop
comp(i):= not Datavec(i);
end loop;
com:= comp(N-1 downto 1) & ( not comp(0));
return com;
end COMLEMENT;
begin
process(clk)
begin
if clk='1' and clk'event then
B <= COMLEMENT( A, N );
end if;
end process;
end arc;