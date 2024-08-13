library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( e1 : in STD_LOGIC;
           e2 : in STD_LOGIC;
           saida : out STD_LOGIC);
end main;

architecture Behavioral of main is

component and2
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           s : out STD_LOGIC);
end component;

component or2
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           s : out STD_LOGIC);
end component;

signal not_e1, not_e2, sig1, sig2 : STD_LOGIC;

begin

    not_e1 <= not(e1);
    not_e2 <= not(e2);
    
    u1: and2 port map (a => e1, b => not_e2, s => sig1);
    u2: and2 port map (a => not_e1, b => e2, s => sig2);
    u3: or2 port map (a => sig1, b => sig2, s => saida);

end Behavioral;
