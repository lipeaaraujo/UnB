library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ffD_rst_clr_sinc is
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC;
           preset : in STD_LOGIC;
           clear : in STD_LOGIC);
end ffD_rst_clr_sinc;

architecture Behavioral of ffD_rst_clr_sinc is
    signal qt: STD_LOGIC;
begin
    Q <= qt;
    Q_not <= not qt;
    
    latch: process (clk)
    begin
        if rising_edge(clk) then
            if clk='1' then
                qt <= '0';
            elsif preset='1' then
                qt <= '1';
            else
                qt <= D;
            end if;
        end if;
    end process;

end Behavioral;
