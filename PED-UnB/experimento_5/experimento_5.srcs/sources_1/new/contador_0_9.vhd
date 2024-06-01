library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Contador de 0 a 9 assíncrono.
entity contador_0_9 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           saida : out STD_LOGIC_VECTOR (3 downto 0));
end contador_0_9;

architecture Behavioral of contador_0_9 is

    -- Flip-Flip JK
    component jk_ff is
       Port ( J : in STD_LOGIC;
              K : in STD_LOGIC;
              clk : in STD_LOGIC;
              not_clr : in STD_LOGIC;
              Q : out STD_LOGIC;
              not_Q : out STD_LOGIC);
    end component;

    -- Sinais.
    signal Q_a, Q_b, Q_c, Q_d : STD_LOGIC := '0';
    signal reg : STD_LOGIC_VECTOR (3 downto 0);
    signal s_not_clr : STD_LOGIC := '0';

begin

    -- Sinal de clear (1001 ou 9).
    s_not_clr <= (not (Q_d and (not Q_c) and (not Q_b) and Q_a)) and not(reset);
    
    -- Port map dos Flip-Flops.
    ff_D : jk_ff port map (J => '1',
                           K => '1',
                           clk => Q_c,
                           not_clr => s_not_clr,
                           Q => Q_d);
                           
    ff_C : jk_ff port map (J => '1',
                           K => '1',
                           clk => Q_b,
                           not_clr => s_not_clr,
                           Q => Q_c);
                           
    ff_B : jk_ff port map (J => '1',
                           K => '1',
                           clk => Q_a,
                           not_clr => s_not_clr,
                           Q => Q_b);

    ff_A : jk_ff port map (J => '1',
                           K => '1',
                           clk => clk,
                           not_clr => s_not_clr,
                           Q => Q_a);
    
    -- Receba os valores dos Qs dos Flip-Flops.
    reg <= Q_d & Q_c & Q_b & Q_a;
    saida <= reg;
    
end Behavioral;
