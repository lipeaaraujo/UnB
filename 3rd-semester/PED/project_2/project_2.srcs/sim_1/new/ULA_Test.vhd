library ieee;
use ieee.std_logic_1164.all;

entity ULA_Test is
end ULA_Test;

architecture Behavioral of ULA_Test is
    -- Componente ULA para teste
    component ULA is
        port (
            A, B: in std_logic_vector(3 downto 0);
            SS: in std_logic_vector(1 downto 0);
            F: out std_logic_vector(3 downto 0);
            over, c_out: out std_logic
        );
    end component ULA;

    -- Sinais de teste
    signal A, B, F: std_logic_vector(3 downto 0);
    signal SS: std_logic_vector(1 downto 0);
    signal over, c_out: std_logic;

begin
    -- Instanciar ULA
    ULA_inst: ULA
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
    end process;

    -- Teste para a operação de subtração
    process
    begin
        A <= "0101";
        B <= "0011";
        SS <= "01";
        wait for 10 ns;
    end process;

    -- Teste para a operação AND
    process
    begin
        A <= "1100";
        B <= "1010";
        SS <= "10";
        wait for 10 ns;
    end process;

    -- Teste para a operação OR
    process
    begin
        A <= "1100";
        B <= "1010";
        SS <= "11";
        wait for 10 ns;
    end process;

end Behavioral;