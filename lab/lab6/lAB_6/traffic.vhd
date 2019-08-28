library IEEE;
use IEEE.std_logic_1164.all;


entity traffic_light is
	PORT (clk, PB:	in std_logic;
		Ga, Ya, Ra, WALK, NOWALK:	out std_logic);
END traffic_light;

architecture behave of traffic_light is

signal clk1: std_logic;
signal state,n_state: integer range 0 to 18;
signal counter : integer range 0 to 3;
signal pb_i: std_logic ;
signal rst: std_logic := '1' ;
component GenClock is
Generic(t_p : integer range 1 to 4 );
Port (clk: in std_logic;
Clock: out std_logic);
End component;

begin

c1: GenClock generic map(2) port map (clk,clk1);

process(clk1)
begin
 if(clk1 = '1' and clk1'event) then
 
  case state is
when 14 to 17 =>  state <= n_state;
 when others => if (counter = 3) then state <= n_state; counter <= 0;
  else counter <= counter +1;
end if;
end case;
end if;
end process;

process(clk,rst)
begin
if(clk = '1' and clk'event) then
 if(PB = '1' and rst ='1') then 
  pb_i <= '1';
  elsif(PB = '0' and PB = '1' and rst = '0') then
    pb_i <= '0';
  else pb_i <= pb_i ;
 end if;
 end if;
 end process;



process(state,pb_i)
begin
Ga<='0';
Ya<= '0';
Ra<='0';
WALK <= '0';
NOWALK <= '0';

case state is
 when 0 to 7 => Ga <= '1'; NOWALK <='1'; n_state <= state+1;
 when 8 => if(pb_i = '1' ) then Ya <= PB;NOWALK <= '1'; n_state <= state+1; rst <= '0';
           else Ga <= '1'; n_state <= 8; NOWALK <='1' ;
           end if;
 when 9 to 13 => Ra <= '1'; WALK <= '1'; n_state <= state+1;
 when 14 => Ra<= '1'; WALK <= '1'; n_state <= state+1;
when 15 => Ra<= '1'; WALK <= '0'; n_state <= state+1;  
when 16 => Ra<= '1'; WALK <= '1'; n_state <= state+1;  
when 17 => Ra<= '1'; WALK <= '0'; n_state <= state +1;
when 18 => Ra<= '1'; WALK <= '1'; n_state <= 0;
end case;
end process;
end behave;
