library IEEE;
use IEEE.std_logic_1164.all;

entity Fs is
  port(A,B,Bi: in std_logic;
       S,Bo: out std_logic);
end Fs;

Architecture model of Fs is
begin
 S <= A xor B xor Bi after 10 ns;
 Bo <=  (not A and B) or (B and Bi) or (not A and Bi);
end model;
