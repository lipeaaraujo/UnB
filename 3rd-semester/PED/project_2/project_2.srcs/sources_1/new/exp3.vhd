------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 18.06.2023 19:10:00
---- Design Name: 
---- Module Name: exp3 - Behavioral
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use ieee.std_logic_unsigned.all;

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity exp3 is
--    port (
--        A, B: in std_logic_vector(3 downto 0);
--        SS: in std_logic_vector(1 downto 0);
--        F: out std_logic_vector(3 downto 0);
--        over, c_out: out std_logic
--    );
--end exp3;

--architecture Behavioral of exp3 is

--begin

--    process (A, B, SS)
--        variable temp: std_logic_vector(4 downto 0);
--    begin
--        -- Soma
--        if SS = "00" then
--            temp := ('0' & A) + ('0' & B);
            
--            -- Verificar overflow
--            if temp(4) = '1' then
--                over <= '1';
--            else
--                over <= '0';
--            end if;
            
--            -- Verificar carry out
--            if temp(3) /= temp(4) then
--                c_out <= '1';
--            else
--                c_out <= '0';
--            end if;
            
--            -- Atribuir o resultado à saída F
--            F <= temp(3 downto 0);
            
--        -- Subtração
--        elsif SS = "01" then
--            temp := ('0' & A) - ('0' & B);
            
--            -- Verificar overflow
--            if temp(4) = '1' then
--                over <= '1';
--            else
--                over <= '0';
--            end if;
            
--            -- Verificar carry out
--            if temp(3) /= temp(4) then
--                c_out <= '1';
--            else
--                c_out <= '0';
--            end if;
            
--            -- Atribuir o resultado à saída F
--            F <= temp(3 downto 0);
            
--        -- AND bit-a-bit
--        elsif SS = "10" then
--            F <= A and B;
            
--        -- OR bit-a-bit
--        elsif SS = "11" then
--            F <= A or B;
            
--        end if;
--    end process;

--end Behavioral;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ula is
    generic(n: integer := 3);
    port (
        a, b    :   in  unsigned(n - 1 downto 0);       -- Entradas
        cin     :   in  std_logic;                      -- Carry in
        op      :   in  std_logic_vector(3 downto 0);   -- Operação
        f       :   out unsigned(n - 1 downto 0);       -- Saída
        z, c_out:   out std_logic                       -- Zero e carry out
    );
end entity ula;

architecture rtl of ula is

    signal a_tmp, b_tmp, f_tmp :   unsigned(n downto 0);    -- Sinais temporários
    
begin

    a_tmp <= '0' & a;   -- a com um bit a mais
    b_tmp <= '0' & b;   -- b com um bit a mais
    f <= f_tmp(n - 1 downto 0); -- Resultado
    c_out <= f_tmp(n);  -- Carry out
    
    ula: process(a_tmp,b_tmp,cin,op) is
    begin
        case op is
            -- operações aritméticas
            when "0000" =>  -- ADD
                if cin = '1' then   f_tmp <= a_tmp + b_tmp + 1;
                else                f_tmp <= a_tmp + b_tmp;
                end if;
            when "0001" =>  -- SUBB
                if cin = '1' then   f_tmp <= a_tmp - b_tmp;
                else                f_tmp <= a_tmp - b_tmp - 1;
                end if;

            -- operações lógicas
            when "0010" => f_tmp <= a_tmp and b_tmp;	-- AND
            when "0011" => f_tmp <= a_tmp or b_tmp;		-- OR

            -- Deslocamento de bit
            when "1000" => f_tmp <= '0' & a_tmp(n downto 1);        -- Desloca um bit para a direita
			when "1001" => f_tmp <= a_tmp(n - 1 downto 0) & '0';	-- Desloca um bit para a esquerda
			when "1010" => f_tmp <= '0' & a_tmp(n-1) & a_tmp(n-1 downto 1);  -- Desloca um bit para a direita (mantem sinal)
        
            when others => f_tmp <= (others => '0');
                
        
        end case;
    end process ula;


    zero: process(f_tmp) is
         variable zero   :   std_logic;
    begin
         
         for i in n - 1 downto 0 loop
             if f_tmp(i) = '1' then 
                 zero := '0';
                 exit;
             else
                 zero := '1';
             end if;
         end loop;
         z <= zero;
     
    end process zero;
    
end architecture rtl;