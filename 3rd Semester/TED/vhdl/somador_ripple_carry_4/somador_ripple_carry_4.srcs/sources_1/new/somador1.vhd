library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador1 is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           soma : out STD_LOGIC;
           cout : out STD_LOGIC);
end somador1;

architecture Behavioral of somador1 is

begin
    
    soma <= a xor b xor c;
    cout <= (a and b) or (a and c) or (b and c);

end Behavioral;
