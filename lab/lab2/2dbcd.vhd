library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
--use IEEE.numeric_bit.all;
entity bcdc2 is
port(D1: in std_logic_vector(3 downto 0);
D2: in std_logic_vector(3 downto 0);
     en,l,up,clr,clk: in std_logic;
     Q1: out std_logic_vector(3 downto 0);
Q2: out std_logic_vector(3 downto 0);
     Co:out std_logic );
end bcdc2;

architecture behav of bcdc2 is
component bcdc is 
port(D: in std_logic_vector(3 downto 0);
     en,l,up,clr,clk: in std_logic;
     Q: out std_logic_vector(3 downto 0);
     Co:out std_logic);
end component;
signal Ci,t:std_logic;
begin
t<= Ci or l;
c1: bcdc port map (D1,en,l,up,clr,clk,Q1,Ci);
c2: bcdc port map (D2,t,l,up,clr,clk,Q2,Co);
end behav;

