library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux41 is
    Port ( dados : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           saida : out STD_LOGIC);
end mux41;

architecture Behavioral of mux41 is

begin

    saida <= dados(0) when sel = "00" else
             dados(1) when sel = "01" else
             dados(2) when sel = "10" else
             dados(3);

end Behavioral;

