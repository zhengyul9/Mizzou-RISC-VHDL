library IEEE;
use IEEE.std_logic_1164.all;

entity testvm is

end testvm;
architecture test2 of testvm is

component VM1 is
port( N, D,clk: in std_logic;
      S,N_ret: out std_logic);
end component;

component vm is
port( clk,N, D: in std_logic;
      S,N_ret: out std_logic);
end component;

constant Nu: integer := 12;
type arr is array(1 to Nu) of std_logic;
constant n_arr: arr := ('0','1','1','1','1','0','0','0','0','0','1','0');
constant d_arr: arr := ('0','0','0','0','0','0','1','1','0','1','0','1');
constant s_arr: arr := ('0','0','0','1','0','0','0','1','0','0','1','0');
constant nr_arr: arr := ('0','0','0','0','0','0','0','0','0','0','0','1');

signal n,d,s,S1,N_R1,n_r,clk: std_logic;
begin
 clk <= not clk after 50ns;
process
begin
 for i in 1 to Nu loop
    n <= n_arr(i);
    d <= d_arr(i);
    wait for 100 ns;
    assert ( s = s_arr(i) and n_r = n_arr(i))
      report "wrong"
      severity error;
    end loop;
   report "test Finished";
end process;
c1:  VM1 port map (n,d,clk,s,n_r);
c2:  vm port map (clk,n,d,s1,n_r1);
end test2;
