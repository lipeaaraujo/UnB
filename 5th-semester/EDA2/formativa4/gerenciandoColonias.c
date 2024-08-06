#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define QNTD_FORMIGUEIROS 1048576
#define TAM_ALIMENTO 11

typedef struct No {
  int col;
  char alimento[TAM_ALIMENTO];
  struct No *esq;
  struct No *dir;
} No;

No *inserirArvore(No *arv, int id, char alimento[TAM_ALIMENTO]) {
  if (arv == NULL) {
    //  printf("adicionando %d %s\n", id, alimento);
    No *novo = (No *)calloc(1, sizeof(No));
    novo->col = id;
    strcpy(novo->alimento, alimento);
    return novo;
  }

  // printf("estou em %d %s\n", arv->col, arv->alimento);
  // printf("comparando %s com %s resultado: %d\n", arv->alimento, alimento, strcmp(arv->alimento, alimento));

  if (strcmp(arv->alimento, alimento) < 0) arv->esq = inserirArvore(arv->esq, id, alimento);
  if (strcmp(arv->alimento, alimento) > 0) arv->dir = inserirArvore(arv->dir, id, alimento);

  if (strcmp(arv->alimento, alimento) == 0) {
    printf("%d\n", id);
  }

  return arv;
}

int hash(int tam, int chave) {
  return (chave % tam);
}

void inserirTab(No **tab, int id, char alimento[TAM_ALIMENTO]) {
  int pos = hash(QNTD_FORMIGUEIROS, id);
  while (tab[pos] != NULL) {
    if (tab[pos]->col == id) {
      tab[pos] = inserirArvore(tab[pos], id, alimento);
      return;
    }
    pos = (pos + 1) % QNTD_FORMIGUEIROS;
  }
  tab[pos] = inserirArvore(tab[pos], id, alimento);
  // printf("criado nova colônia: %d %s\n", id, tab[pos]->alimento);
}

void liberarArvore(No *arv) {
  if (arv == NULL) return;
  liberarArvore(arv->esq);
  liberarArvore(arv->dir);
  free(arv);
}

void liberarTab(No **tab, int tam) {
  for (int i=0; i<tam; i++) {
    if (tab[i] != NULL) liberarArvore(tab[i]);
  }
  free(tab);
}

int main() {
  int id;
  char alimento[TAM_ALIMENTO];
  No **tab = (No **)calloc(QNTD_FORMIGUEIROS, sizeof(No *));

  while (scanf("%d %s", &id, alimento) != EOF) {
    inserirTab(tab, id, alimento);
  }

  liberarTab(tab, QNTD_FORMIGUEIROS);

  return 0;
}
