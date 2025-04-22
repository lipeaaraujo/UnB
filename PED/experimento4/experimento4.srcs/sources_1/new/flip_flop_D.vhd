library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flip_flop_D is
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           R : in STD_LOGIC;
           Q : out STD_LOGIC);
end flip_flop_D;

architecture Behavioral of flip_flop_D is

begin

--sensibilidade ao clock
ff: process (clk, R)
begin
    --se reset for '1', resete.
    if R='1' then
        Q <= '0';
    elsif rising_edge(clk) then --detecte a borda de subida do clock.
        Q <= D;
    end if;
    
end process;

end Behavioral;
