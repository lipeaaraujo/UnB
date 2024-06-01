library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           clk : in STD_LOGIC;
           clr : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end main;

architecture Behavioral of main is
    
    component flip_flop_D
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           R : in STD_LOGIC;
           Q : out STD_LOGIC);
    end component;
    
    component clk_divider
    Port ( clk : in STD_LOGIC;
           clk_1hz : out STD_LOGIC);
    end component;
    
    signal s_not_clr : STD_LOGIC := not clr;
    signal s_clk_1hz : STD_LOGIC := '0';
    
begin
    
    clk_1s: clk_divider port map (clk => clk,
                                 clk_1hz => s_clk_1hz); 
    
    ff0: flip_flop_D port map (D => D(0),
                               clk => s_clk_1hz,
                               R => s_not_clr,
                               Q => Q(0));

    ff1: flip_flop_D port map (D => D(1),
                               clk => s_clk_1hz,
                               R => s_not_clr,
                               Q => Q(1));

    ff2: flip_flop_D port map (D => D(2),
                               clk => s_clk_1hz,
                               R => s_not_clr,
                               Q => Q(2));

    ff3: flip_flop_D port map (D => D(3),
                               clk => s_clk_1hz,
                               R => s_not_clr,
                               Q => Q(3));

end Behavioral;
