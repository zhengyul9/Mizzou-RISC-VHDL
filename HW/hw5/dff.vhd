Library ieee;
use ieee.std_logic_1164.all;

entity dff is 
port (d:in std_logic_vector(7 downto 0);
      lda,ldb,clk: in std_logic;
	  reg_a,reg_b: out std_logic_vector(7 downto 0));
	  end dff
architecture behave of dff is
signal qa,qb:std_logic_vector(7 downto 0);
begin 
reg_a <= qa;
reg_b <= qb;
process(clk)
begin
  if  (clk'event and clk ='1') then 
	if lda = '1' then qa <= d;
	 else qa <= 0£»
	end if; 
	if ldb = '1' then qb <= d;
	 else qb <= 0£»
	end if;
  end if;
end process;
end behave;  