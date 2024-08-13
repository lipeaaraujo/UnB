library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity teste is
    Port ( IN1 : in STD_LOGIC;
           IN2 : in STD_LOGIC;
           IN3 : in STD_LOGIC;
           IN4 : in STD_LOGIC;
           OUT3 : out STD_LOGIC);
end teste;

architecture Behavioral of teste is

begin
    
    OUT3 <= (IN1 and IN2) or (IN3 and IN4);
    
end Behavioral;
