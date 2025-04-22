library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_ff is
    Port ( J : in STD_LOGIC;
           K : in STD_LOGIC;
           clk : in STD_LOGIC;
           not_clr : in STD_LOGIC;
           Q : out STD_LOGIC;
           not_Q : out STD_LOGIC);
end jk_ff;

architecture Behavioral of jk_ff is

    signal s_Q : STD_LOGIC := '0';

begin
    -- lógica do FF JK
    process (clk, not_clr)
    begin
        if not_clr='0' then
            -- limpe a saída Q
            s_Q <= '0';
        elsif rising_edge(clk) then
            -- controle as saídas do FF
            if    J='0' and K='0' then
                -- mantenha Q
            elsif J='0' and K='1' then
                s_Q <= '0';
            elsif J='1' and K='0' then
                s_Q <= '1';
            else
                s_Q <= not s_Q;
            end if;
        end if;
    end process;
    
    Q <= s_Q;
    not_Q <= not s_Q;
    
end Behavioral;
