#include <stdio.h>

typedef struct celula {
  int dado;
  struct celula *prox;
} celula;

void mescla_listas(celula *l1, celula *l2, celula *l3) {
  celula *auxL3 = l3;

  while (l1 != NULL || l2 != NULL) {
    if (l1->prox == NULL) {
      auxL3->prox = l2->prox;
      break;
    }

    if (l2->prox == NULL) {
      auxL3->prox = l1->prox;
      break;
    }

    if (l1->prox->dado <= l2->prox->dado) {
      auxL3->prox = l1->prox;
      l1->prox = l1->prox->prox;
      auxL3 = auxL3->prox;
    } else {
      auxL3->prox = l2->prox;
      l2->prox = l2->prox->prox;
      auxL3 = auxL3->prox;
    }
  }
}