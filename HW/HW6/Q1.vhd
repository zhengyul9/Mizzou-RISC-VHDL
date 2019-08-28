library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_bit.all;

entity complement is 
	port(clk : in bit;
		A : IN std_logic_vector;
		B : out std_logic_vector);
end complement;

architecture behavior of complement is
signal N: integer:= A'length;
signal AA, answer :std_logic_vector(N - 1 downto 0) ;


function com (input :std_logic_vector; N : integer)
	return std_logic_vector is
variable output : std_logic_vector(N - 1 downto 0);
variable temp : std_logic_vector(N - 1 downto 0);
begin 

		loop2 : for i in 0 to N - 1 loop
		output(i) := not input(i);
		end loop loop2;
		temp := output;
		output := temp + '1';

return output;
end com;

begin 
	AA <= A;
	process(clk)
	begin
		if clk = '1' and clk'event then
		answer <= com(AA, AA'length);
		B <= answer;
		end if;
	end process;
end behavior;


		