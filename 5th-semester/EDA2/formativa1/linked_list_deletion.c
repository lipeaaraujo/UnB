#include <stdio.h>
#include <stdlib.h>

typedef struct celula {
  int dado;
  struct celula *prox;
} celula;

int remove_depois (celula *p) {
  celula *celulaRemovida;
  if (p->prox == NULL) {
    return;
  }
  celulaRemovida = p->prox;
  p->prox = p->prox->prox;
  free(celulaRemovida);
}

void remove_elemento (celula *le, int x) {
  celula *celulaAux = le;
  celula *celulaRemovida;

  if (celulaAux->prox == NULL) {
    return;
  }

  while (celulaAux->prox != NULL) {
    if (celulaAux->prox->dado == x) {
      celulaRemovida = celulaAux->prox;
      celulaAux->prox = celulaAux->prox->prox;
      free(celulaRemovida);
      return;
    }
    celulaAux = celulaAux->prox;
  }
}

void remove_todos_elementos (celula *le, int x) {
  celula *celulaAux = le;
  celula *celulaRemovida;

  if (celulaAux->prox == NULL) {
    return;
  }

  while (celulaAux->prox != NULL) {
    if (celulaAux->prox->dado == x) {
      celulaRemovida = celulaAux->prox;
      celulaAux->prox = celulaAux->prox->prox;
      free(celulaRemovida);
    } else {
      celulaAux = celulaAux->prox;
    }
  }
}
