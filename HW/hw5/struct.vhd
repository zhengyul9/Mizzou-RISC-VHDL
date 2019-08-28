Library ieee;
use ieee.std_logic_1164.all;
entity  problem2  is
port ( clk: in std_logic;  
        s1,s2:std_logic_vector );

end problem2 ;

architecture structure of  problem2 is
component sele 
port (d1,d2:in std_logic_vector(7 downto 0);
      s:in std_logic;
	  y:std_logic_vector(7 downto 0));
end component;

component dff
port(d:in std_logic_vector(7 downto 0);
      lda,ldb,clk: in std_logic;
	  reg_a,reg_b: out std_logic_vector(7 downto 0));
        
end component;

begin

		
end  ;
