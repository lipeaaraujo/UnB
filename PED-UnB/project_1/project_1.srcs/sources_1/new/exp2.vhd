----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2023 00:35:33
-- Design Name: 
-- Module Name: exp2 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity exp2 is
    Port ( p : in STD_LOGIC_VECTOR (3 downto 0);
           x0 : out STD_LOGIC;
           x1 : out STD_LOGIC;
           int : out STD_LOGIC);
end exp2;

architecture Behavioral of exp2 is

begin
    process (p)
    begin
        if p(3) = '1' then
            int <= '1'; -- Ativa a saída "int" se p3 estiver em nível alto (prioridade mínima)
            x0 <= '0';
            x1 <= '0';
        elsif p(2) = '1' then
            int <= '1'; -- Ativa a saída "int" se p2 estiver em nível alto
            x0 <= '1';
            x1 <= '0';
        elsif p(1) = '1' then
            int <= '1'; -- Ativa a saída "int" se p1 estiver em nível alto
            x0 <= '0';
            x1 <= '1';
        elsif p(0) = '1' then
            int <= '1'; -- Ativa a saída "int" se p0 estiver em nível alto (prioridade máxima)
            x0 <= '1';
            x1 <= '1';
        else
            int <= '0'; -- Mantém a saída "int" desativada se nenhuma entrada estiver em nível alto
            x0 <= '1';
            x1 <= '1';
        end if;
    end process;

end Behavioral;
