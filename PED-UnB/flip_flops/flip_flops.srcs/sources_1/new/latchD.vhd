library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity latchD is
    Port ( D : in STD_LOGIC;
           E : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC);
end latchD;

architecture Behavioral of latchD is
    signal qt: STD_LOGIC;
begin
    
    Q <= qt;
    Q_not <= not qt;
    
    latch: process (D,E)
    begin
        if E='1' then
            qt <= D;
        end if;
    end process;

end Behavioral;
