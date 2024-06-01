library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Main is
    Port ( D_latch, D_ff, D_ff_preset_clr_sinc, D_ff_preset_clr_assinc: in STD_LOGIC;
           clk: in STD_LOGIC;
           E: in STD_LOGIC;
           Q_latch, Q_ff, Q_ff_preset_clr_sinc, Q_ff_preset_clr_assinc: out STD_LOGIC;
           Q_not_latch, Q_not_ff, Q_not_ff_preset_clr_sinc, Q_not_ff_preset_clr_assinc: out STD_LOGIC;
           preset_sinc, preset_assinc: STD_LOGIC;
           clr_sinc, clr_assinc: STD_LOGIC);
end Main;

architecture Behavioral of Main is
    
    component latchD
    Port ( D : in STD_LOGIC;
           E : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC);
    end component;
    
    component ffD
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC);
    end component;
    
    component ffD_rst_clr_sinc
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC;
           preset : in STD_LOGIC;
           clear : in STD_LOGIC);
    end component;
    
    component ffD_preset_clr_assinc
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC;
           preset : in STD_LOGIC;
           clr : in STD_LOGIC);
    end component;
    
begin

    latch: latchD port map (D => D_latch,
                            E => E,
                            Q => Q_latch,
                            Q_not => Q_not_latch);
                            
    ff: ffD port map (D => D_ff,
                     clk => clk,
                     Q => Q_ff,
                     Q_not => Q_not_ff);
                     
    ff_preset_clr_sinc: ffD_rst_clr_sinc port map (D => D_ff_preset_clr_sinc,
                                                      clk => clk,
                                                      Q => Q_ff_preset_clr_sinc,
                                                      Q_not => Q_not_ff_preset_clr_sinc,
                                                      preset => preset_sinc,
                                                      clear => clr_sinc);
                                                      
    ff_preset_clr_assinc: ffD_preset_clr_assinc port map (D => D_ff_preset_clr_assinc,
                                                          clk => clk,
                                                          Q => Q_ff_preset_clr_assinc,
                                                          Q_not => Q_not_ff_preset_clr_assinc,
                                                          preset => preset_assinc,
                                                          clr => clr_assinc);


end Behavioral;
