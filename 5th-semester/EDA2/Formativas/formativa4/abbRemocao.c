#include <stdlib.h>

typedef struct No {
   int chave;
   struct No *esq, *dir;
} No;

No *removeNo (No *rem) {
  // se não tiver antecessor, remove e retorna a subárvore direita.
  if (rem->esq == NULL) {
    No *dir = rem->dir;
    free(rem);
    return dir;
  }

  // acha o antecessor e o pai do mesmo.
  No *pai = rem, *ant = rem->esq;
  while(ant->dir != NULL) {
    pai = ant;
    ant = ant->dir;
  }

  // troca com o antecessor.
  rem->chave = ant->chave;
  if (pai==rem) pai->esq = ant->esq;
  else pai->dir = ant->esq;
  free(ant);
  return rem;
}

No *remover (No *r, int x) {
  if (r == NULL) return NULL;
  if (r->chave == x) return removeNo(r);
  if (r->chave > x) r->esq = remover(r->esq, x);
  if (r->chave < x) r->dir = remover(r->dir, x);
  return r;
}