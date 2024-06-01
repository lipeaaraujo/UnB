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