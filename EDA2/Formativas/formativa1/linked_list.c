#include <stdio.h>
#include <stdlib.h>

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

celula *busca(celula *le, int x) {
  celula *celulaAtual = le->prox;
  while (celulaAtual != NULL) {
    if (celulaAtual->dado == x) {
      return celulaAtual;
    }
    celulaAtual = celulaAtual->prox;
  }
  return NULL;
}

celula *busca_rec(celula *le, int x) {
  if (le == NULL) return NULL;
  if (le->dado == x) return le;
  return busca_rec(le->prox, x);
}

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

int main() {
  celula linked_list;
  celula l1;
  celula l2;
  celula l3;
  linked_list.prox = NULL;
  l1.prox = NULL;
  l2.prox = NULL;
  l3.prox = NULL;

  insere_antes(&linked_list, 1, 3);
  imprime(&linked_list);
  insere_inicio(&linked_list, 2);
  imprime(&linked_list);
  insere_antes(&linked_list, 3, 2);
  insere_antes(&linked_list, 4, 5);
  imprime(&linked_list);

  remove_depois(linked_list.prox->prox);
  imprime(&linked_list);

  remove_elemento(&linked_list, 4);
  imprime(&linked_list);

  insere_inicio(&linked_list, 2);
  insere_inicio(&linked_list, 2);
  imprime(&linked_list);

  remove_todos_elementos(&linked_list, 2);
  imprime(&linked_list);

  insere_inicio(&l1, 3);
  insere_inicio(&l1, 1);
  insere_inicio(&l1, 1);
  insere_inicio(&l2, 4);
  insere_inicio(&l2, 2);
  mescla_listas(&l1, &l2, &l3);
  imprime(&l3);

  return 0;
}