library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or2 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           s : out STD_LOGIC);
end or2;

architecture Behavioral of or2 is
    
begin

    s <= a or b;

end Behavioral;
