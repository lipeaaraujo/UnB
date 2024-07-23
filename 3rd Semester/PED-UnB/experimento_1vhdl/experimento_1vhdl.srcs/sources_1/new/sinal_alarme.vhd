library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sinal_alarme is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           s : out STD_LOGIC);
end sinal_alarme;

architecture Behavioral of sinal_alarme is

begin

s <= (a and b) or (not(b) and c);

end Behavioral;
