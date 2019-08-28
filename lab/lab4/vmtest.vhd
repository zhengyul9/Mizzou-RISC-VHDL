entity TestVM is 
end TestVM;
architecture test of TestVM is
component VM is 
port(N,D,clk: in std_logic;
     S,N_ret: out std_logic);
end component;
component vm is
port( clk,N, D: in std_logic;
      S,N_ret: out std_logic);
end component;
type arr is array(1 to 2) of std_logic;
constant N: integer := 12;
constant n_a:arr := ('0','1');
constant d_a:arr := ('0','1');
constant soda:arr := ('0','1');
constant n_c:arr := ('0','1');

signal i_n,i_d,o_s,o_n,i_clk: std_logic;

begin
i_clk = not clk after 50ns;
process

begin
i_n <= n_a(1);
o_n <= d_a(1);
 