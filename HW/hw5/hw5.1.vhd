library ieee;
use ieee.std_logic_1164.all;
entity Problem1 is
port (clk,x1,x2:in std_logic;
      z:OUT STD_LOGIC);
	  end Problem1;

Architecture behave of Problem1 is 
signal state,n_s:integer range 1 to 2;
signal q:std_logic_vector(1 downto 0);
signal s::std_logic;
begin 
q <= x1 & x2;
z <= s;
process(clk)
begin
 if (clk = '0' ) then state <= n_state after 10 ns;
end if;
end process;
   process (state,x1,x2)
   begin 
      z<= '0'; --default values
	case state is
	when 1 => if (q = "00") then n_s<= '1';
	          elsif (q = "01") then n_s <= '2';
			  elsif (q = "10") then n_s <= '2';
			  elsif (q = "11") then n_s <= '2';
			  end if;
			  s <= '0' after 10 ns;
	when 2 => if (q = "00") then n_s<= '2';
	          elsif (q = "01") then n_s <= '1';
			  elsif (q = "10") then n_s <= '2';
			  elsif (q = "11") then n_s <= '1';
			  end if;
			  s <= '1' after 10 ns;
	when others => NULL;
	end case;
	end process;
	end behave;

	  