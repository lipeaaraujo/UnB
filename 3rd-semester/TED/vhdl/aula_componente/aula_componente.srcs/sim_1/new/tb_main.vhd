library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_main is

end tb_main;

architecture Behavioral of tb_main is

    component main
        Port ( e1 : in STD_LOGIC;
               e2 : in STD_LOGIC;
               saida : out STD_LOGIC);
    end component;

    signal s_e1, s_e2, s_saida : STD_LOGIC:='0';

begin

    uuu: main port map (e1 => s_e1, e2 => s_e2, saida => s_saida);

    stimulus: process
    begin
    
        s_e1 <= '0'; s_e2 <= '0';
        wait for 10 ns;
        
        s_e1 <= '0'; s_e2 <= '1';
        wait for 10 ns;
        
        s_e1 <= '1'; s_e2 <= '0';
        wait for 10 ns;
        
        s_e1 <= '1'; s_e2 <= '1';
        wait;
        
    end process;

end Behavioral;
