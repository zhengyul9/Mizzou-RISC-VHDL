library IEEE;
use IEEE.std_logic_1164.all;

entity VM1 is 
port(N,D,clk: in std_logic;
     S,N_ret: out std_logic);
end VM1;

architecture Behave of VM1 is
type state_type is (s0,s1,s2,s3);  --type of state machine.
signal state: state_type;
signal n_state: state_type;
signal So: std_logic;
signal inp: std_logic_vector(1 downto 0);

begin
inp <= N & D ;
s <= So;
process(clk)
begin
 if (clk = '1' and clk 'event) then state <= n_state;
end if;
end process;

process(inp,state)
begin
 N_ret <= '0';
 case state is

  when s0 => if(inp = "00") then So <= '0'; n_state <= s0;
             elsif(inp = "10") then So <= '0'; n_state <= s1;
             elsif(inp = "01") then So <= '0'; n_state <= s2;
             end if;
  when s1 => if(inp = "00") then So <= '0'; n_state <= s1;
             elsif(inp = "10") then So <= '0'; n_state <= s2;
             elsif(inp = "01") then So <= '0'; n_state <= s3;
             end if;
   when s2 => if(inp = "00") then So <= '0'; n_state <= s2;
             elsif(inp = "10") then So <= '0'; n_state <= s3;
             elsif(inp = "01") then So <= '1'; n_state <= s0;
             end if;
    when s3 => if(inp = "00") then So <= '0'; n_state <= s3;
             elsif(inp = "10") then So <= '1'; n_state <= s0;
             elsif(inp = "01") then So <= '1'; n_state <= s0; N_ret <= '1';
             end if;
    
end case;
end process;
end behave;