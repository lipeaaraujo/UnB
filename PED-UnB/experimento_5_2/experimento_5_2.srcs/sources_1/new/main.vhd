library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( start : in STD_LOGIC;
           stop : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           segm : out STD_LOGIC_VECTOR (6 downto 0);
           mostrar : out STD_LOGIC_VECTOR (3 downto 0));
           
end main;

architecture Behavioral of main is

    component clk_divider is
    Port ( clk : in STD_LOGIC;
           clk_1hz : out STD_LOGIC);
    end component;
    
    component codificador_7_segm is
        Port ( entrada : in integer;
               bar : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

    signal s_clk_1s : STD_LOGIC := '0';
    signal s_ativo : STD_LOGIC := '0';
    signal s_count_seg_0, s_count_seg_1, s_count_min, counter_clk, counter_sel : integer := 0;
    signal segm_1, segm_2, segm_3 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";

begin

    divisor_clock : clk_divider port map (clk => clk,
                                          clk_1hz => s_clk_1s);
                                          
    codificador_seg_0 : codificador_7_segm port map (entrada => s_count_seg_0,
                                                     bar => segm_1);
    
    codificador_seg_1 : codificador_7_segm port map (entrada => s_count_seg_1,
                                                     bar => segm_2);
    
    codificador_min : codificador_7_segm port map (entrada => s_count_min,
                                                   bar => segm_3);
    
    process (s_clk_1s, start, reset, stop)
    
    variable count_seg_0, count_min : integer range 0 to 10;
    variable count_seg_1 : integer range 0 to 6;
    
    begin
        
        -- controle das portas de start e stop.
        if (start = '1') then
            s_ativo <= '1';
        elsif (stop = '1') then
            s_ativo <= '0';
        end if;
        
        -- contadores.
        if (s_ativo = '1') then
            
            -- primeiro contador de segundos.
            if (rising_edge(s_clk_1s)) then
                count_seg_0 := count_seg_0 + 1;
                
                -- segundo contador de segundos.
                if (count_seg_0 > 9) then
                    count_seg_0 := 0;
                    count_seg_1 := count_seg_1 + 1;
                end if;
                
                -- contador de minutos.
                if (count_seg_1 > 5) then
                    count_seg_1 := 0;
                    count_min := count_min + 1;
                end if;
               
                -- reseter de minutos.
                if (count_min > 9) then
                    count_min := 0;
                end if;
                
                
            end if;
            
        end if;
        
        -- controle do reset.
        if (reset = '1') then
            count_seg_0 := 0;
            count_seg_1 := 0;
            count_min := 0;
        end if;
        
        -- passe os dados das variáveis para os sinais.
        s_count_seg_0 <= count_seg_0;
        s_count_seg_1 <= count_seg_1;
        s_count_min <= count_min;
        
    end process;
    
    process (clk)
    
    begin 
        -- mux dos displays.
        if (rising_edge(clk)) then
            if (counter_clk < 10000) then
                counter_clk <= counter_clk + 1;
            else    
                counter_clk <= 0;
                counter_sel <= counter_sel + 1;
            end if;
            
            case counter_sel is
                when 0 =>
                    mostrar <= "1110";
                    segm <= segm_1;
                when 1 =>
                    mostrar <= "1101";
                    segm <= segm_2;
                when 2 =>
                    mostrar <= "1011";
                    segm <= segm_3;
                when others =>
                    mostrar <= "1111";
                    counter_sel <= 0;
            end case;
        end if;
        
    end process;

end Behavioral;
