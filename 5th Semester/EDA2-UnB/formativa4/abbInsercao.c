#include <stdlib.h>

typedef struct No {
   int chave;
   struct No *esq, *dir;
} No;

No *inserir (No *r, int x) {
  if (r == NULL) {
    No *novo = (No *)calloc(1, sizeof(No));
    novo->chave = x;
    return novo;
  }
  if (x < r->chave) r->esq = inserir(r->esq, x);
  if (x > r->chave) r->dir = inserir(r->dir, x);

  return r;
}
