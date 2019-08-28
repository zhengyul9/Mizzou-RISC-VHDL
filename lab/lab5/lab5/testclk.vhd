library IEEE;
use IEEE.std_logic_1164.all;

Entity TestClock is
Port (clk: in std_logic;
      clko1,clko2,clko3,clko4: out std_logic);
end TestClock;

Architecture Execute of TestClock is

Component GenClock 
Generic(t_p : integer range 1 to 4 );
Port (clk: in std_logic;
Clock: out std_logic);
end Component;

begin

c1: GenClock  generic map(1) port map (clk,clko1);
c2: GenClock  generic map(2) port map (clk,clko2);
c3: GenClock  generic map(3) port map (clk,clko3);
c4: GenClock  generic map(4) port map (clk,clko4);
   

end execute;