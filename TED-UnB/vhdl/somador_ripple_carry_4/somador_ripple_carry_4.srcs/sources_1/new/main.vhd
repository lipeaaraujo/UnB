library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
port ( D_IN : in std_logic_vector(3 downto 0);
       SZ_OUT : out std_logic_vector(2 downto 0));
end main;

architecture behav of main is

  signal a: std_logic:='0';

  signal b: std_logic:='1';

  signal s: std_logic;

begin

  s <= a;

  s <= b;

end behav;
