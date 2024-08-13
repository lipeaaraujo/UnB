library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- codificador para os displays de 7 segmentos.
entity codificador_7_segm is
    Port ( entrada : in integer;
           bar : out STD_LOGIC_VECTOR (6 downto 0));
end codificador_7_segm;

architecture Behavioral of codificador_7_segm is

begin
    
    -- when else de todas as entradas em integer.
    bar <= "0000001" when entrada = 0 else
           "1001111" when entrada = 1 else
           "0010010" when entrada = 2 else
           "0000110" when entrada = 3 else
           "1001100" when entrada = 4 else
           "0100100" when entrada = 5 else
           "0100000" when entrada = 6 else
           "0001111" when entrada = 7 else
           "0000000" when entrada = 8 else
           "0000100" when entrada = 9;

end Behavioral;
