#include <stdio.h>

typedef struct celula {
  int dado;
  struct celula *prox;
} celula;

void imprime(celula *le) {
  celula *celulaAtual = le->prox;
  while (celulaAtual != NULL) {
    printf("%d -> ", celulaAtual->dado);
    celulaAtual = celulaAtual->prox;
  }
  printf("NULL\n");
}

void imprime_rec(celula *le) {
  if (le->prox == NULL) {
    printf("NULL\n");
    return;
  }
  printf("%d -> ", le->prox->dado);
  imprime_rec(le->prox);
}