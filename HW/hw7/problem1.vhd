library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity q1 is 
port (clk : in std_logic;
      ld : in std_logic;
      st : in std_logic;
      done : out std_logic;
      reg : in std_logic_vector (31 downto 0));
      
end q1;

architecture behave of q1 is 
signal n0,n1,n2,n3:std_logic_vector(7 downto 0);
signal state : std_logic := '0';
signal count : integer range 0 to 4:=4;
signal comp, temp: std_logic_vector(7 downto 0);
signal regh : std_logic_vector (31 downto 0);

begin

process(clk)

begin 
if (clk = '1' and clk'event) then
 if (st = '1') then 
   regh <= "00000000000000000000000000000000";
   --N1 <= "00000000";
  -- N2 <= "00000000";
 --  N3 <= "00000000";
else 
if (ld = '1') then
 regh (31 downto 0) <= reg (31 downto 0); state <= '1';
N0 <= std_logic_vector(regh(7 downto 0));    
N1 <= std_logic_vector(regh(15 downto 8));
N2 <= std_logic_vector(regh(23 downto 16));
N3 <= std_logic_vector(regh(31 downto 24));
end if;
end if;
if (state = '1') then
 if (count = 0) then 
    done <= '1';
    state <= '0';
 else 
    comp <= n0;
     if (comp > n1) then 
       temp <= n1;
       n1 <= n0;
       n0 <= temp;
     else 
        comp <= n1;
     end if;
      if (comp > n2) then
       temp <= n2;
        n2 <= n1;
         n1 <= temp;
     else 
         comp <= n2;
     end if;
       if (comp > n3) then
         temp <= n3;
          n3 <= n2;
        n2 <= temp;
     else 
         comp <= n3;
      end if;
      count <= count - 1;
      done <= '0';
  end if;
end if;
end if; 
end process;
end behave;