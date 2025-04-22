library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( start : in STD_LOGIC;
           clk   : in STD_LOGIC;
           stop  : in STD_LOGIC;
           reset : in STD_LOGIC;
           segm_1 : out STD_LOGIC_VECTOR (6 downto 0);
           segm_2 : out STD_LOGIC_VECTOR (6 downto 0);
           segm_3 : out STD_LOGIC_VECTOR (6 downto 0));
end main;

architecture Behavioral of main is
    
    component contador_0_9 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           saida : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component contador_0_5 is
        Port ( clk : in STD_LOGIC;
               reset : in STD_LOGIC;
               saida : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component clk_divider is
        Port ( clk : in STD_LOGIC;
               clk_1hz : out STD_LOGIC);
    end component;

    signal s_clk : STD_LOGIC := '0';    
    signal s_clk_1s, s_clk_10s, s_clk_60s : STD_LOGIC := '0';
    signal saida_seg_0, saida_seg_1, saida_min : STD_LOGIC_VECTOR (3 downto 0);
    -- signal seg_0_cod, seg_1_cod, min_cod : STD_LOGIC_VECTOR (6 downto 0);

begin
    
    -- utilize um sinal de clock separado para habilitar a funcionalidade do stop.
    s_clk <= clk and (not stop);
    
    -- port maps.
    divisor_clock : clk_divider port map (clk => s_clk,
                                          clk_1hz => s_clk_1s);
    
    contador_seg_0 : contador_0_9 port map (clk => s_clk_1s,
                                            reset => reset,
                                            saida => saida_seg_0);
                                                 
    contador_seg_1 : contador_0_5 port map (clk => s_clk_10s,
                                            reset => reset,
                                            saida => saida_seg_1);                                            
    
    contador_min : contador_0_9 port map (clk => s_clk_60s,
                                          reset => reset,
                                          saida => saida_min);
                                          
    process (s_clk_1s)
    begin
        -- atualize o clock de 10 segundos.
        if saida_seg_0 = '1001' then
            s_clk_10s = '1';
        else 
            s_clk_10s = '0';
        end if;
        
        -- atualize o clock de 60 segundos.
        if saida_seg_1 = '0110' then
            s_clk_60s = '1';
        else 
            s_clk_60s = '0';
        end if;
        
    end process;
    
end Behavioral;