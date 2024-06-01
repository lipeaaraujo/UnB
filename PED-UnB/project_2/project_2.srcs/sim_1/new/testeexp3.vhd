----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.06.2023 19:26:36
-- Design Name: 
-- Module Name: testeexp3 - Behavioral
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

entity testeexp3 is
--  Port ( );
end testeexp3;

architecture Behavioral of testeexp3 is

    component exp3 is
        port (
            A, B: in std_logic_vector(3 downto 0);
            SS: in std_logic_vector(1 downto 0);
            F: out std_logic_vector(3 downto 0);
            over, c_out: out std_logic
        );
    end component exp3;

    -- Sinais de teste
    signal A, B, F: std_logic_vector(3 downto 0);
    signal SS: std_logic_vector(1 downto 0);
    signal over, c_out: std_logic;

begin

    -- Instanciar ULA
    ULA_inst: exp3
        port map (
            A => A,
            B => B,
            SS => SS,
            F => F,
            over => over,
            c_out => c_out
        );

    -- Teste para a operação de soma
    process
    begin
        A <= "0101";
        B <= "0011";
        SS <= "00";
        wait for 10 ns;
        assert (F = "1000" and over = '0' and c_out = '0') report "Test failed for addition" severity error;
        wait;
    end process;

    -- Teste para a operação de subtração
    process
    begin
        A <= "0101";
        B <= "0011";
        SS <= "01";
        wait for 10 ns;
        assert (F = "0010" and over = '0' and c_out = '0') report "Test failed for subtraction" severity error;
        wait;
    end process;

    -- Teste para a operação AND
    process
    begin
        A <= "1100";
        B <= "1010";
        SS <= "10";
        wait for 10 ns;
        assert (F = "1000") report "Test failed for bitwise AND" severity error;
        wait;
    end process;

    -- Teste para a operação OR
    process
    begin
        A <= "1100";
        B <= "1010";
        SS <= "11";
        wait for 10 ns;
        assert (F = "1110") report "Test failed for bitwise OR" severity error;
        wait;
    end process;
end Behavioral;
