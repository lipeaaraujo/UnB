library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity soma1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c_in : in STD_LOGIC;
           s : out STD_LOGIC;
           c_out : out STD_LOGIC);
end soma1;

architecture Behavioral of soma1 is

begin

    s <= a xor b xor c_in;
    c_out <= (a and c_in) or (b and c_in) or (a and b);

end Behavioral;
