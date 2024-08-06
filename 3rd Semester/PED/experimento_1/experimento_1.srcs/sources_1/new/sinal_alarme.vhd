library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sinal_alarme is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           S : out STD_LOGIC);
end sinal_alarme;

architecture Behavioral of sinal_alarme is

begin

S <= (A and B) or ((not B) and C);

end Behavioral;