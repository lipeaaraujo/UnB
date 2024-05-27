#include <stdlib.h>

typedef struct No {
   int chave;
   struct No *esq, *dir;
} No;

int altura (No *r) {
  if (r == NULL) return 0;
  int he = altura(r->esq);
  int hd = altura(r->dir);
  if (he > hd) return (he+1);
  else return (hd+1);
}

