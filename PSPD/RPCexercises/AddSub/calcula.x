struct operandos {
    int x;
    int y;
};

program PROG {
    version VERSAO {
        int ADD(operandos) = 1;
        int SUB(operandos) = 2;
    } = 10;
} = 555;