library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ffD is
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC);
end ffD;

architecture Behavioral of ffD is
    signal qt: STD_LOGIC;
begin
    Q <= qt;
    Q_not <= not qt;
    
    latch: process (clk)
    begin
        if rising_edge(clk) then
            qt <= D;
        end if;
    end process;
    
end Behavioral;
