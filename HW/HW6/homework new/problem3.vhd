library ieee;
use ieee.std_logic_1164.all;

entity problem3 is
port( A: in bit_vector; 
      B: in bit;
      C: out bit_vector);
end problem3;

architecture behave of problem3 is
signal bb:bit;
signal aa,cc: bit_vector;
begin 
bb <= B; aa <= A; cc <= 0;
if bb <= '0' then
cc <= '0';
elsif bb <= '1' then 
cc <= aa;
end if;
end behave;