#include <stdlib.h>

typedef struct No {
   int chave;
   struct no *esq, *dir;
} No;

No *maximo(No *r) {
  if (r->dir == NULL) {
    return r;
  }
  maximo(r->dir);
}