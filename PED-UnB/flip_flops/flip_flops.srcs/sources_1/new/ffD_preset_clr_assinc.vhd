----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.06.2023 15:13:32
-- Design Name: 
-- Module Name: ffD_preset_clr_assinc - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ffD_preset_clr_assinc is
    Port ( D : in STD_LOGIC;
           clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Q_not : out STD_LOGIC;
           preset : in STD_LOGIC;
           clr : in STD_LOGIC);
end ffD_preset_clr_assinc;

architecture Behavioral of ffD_preset_clr_assinc is
    signal qt: STD_LOGIC;
begin
    Q <= qt;
    Q_not <= not qt;
    
    latch: process (clk,preset,clr)
    begin
    
        if clr='1' then
            qt <= '0';
        elsif preset='1' then
            qt <= '1';
        elsif rising_edge(clk) then
            qt <= D;
        end if;
    end process;
    
end Behavioral;
