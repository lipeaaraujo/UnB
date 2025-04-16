#include <stdio.h>
#include <stdlib.h>

typedef struct celula {
  int dado;
  struct celula *prox;
} celula;

void insere_inicio(celula *le, int x) {
  celula *celulaNova = (celula *)malloc(sizeof(celula));
  celulaNova->dado = x;

  celulaNova->prox = le->prox;
  le->prox = celulaNova;
}

void insere_antes(celula *le, int x, int y) {
  celula *celulaAux = le;
  celula *celulaNova = (celula *)malloc(sizeof(celula));
  celulaNova->dado = x;

  if (le->prox == NULL) {
    celulaNova->prox = le->prox;
    le->prox = celulaNova;
    return;
  }

  while (celulaAux->prox != NULL) {
    if (celulaAux->prox->dado == y) {
      celulaNova->prox = celulaAux->prox;
      celulaAux->prox = celulaNova;
      return;
    }
    celulaAux = celulaAux->prox;
  }

  celulaAux->prox = celulaNova;
  celulaNova->prox = NULL;
}