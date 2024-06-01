library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_codificador is
--  Port ( );
end tb_codificador;

architecture Behavioral of tb_codificador is

component codificador
    Port ( dados : in STD_LOGIC_VECTOR (3 downto 0);
           saida : out STD_LOGIC_VECTOR (1 downto 0);
           int : out STD_LOGIC);
end component;

    signal s_dados : STD_LOGIC_VECTOR (3 downto 0):="0000";
    signal s_saida : STD_LOGIC_VECTOR (1 downto 0):="00";
    signal s_int : STD_LOGIC:='0';

begin

    uut: codificador port map (dados => s_dados,
                              saida => s_saida,
                              int => s_int);

    stimulus: process
    begin
    
        s_dados <= "0000";
        wait for 10 ns;
        
        s_dados <= "0001";
        wait for 10 ns;
    
        s_dados <= "0010";
        wait for 10 ns;
        
        s_dados <= "0011";
        wait for 10 ns;
    
        s_dados <= "0100";
        wait for 10 ns;
        
        s_dados <= "0101";
        wait for 10 ns;
    
        s_dados <= "0110";
        wait for 10 ns;
        
        s_dados <= "0111";
        wait for 10 ns;
    
        s_dados <= "1000";
        wait for 10 ns;
        
        s_dados <= "1001";
        wait for 10 ns;
    
        s_dados <= "1010";
        wait for 10 ns;
        
        s_dados <= "1011";
        wait for 10 ns;
    
        s_dados <= "1100";
        wait for 10 ns;
        
        s_dados <= "1101";
        wait for 10 ns;
    
        s_dados <= "1110";
        wait for 10 ns;
        
        s_dados <= "1111";
        wait for 10 ns;

    end process;

end Behavioral;
