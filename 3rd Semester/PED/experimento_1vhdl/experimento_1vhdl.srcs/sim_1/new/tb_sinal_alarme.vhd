library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_sinal_alarme is
end tb_sinal_alarme;

architecture Behavioral of tb_sinal_alarme is

    component sinal_alarme
        Port ( a : in STD_LOGIC;
               b : in STD_LOGIC;
               c : in STD_LOGIC;
               s : out STD_LOGIC);
    end component;

    signal sa, sb, sc, ss: STD_LOGIC:='0';

begin

    uut: sinal_alarme port map(
    a => sa,
    b => sb,
    c => sc,
    s => ss);

    stimulus: process
    begin
    
    sa <= '0'; sb <= '0'; sc <= '0'; wait for 10 ns;
    sa <= '0'; sb <= '0'; sc <= '1'; wait for 10 ns;
    sa <= '0'; sb <= '1'; sc <= '0'; wait for 10 ns;
    sa <= '0'; sb <= '1'; sc <= '1'; wait for 10 ns;
    sa <= '1'; sb <= '0'; sc <= '0'; wait for 10 ns;
    sa <= '1'; sb <= '0'; sc <= '1'; wait for 10 ns;
    sa <= '1'; sb <= '1'; sc <= '0'; wait for 10 ns;
    sa <= '1'; sb <= '1'; sc <= '1'; wait for 10 ns;
    
    end process;



end Behavioral;
