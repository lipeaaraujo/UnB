#include <stdio.h>
#include <stdlib.h>

#define TAM_ARVORE 5000

typedef struct No {
  int pai;
  int esq, dir;
  int hesq, hdir;
} No;

void inserir(No arv[TAM_ARVORE], int pai, int filho) {
  arv[filho-1].pai = pai;

  if (arv[pai-1].esq <= 0) {
    arv[pai-1].esq = filho;
  } else {
    arv[pai-1].dir = filho;
  }

  // atualiza as alturas de cada subárvore.
  while (pai > 0) {
    int hmaior;
    if (arv[filho-1].hesq >= arv[filho-1].dir) hmaior = arv[filho-1].hesq;
    else hmaior = arv[filho-1].hdir;

    if (arv[pai-1].esq == filho) arv[pai-1].hesq = hmaior+1;
    else arv[pai-1].hdir = hmaior+1;

    // printf("pai: %d, hesq: %d, hdir: %d, filho: %d\n", pai, arv[pai-1].hesq, arv[pai-1].hdir, filho);

    filho = pai;
    pai = arv[pai-1].pai;
  }
}

int balanceada(No *arv, int qntdNos) {
  for (int i=0; i<qntdNos; i++) {
    int he = arv[i].hesq;
    int hd = arv[i].hdir;
    if (he - hd > 1 || he - hd < -1) {
      return 0;
    }
  }
  return 1;
}

int main() {
  int qtndNos, pai;  
  No *arv = (No *)calloc(TAM_ARVORE, sizeof(No));
  arv[0].pai = -1;

  scanf("%d", &qtndNos);

  for (int i=1; i<qtndNos; i++) {
    scanf("%d", &pai);
    inserir(arv, pai, i+1);
  }

  if (balanceada(arv, qtndNos)) {
    printf("Sim\n");
  } else {
    printf("Nao\n");
  }

  return 0;
}