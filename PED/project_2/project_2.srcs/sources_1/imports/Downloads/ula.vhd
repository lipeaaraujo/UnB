--library ieee;
--use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;

--entity ula is
--    generic(n: integer := 4);
--    port (
--        a, b    :   in  unsigned(n - 1 downto 0);       -- Entradas
--        cin     :   in  std_logic;                      -- Carry in
--        op      :   in  std_logic_vector(1 downto 0);   -- operacao
--        f       :   out unsigned(n - 1 downto 0);       -- saida
--        z, c_out:   out std_logic                       -- Zero e carry out
--    );
--end entity ula;

--architecture rtl of ula is

--    signal a_tmp, b_tmp, f_tmp :   unsigned(n downto 0);    -- Sinais temporarios
    
--begin

--    a_tmp <= '0' & a;   -- a com um bit a mais
--    b_tmp <= '0' & b;   -- b com um bit a mais
--    f <= f_tmp(n - 1 downto 0); -- Resultado
--    c_out <= f_tmp(n);  -- Carry out
    
--    ula: process(a_tmp,b_tmp,cin,op) is
--    begin
--        case op is
--            -- aritimetica
--            when "00" =>  -- ADD
--                if cin = '1' then   f_tmp <= a_tmp + b_tmp + 1;
--                else                f_tmp <= a_tmp + b_tmp;
--                end if;
                
--                -- Verificar overflow
--                            if temp(4) = '1' then
--                                over <= '1';
--                            else
--                                over <= '0';
--                            end if; 
--            when "01" =>  -- SUBB
--                if cin = '1' then   f_tmp <= a_tmp - b_tmp;
--                else                f_tmp <= a_tmp - b_tmp - 1;
--                end if;

--            -- logica
--            when "10" => f_tmp <= a_tmp and b_tmp;	-- AND
--            when "11" => f_tmp <= a_tmp or b_tmp;		-- OR
			
        
--            when others => f_tmp <= (others => '0');
                
        
--        end case;
--    end process ula;


--    zero: process(f_tmp) is
--         variable zero   :   std_logic;
--    begin
         
--         for i in n - 1 downto 0 loop
--             if f_tmp(i) = '1' then 
--                 zero := '0';
--                 exit;
--             else
--                 zero := '1';
--             end if;
--         end loop;
--         z <= zero;
     
--    end process zero;
    
--end architecture rtl;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
--use ieee.numeric_std.all;

entity ULA is
    port (
        A, B: in std_logic_vector(3 downto 0);
        SS: in std_logic_vector(1 downto 0);
        F: out std_logic_vector(3 downto 0);
        over, c_out: out std_logic
    );
end ULA;

architecture Behavioral of ULA is
begin
    process (A, B, SS)
        variable temp: std_logic_vector(4 downto 0);
    begin
        -- Soma
        if SS = "00" then
            temp := ('0' & A) + ('0' & B);
            
            -- Verificar cout
            if temp(4) = '1' then
                c_out <= '1';
            else
                c_out <= '0';
            end if;
            
            -- Verificar over
           
           if (A(3) = '0' and B(3) = '0' and temp(3) = '1') or (A(3) = '1' and B(3) = '1' and temp(3) = '0') then
               over <= '1'; 
           else
               over <=  '0';
           end if;
            -- Atribuir o resultado à saída F
            F <= temp(3 downto 0);
            
        -- Subtração
        elsif SS = "01" then
            temp := ('0' & A) - ('0' & B);
            
            -- Verificar cout
            if temp(4) = '1' then
                c_out <= '1';
            else
                c_out <= '0';
            end if;
            
            -- Verificar over
            if (A(3) = '0' and B(3) = '0' and temp(3) = '1') or (A(3) = '1' and B(3) = '1' and temp(3) = '0') then
                over <= '1';
            else
                over <=  '0';
            end if;
            
            -- Atribuir o resultado à saída F
            F <= temp(3 downto 0);
            
        -- AND bit-a-bit
        elsif SS = "10" then
            F <= A and B;
            
        -- OR bit-a-bit
        elsif SS = "11" then
            F <= A or B;
            
        end if;
    end process;
end Behavioral;