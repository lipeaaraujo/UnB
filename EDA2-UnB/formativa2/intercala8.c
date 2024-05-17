#include <stdio.h>
#include <stdlib.h>

#define NUM_REPETICOES 8
#define LIM_SUBMISSOES 100001

typedef struct Regiao {
  int numSubmissoes;
  int submissoes[LIM_SUBMISSOES];
} Regiao;

void intercala2(int *vetorA, int tamA, int *vetorB, int tamB) {
  int tamanho = tamA + tamB;
  int vetorAux[tamanho];
  int i = 0, j = 0, k = 0;

  while (i < tamA && j < tamB) {
    if (vetorB[j] < vetorA[i]) {
      vetorAux[k++] = vetorB[j++];
    } else {
      vetorAux[k++] = vetorA[i++];
    }
  }

  while (i < tamA) {
    vetorAux[k++] = vetorA[i++];
  }

  while (j < tamB) {
    vetorAux[k++] = vetorB[j++];
  }

  for (int i=0; i<tamanho; i++) {
    vetorA[i] = vetorAux[i];
  }
}

void printarSubmissoes(Regiao *regioes, int totalSubmissoes) {
  int *submissoes, totalIntercalado = 0;

  submissoes = (int *)malloc(totalSubmissoes * sizeof(int));

  for (int i=0; i<NUM_REPETICOES; i++) {
    intercala2(submissoes, totalIntercalado, regioes[i].submissoes, regioes[i].numSubmissoes);
    totalIntercalado += regioes[i].numSubmissoes;
  }

  if (totalSubmissoes > 0) {
    printf("%d", submissoes[0]);
    for (int i=1; i<totalSubmissoes; i++) {
      printf("%d ", submissoes[i]);
    }
    printf("\n");
  }
}

int main() {
  int totalSubmissoes = 0;
  Regiao regioes[NUM_REPETICOES];
  
  for (int i=0; i<NUM_REPETICOES; i++) {
    scanf("%d", &regioes[i].numSubmissoes);
    totalSubmissoes += regioes[i].numSubmissoes; 
    for (int j=0; j<regioes[i].numSubmissoes; j++) {
      scanf("%d", &regioes[i].submissoes[j]);
    }
  }

  printarSubmissoes(regioes, totalSubmissoes);

  return 0;
}