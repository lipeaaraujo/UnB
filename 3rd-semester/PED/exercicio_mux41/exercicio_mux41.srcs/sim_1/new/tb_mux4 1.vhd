library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux4 is

end tb_mux4;

architecture Behavioral of tb_mux4 is

component tb_mux4
    Port ( dados : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           saida : out STD_LOGIC);
end component;

signal s_dados: STD_LOGIC_VECTOR (3 downto 0):="0000";
signal s_sel: STD_LOGIC_VECTOR (1 downto 0):="00";
signal s_saida: STD_LOGIC:='0';

begin

    uut: mux4 port map (dados => s_dados
                        sel => s_sel
                        saida => s_saida);
                        
    
    stimulus: process
    begin
    
        s_sel <= "00"; s_dados <= "0001";
        wait for 10 ns;
        
        s_sel <= "00"; s_dados <= "0010";
        wait for 10 ns;
        
        s_sel <= "00"; s_dados <= "0011";
        wait for 10 ns;
        
        s_sel <= "00"; s_dados <= "0100";
        wait for 10 ns;
        
        s_sel <= "00"; s_dados <= "0101";
        wait for 10 ns;
        
        s_sel <= "00"; s_dados <= "0110";
        wait for 10 ns;
        
        s_sel <= "00"; s_dados <= "0111";
        wait for 10 ns;
        
        s_sel <= "00"; s_dados <= "1000";
        wait for 10 ns;

        s_sel <= "00"; s_dados <= "1001";
        wait for 10 ns;
        
        s_sel <= "00"; s_dados <= "1010";
        wait for 10 ns;
        
        s_sel <= "00"; s_dados <= "1011";
        wait for 10 ns;
        
        s_sel <= "00"; s_dados <= "1100";
        wait for 10 ns;
        
        s_sel <= "00"; s_dados <= "1101";
        wait for 10 ns;
        
        s_sel <= "00"; s_dados <= "1110";
        wait for 10 ns;
        
        s_sel <= "00"; s_dados <= "1111";
        wait for 10 ns;
        
        -------------------------------
        
        s_sel <= "01"; s_dados <= "0001";
        wait for 10 ns;
        
        s_sel <= "01"; s_dados <= "0010";
        wait for 10 ns;
        
        s_sel <= "01"; s_dados <= "0011";
        wait for 10 ns;
        
        s_sel <= "01"; s_dados <= "0100";
        wait for 10 ns;
        
        s_sel <= "01"; s_dados <= "0101";
        wait for 10 ns;
        
        s_sel <= "01"; s_dados <= "0110";
        wait for 10 ns;
        
        s_sel <= "01"; s_dados <= "0111";
        wait for 10 ns;
        
        s_sel <= "01"; s_dados <= "1000";
        wait for 10 ns;

        s_sel <= "01"; s_dados <= "1001";
        wait for 10 ns;
        
        s_sel <= "01"; s_dados <= "1010";
        wait for 10 ns;
        
        s_sel <= "01"; s_dados <= "1011";
        wait for 10 ns;
        
        s_sel <= "01"; s_dados <= "1100";
        wait for 10 ns;
        
        s_sel <= "01"; s_dados <= "1101";
        wait for 10 ns;
        
        s_sel <= "01"; s_dados <= "1110";
        wait for 10 ns;
        
        s_sel <= "01"; s_dados <= "1111";
        wait for 10 ns;
        
        -------------------------------
        
        s_sel <= "10"; s_dados <= "0001";
        wait for 10 ns;
        
        s_sel <= "10"; s_dados <= "0010";
        wait for 10 ns;
        
        s_sel <= "10"; s_dados <= "0011";
        wait for 10 ns;
        
        s_sel <= "10"; s_dados <= "0100";
        wait for 10 ns;
        
        s_sel <= "10"; s_dados <= "0101";
        wait for 10 ns;
        
        s_sel <= "10"; s_dados <= "0110";
        wait for 10 ns;
        
        s_sel <= "10"; s_dados <= "0111";
        wait for 10 ns;
        
        s_sel <= "10"; s_dados <= "1000";
        wait for 10 ns;

        s_sel <= "10"; s_dados <= "1001";
        wait for 10 ns;
        
        s_sel <= "10"; s_dados <= "1010";
        wait for 10 ns;
        
        s_sel <= "10"; s_dados <= "1011";
        wait for 10 ns;
        
        s_sel <= "10"; s_dados <= "1100";
        wait for 10 ns;
        
        s_sel <= "10"; s_dados <= "1101";
        wait for 10 ns;
        
        s_sel <= "10"; s_dados <= "1110";
        wait for 10 ns;
        
        s_sel <= "10"; s_dados <= "1111";
        wait for 10 ns;
    
        -------------------------------
        
        s_sel <= "11"; s_dados <= "0001";
        wait for 10 ns;
        
        s_sel <= "11"; s_dados <= "0010";
        wait for 10 ns;
        
        s_sel <= "11"; s_dados <= "0011";
        wait for 10 ns;
        
        s_sel <= "11"; s_dados <= "0100";
        wait for 10 ns;
        
        s_sel <= "11"; s_dados <= "0101";
        wait for 10 ns;
        
        s_sel <= "11"; s_dados <= "0110";
        wait for 10 ns;
        
        s_sel <= "11"; s_dados <= "0111";
        wait for 10 ns;
        
        s_sel <= "11"; s_dados <= "1000";
        wait for 10 ns;

        s_sel <= "11"; s_dados <= "1001";
        wait for 10 ns;
        
        s_sel <= "11"; s_dados <= "1010";
        wait for 10 ns;
        
        s_sel <= "11"; s_dados <= "1011";
        wait for 10 ns;
        
        s_sel <= "11"; s_dados <= "1100";
        wait for 10 ns;
        
        s_sel <= "11"; s_dados <= "1101";
        wait for 10 ns;
        
        s_sel <= "11"; s_dados <= "1110";
        wait for 10 ns;
        
        s_sel <= "11"; s_dados <= "1111";
        wait for 10 ns;
        
        -------------------------------
        
        s_sel <= "XZ"; s_dados <= "0001";
        wait for 10 ns;
        
        s_sel <= "XZ"; s_dados <= "0010";
        wait for 10 ns;
        
        s_sel <= "XZ"; s_dados <= "0011";
        wait for 10 ns;
        
        s_sel <= "XZ"; s_dados <= "0100";
        wait for 10 ns;
        
        s_sel <= "XZ"; s_dados <= "0101";
        wait for 10 ns;
        
        s_sel <= "XZ"; s_dados <= "0110";
        wait for 10 ns;
        
        s_sel <= "XZ"; s_dados <= "0111";
        wait for 10 ns;
        
        s_sel <= "XZ"; s_dados <= "1000";
        wait for 10 ns;

        s_sel <= "XZ"; s_dados <= "1001";
        wait for 10 ns;
        
        s_sel <= "XZ"; s_dados <= "1010";
        wait for 10 ns;
        
        s_sel <= "XZ"; s_dados <= "1011";
        wait for 10 ns;
        
        s_sel <= "XZ"; s_dados <= "1100";
        wait for 10 ns;
        
        s_sel <= "XZ"; s_dados <= "1101";
        wait for 10 ns;
        
        s_sel <= "XZ"; s_dados <= "1110";
        wait for 10 ns;
        
        s_sel <= "XZ"; s_dados <= "1111";
        wait for 10 ns;
        
        -------------------------------
        
        s_sel <= "LH"; s_dados <= "0001";
        wait for 10 ns;
        
        s_sel <= "LH"; s_dados <= "0010";
        wait for 10 ns;
        
        s_sel <= "LH"; s_dados <= "0011";
        wait for 10 ns;
        
        s_sel <= "LH"; s_dados <= "0100";
        wait for 10 ns;
        
        s_sel <= "LH"; s_dados <= "0101";
        wait for 10 ns;
        
        s_sel <= "LH"; s_dados <= "0110";
        wait for 10 ns;
        
        s_sel <= "LH"; s_dados <= "0111";
        wait for 10 ns;
        
        s_sel <= "LH"; s_dados <= "1000";
        wait for 10 ns;

        s_sel <= "LH"; s_dados <= "1001";
        wait for 10 ns;
        
        s_sel <= "LH"; s_dados <= "1010";
        wait for 10 ns;
        
        s_sel <= "LH"; s_dados <= "1011";
        wait for 10 ns;
        
        s_sel <= "LH"; s_dados <= "1100";
        wait for 10 ns;
        
        s_sel <= "LH"; s_dados <= "1101";
        wait for 10 ns;
        
        s_sel <= "LH"; s_dados <= "1110";
        wait for 10 ns;
        
        s_sel <= "LH"; s_dados <= "1111";
        wait for 10 ns;
        
end Behavioral;
