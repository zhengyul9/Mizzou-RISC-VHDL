library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity vm is
port( clk,N, D: in std_logic;
      S,N_ret: out std_logic);
end vm;

architecture rom of vm is
type ROM is array (0 to 11) of std_logic_vector(3 downto 0);
constant FSM_rom: ROM := ("0000","0001","0010","0011","0010","0011","1000","1100","0001","0010","0011","1000");
signal q,qp: std_logic_vector(1 downto 0):="00";
signal inp: std_logic_vector(1 downto 0);
signal ROM_out: std_logic_vector(3 downto 0);

begin
 inp <= N & D;
 Rom_out <= FSM_rom(conv_integer (inp & q));
qp<= Rom_out(1 downto 0);
S<= Rom_out(3);
N_ret <= Rom_out(2);

process(clk)
 begin
  if(clk = '1' and clk'event) then q<=qp; end if;
end process;

end rom;