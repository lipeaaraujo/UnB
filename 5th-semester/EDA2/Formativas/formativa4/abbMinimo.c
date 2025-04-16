#include <stdlib.h>

typedef struct No {
   int chave;
   struct no *esq, *dir;
} No;

No *minimo (No *r) {
  if (r->esq == NULL) {
    return r;
  }
  return minimo(r->esq);
}