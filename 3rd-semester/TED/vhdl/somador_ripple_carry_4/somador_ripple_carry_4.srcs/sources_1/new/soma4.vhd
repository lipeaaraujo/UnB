library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity soma4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC);
end soma4;

architecture Behavioral of soma4 is

signal c0, c1, c2 : STD_LOGIC := '0';

component soma1
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           c_in : in STD_LOGIC;
           s : out STD_LOGIC;
           c_out : out STD_LOGIC);
end component;

begin

    sum1: soma1 port map (a => A(0), b => B(0), c_in => C_in, s => S(0), c_out => c0);
    
    sum2: soma1 port map (a => A(1), b => B(1), c_in => c0, s => S(1), c_out => c1);
    
    sum3: soma1 port map (a => A(2), b => B(2), c_in => c1, s => S(2), c_out => c2);
    
    sum4: soma1 port map (a => A(3), b => B(3), c_in => c2, s => S(3), c_out => C_out);

end Behavioral;
