ENTITY mux_4 IS
    PORT (i0, i1, i2, i3 : IN BIT; -- entradas
          sel            : IN BIT_VECTOR (1 DOWNTO 0); -- selecao
          ot             : OUT BIT); -- saida
END mux_4;

ARCHITECTURE teste OF mux_4 IS

BEGIN

    abc: PROCESS (10, 11, 12, 13)
    BEGIN
        IF    sel = "00" THEN ot <= i0;
        ELSIF sel = "01" THEN ot <= i1;
        ELSIF sel = "10" THEN ot <= i2;
        ELSE                  ot <= i3;
        END IF;
    END PROCESS abc;
END teste;