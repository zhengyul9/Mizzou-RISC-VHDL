library IEEE;
use IEEE.std_logic_1164.all;

entity sub6 is
 port(A,B: in std_logic_vector(5 downto 0);
   Bi:in std_logic;
   D:out std_logic_vector(5 downto 0);
   Bo:out std_logic);
end sub6;

Architecture Full of sub6 is

component Fs
  port(A,B,Bi: in std_logic;
       S,Bo: out std_logic);
 end component;
signal C: std_logic_vector(5 downto 1);
begin
FS1: Fs port map (A(0),B(0),Bi,D(0),C(1));
FS2: Fs port map (A(1),B(1),C(1),D(1),C(2));
FS3: Fs port map (A(2),B(2),C(2),D(2),C(3));
FS4: Fs port map (A(3),B(3),C(3),D(3),C(4));
FS5: Fs port map (A(4),B(4),C(4),D(4),C(5));
FS6: Fs port map (A(5),B(5),C(5),D(5),BO);
end Full;
