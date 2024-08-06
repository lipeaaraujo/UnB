library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity codificador is
    Port ( dados : in STD_LOGIC_VECTOR (3 downto 0);
           saida : out STD_LOGIC_VECTOR (1 downto 0);
           int : out STD_LOGIC);
end codificador;

architecture Behavioral of codificador is

begin

    saida <= "00" when dados(3)='1' else
             "01" when dados(2)='1' else
             "10" when dados(1)='1' else
             "11" when dados(0)='1' else
             "11";
             
    int <= '1' when dados(3)='1' or dados(2)='1' or dados(1)='1' or dados(0)='1' else
           '0';

end Behavioral;
