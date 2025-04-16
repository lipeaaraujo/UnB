#summary #code-examples
## Aplicação de forma modular usando programação convencional

```c
1 #include <stdio.h>
2
3 int add (int x, int y) {
4 int result;
5
6 printf("Requisicao de adicao para %d e %d\n", x, y);
7 result = x + y;
8 return(result);
9 } /* fim funcao add */
10
11 int sub (int x, int y) {
12 int result;
13
14 printf("Requisicao de subtracao para %d e %d\n", x, y);
15 result = x - y;
16 return(result);
17 } /* fim funcao sub */
18
19 int main( int argc, char *argv[]) {
20 int x,y;
21
22 if (argc!=3) {
23 Fprintf(stderr,"Uso correto: %s num1 num2\n",argv[0]);
24 exit(0); }
25
26 /* Recupera os 2 operandos passados como argumento */
27 x = atoi(argv[1]); y = atoi(argv[2]);
28 printf("%d + %d = %d\n",x,y, add(x,y));
29 printf("%d - %d = %d\n",x,y, sub(x,y));
30 return(0);
31
32 } /* fim main */
```

No exemplo apresentado existem duas funções ADD e SUB e cada uma com duas variáveis X e Y de parâmetro.

## Gerando arquivo de definição de interface (IDF)

- Definição dos parâmetros que vão ser passados para a(s) procedure(s) remota(s)
- Definição das funções remotas

```x
struct operandos {
	int x;
	int y;
};
program PROG {
	version VERSAO {
		int ADD(operandos) = 1;
		int SUB(operandos) = 2;
	} = 100;
} = 55555555;
```

- A struct `operandos` define os inteiros `x` e `y` a serem passados para as funções remotas. Seguindo a recomendação de passagem de apenas uma variável de parâmetro.
- `program PROG` define o programa RPC com o número 55555555. Essa definição também trás um número de versão (100) para o programa e um código para cada uma das rotinas declaradas.

**Comando para gerar os arquivos em C:**
```bash
rpcgen -a calcula.x
```

**Arquivos gerados:**

| Arquivo          | Conteúdo |
| ---------------- | -------- |
| Calcula.h        |          |
| Calcula_client.c |          |
