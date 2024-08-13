library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_divider is
    Port ( clk : in STD_LOGIC;
           clk_1hz : out STD_LOGIC);
end clk_divider;

architecture Behavioral of clk_divider is

signal count : integer :=0;
signal c : std_logic :='0';

begin

process(clk)
begin

    if (rising_edge(clk)) then
        count <= count+1;
        if (count = 50000000-1) then
            c <= not c;
            count <= 0;
        end if;
    end if;
    clk_1hz <= c;

end process;

end Behavioral;
