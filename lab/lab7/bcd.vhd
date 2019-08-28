library IEEE;
use IEEE.NUMERIC_STD.ALL;

use IEEE.STD_LOGIC_1164.ALL;
entity BCD is
port(byte: in std_logic_vector(7 downto 0);
     load: in std_logic; 
	  st:in std_logic;
	  clk: in std_logic;
	  done: out std_logic);
end BCD;

architecture Behavioral of BCD is
signal regbcd: unsigned(15 downto 0);
signal regb: unsigned(15 downto 0):= x"0000";
signal lds: std_logic:='0';
signal sts: std_logic;
signal count: integer range 0 to 16 := 16;
signal d0,d1,d2,d3: std_logic_vector(3 downto 0); 
begin
process(clk)
begin
if (clk ='1' and clk'event) then
if (load ='1' and lds = '0') then regbcd(7 downto 0) <= unsigned(byte); lds<='1';done <= '0';
elsif (load = '1' and lds ='1') then regbcd(15 downto 8) <= unsigned(byte); lds <='0';done <= '0';
end if;
if(st ='1') then sts <='1';
end if;
 if( sts = '1') then
if (count /= 0) then
      regb <= regbcd(0) & regb(15 downto 1);
	regbcd <= '0'&regbcd(15 downto 1);
	if( regbcd(3 downto 0) > "1000") then regbcd(3 downto 0) <= regbcd(3 downto 0) - "0011"; end if;
   if( regbcd(7 downto 4) > "1000") then regbcd(7 downto 4) <= regbcd(7 downto 4) - "0011"; end if;
	if( regbcd(11 downto 8) > "1000") then regbcd(11 downto 8) <= regbcd(11 downto 8) - "0011"; end if;
count <= count-1;
   done <= '0';
   else
	sts <= '0';
	done <= '1';
end if;
	end if;
end if;
d0 <= std_logic_vector(regb(3 downto 0));    
d1 <= std_logic_vector(regb(7 downto 4));
d2 <= std_logic_vector(regb(11 downto 8));
d3 <= std_logic_vector(regb(15 downto 12));
end process;
end Behavioral;

