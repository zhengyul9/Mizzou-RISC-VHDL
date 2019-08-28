library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

Entity GenClock is
Generic(t_p : integer range 1 to 4 );
Port (clk: in std_logic;
Clock: out std_logic);
End GenClock;

Architecture Behavior of GenClock is
signal count: unsigned(27 downto 0) := X"0000000";
signal cycles: unsigned(27 downto 0);
signal clK_o_i : std_logic:= '1';

begin
Clock <= clk_o_i;
cycles <= X"0BEBC20" when t_p = 1
 else   X"17D7840" when t_p = 2
 else  X"2FAF080" when t_p = 3
 else  X"5F5E100" when t_p = 4 ;
 
process (clk)
begin
if(clk = '1' and clk'event) then   -- rising clock edge
      if count = cycles then    
        count  <= X"0000000";
        clk_o_i   <= not clk_o_i;
      else
        count <= count + X"0000001" ;
      end if;
end if;
end process;
end Behavior; 