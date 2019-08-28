Library ieee;
use ieee.std_logic_1164.all;
entity sele is
port (d1,d2:in std_logic_vector(7 downto 0);
      s:in std_logic;
	  y:out std_logic_vector(7 downto 0));
end entity sele;

Architecture behave of sele is
begin 
   y <= d1 when s = '0'
           else  d2;
end behave;
