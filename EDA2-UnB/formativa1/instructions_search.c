#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
  int codigo;
  char instrucao[16];
} Instrucao;

int compara(const void *a, const void *b) {
  return ((Instrucao *)a)->codigo - ((Instrucao *)b)->codigo;
}

char* buscaBinaria(Instrucao instrucoes[], int n, int codigo) {
  int inicio = 0, fim = n - 1;
  while (inicio <= fim) {
    int meio = (inicio + fim) / 2;
    if (instrucoes[meio].codigo == codigo) {
      return instrucoes[meio].instrucao;
    } else if (instrucoes[meio].codigo < codigo) {
      inicio = meio + 1;
    } else {
      fim = meio - 1;
    }
  }

  return "undefined";
}

int main() {
  int numInstrucoes, codigo, codigoValido = 0;
  Instrucao *instrucoes;

  // receba o numero de instrucoes e aloque a memória suficiente.
  scanf("%d", &numInstrucoes);

  instrucoes = (Instrucao *)malloc(numInstrucoes * sizeof(Instrucao));

  // receba as instrucoes e ordene-as.
  for(int i=0; i<numInstrucoes; i++) {
    scanf("%d %15s", &instrucoes[i].codigo, instrucoes[i].instrucao);
  }

  qsort(instrucoes, numInstrucoes, sizeof(Instrucao), compara);

  // faca a leitura.
  while (scanf("%d", &codigo) != EOF) {
    printf("%s\n", buscaBinaria(instrucoes, numInstrucoes, codigo));
  }

  free(instrucoes);

  return 0;
}