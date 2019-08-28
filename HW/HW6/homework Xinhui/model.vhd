library ieee;
use ieee.std_logic_1164.all;

entity VMB is
port( N,D,clk: in std_logic;
      soda,change: out std_logic);
end VMB;

architecture behave of VMB is
signal ps, ns :integer range 0 to 3;
begin
process(ps, N, D)
begin
--D<='0'; N<='0';
case ps is
when 0 => if (N='0' and D='0') then soda<='0'; change<='0'; ns<=0;
          elsif (N='0' and D='1') then soda<='0'; change<='0'; ns<=2;
             elsif (N='1' and D='0') then soda<='0'; change<='0'; ns<=1;
             end if;
         --  end if;
        -- end if;
when 1 => if (N='0' and D='0') then soda<='0'; change<='0'; ns<=1;
          elsif (N='0' and D='1') then soda<='0'; change<='0'; ns<=3;
             elsif (N='1' and D='0') then soda<='0'; change<='0'; ns<=2;
             end if;
           --end if;
          --end if;
when 2 => if (N='0' and D='0') then soda<='0'; change<='0'; ns<=2;
          elsif (N='0' and D='1') then soda<='1'; change<='0'; ns<=0;
             elsif (N='1' and D='0') then soda<='0'; change<='0'; ns<=3;
             end if;
            --end if;
         -- end if;
when 3 => if (N='0' and D='0') then soda<='0'; change<='0'; ns<=3;
          elsif (N='0' and D='1') then soda<='1'; change<='1'; ns<=0;
             elsif (N='1' and D='0') then soda<='1'; change<='0'; ns<=0;
             end if;
          -- end if;
          --end if;
when others => null;
end case;
end process;

process(clk)
begin
if(clk' event and clk = '1') then ps <= ns;
end if;
end process;

end behave;
