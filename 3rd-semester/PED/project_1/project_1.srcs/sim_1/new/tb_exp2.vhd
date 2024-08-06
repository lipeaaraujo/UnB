----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.05.2023 00:37:47
-- Design Name: 
-- Module Name: tb_exp2 - Behavioral
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

entity tb_exp2 is
--  Port ( );
end tb_exp2;

architecture Behavioral of tb_exp2 is

    component exp2 is
    Port ( p : in STD_LOGIC_VECTOR (3 downto 0);
           x0 : out std_logic;
           x1 : out std_logic;
           int : out std_logic);
    end component exp2;
    
    signal s_p : std_logic_vector(3 downto 0) := "0000";
    signal s_x0 : std_logic;
    signal s_x1 : std_logic;
    signal s_int : std_logic;

begin
    dut: exp2 
    port map (
        p => s_p,
        x0 => s_x0,
        x1 => s_x1,
        int => s_int
    );
    
    stim_proc: process
        begin
            -- Teste 1: Todas as entradas em nível baixo
            s_p <= "1000";
            wait for 10 ns;
            
            -- Teste 2: p2 em nível alto
            s_p <= "0100";
            wait for 10 ns;
            
            -- Teste 2: p2 em nível alto
            s_p <= "0010";
            wait for 10 ns;
            
            -- Teste 2: p2 em nível alto
            s_p <= "0001";
            wait for 10 ns;
            
            -- Teste 3: p0 e p3 em nível alto (prioridades máxima e mínima, respectivamente)
            s_p <= "0000";
            wait for 10 ns;
            
        end process;

end Behavioral;
