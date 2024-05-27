#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_BUFFER 53

typedef struct No {
  char dado;
  struct No *esq;
  struct No *dir;
} No;

void inserir(No *arv, char dado) {
  No *novo = (No *)calloc(1, sizeof(No));
  novo->dado = dado;
  arv = novo;
  return;
}

void divideString(const char *str, char delim, char** part1, char** part2) {
  char *pos = strchr(str, delim);
  if (pos == NULL) {
    *part1 = NULL;
    *part2 = NULL;
  } else {
    size_t len1 = pos - str;
    size_t len2 = strlen(pos + 1);

    *part1 = (char *)malloc(len1 + 1);
    *part2 = (char *)malloc(len2 + 1);

    strncpy(*part1, str, len1);
    (*part1)[len1] = '\0';
    strcpy(*part2, pos + 1);
  }
}

No *montarArvore(No *arv, char *pref, char *inf) {
  if (inf == NULL) {
    return NULL;
  }
  char raiz = pref[0], *esq, *dir, ;
  inserir(arv, raiz);
  divideString(inf, raiz, &esq, &dir);
  

}

// void montarPosfixo(char *prefixo, char *infixo, char **posfixo) {
//   char *esq, *dir, raiz = prefixo[0];
//   divideString(infixo, raiz, &esq, &dir);

// }

// void imprimirPosfixo(char *prefixo, char *infixo) {
//   char posfixo[MAX_BUFFER], *esq, *dir;
//   char raiz = prefixo[0];


// }

int main() {
  int testes, nNos;
  char prefixo[MAX_BUFFER], infixo[MAX_BUFFER];
  // No *arvore;

  scanf("%d", &testes);

  for (int i=0; i<testes; i++) {
    scanf("%d %s %s", &nNos, prefixo, infixo);

  }
}