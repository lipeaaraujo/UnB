#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_BUFFER 53

typedef struct No {
  char dado;
  struct No *esq;
  struct No *dir;
} No;

No *criarNo(char dado) {
  No *novo = (No *)calloc(1, sizeof(No));
  novo->dado = dado;
  return novo;
}

void divideString(const char *str, char delim, char** part1, char** part2) {
  char *pos = strchr(str, delim);

  if (pos == NULL) {
    *part1 = NULL;
    *part2 = NULL;
    return;
  }

  size_t len1 = pos - str;
  size_t len2 = strlen(pos + 1);

  *part1 = (char *)malloc(len1 + 1);
  *part2 = (char *)malloc(len2 + 1);

  strncpy(*part1, str, len1);
  (*part1)[len1] = '\0';
  strcpy(*part2, pos + 1);
}

char *procuraRaiz(const char *pref, const char *inf) {
  // procura a raiz da subárvore do percurso infixo.
  char *raiz = (char *)calloc(1, sizeof(char));
  for (int i=0; pref[i] != '\0'; i++) {
    for (int j=0; inf[j] != '\0'; j++) {
      if (pref[i] == inf[j]){
        *raiz = pref[i];
        return raiz;
      } 
    }
  }
  return raiz;
}

No *montarArvore(No *arv, char *pref, char *inf) {
  if (inf[0] == '\0') return NULL;

  char *raiz = procuraRaiz(pref, inf);
  if (raiz == NULL) return NULL;

  arv = criarNo(*raiz);
  char *subesq, *subdir;
  divideString(inf, *raiz, &subesq, &subdir);

  // printf("raiz: %c subesq: %s subdir: %s\n", *raiz, subesq, subdir);

  arv->esq = montarArvore(arv->esq, pref, subesq);
  arv->dir = montarArvore(arv->dir, pref, subdir);
  return arv;
}

void posfixo(No *arv) {
  if (arv == NULL) return;
  posfixo(arv->esq);
  posfixo(arv->dir);
  printf("%c", arv->dado);
}

int main() {
  int testes, nNos;
  char prefixo[MAX_BUFFER], infixo[MAX_BUFFER];
  No *arvore;

  scanf("%d", &testes);

  for (int i=0; i<testes; i++) {
    scanf("%d %s %s", &nNos, prefixo, infixo);
    // printf("entrada: %s %s\n", prefixo, infixo);
    arvore = montarArvore(arvore, prefixo, infixo);
    posfixo(arvore);
    printf("\n");
  }
}