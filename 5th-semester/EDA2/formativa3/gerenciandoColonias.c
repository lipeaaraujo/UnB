#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_ALIMENTO 11
#define TAM_HASH 1048576

typedef struct No {
  int id;
  char alimento[MAX_ALIMENTO];
  struct No *prox;
} No;

typedef struct TabelaHash {
  No *tab[TAM_HASH];
  int tam;
} TabelaHash;

int hash(int tam, int ch) {
  return (ch % tam);
}

TabelaHash *iniciarTabela() {
  TabelaHash *novo = (TabelaHash *)malloc(sizeof(TabelaHash));
  for (int i=0; i<TAM_HASH; i++) {
    novo->tab[i] = (No *)calloc(1, sizeof(No));
  }
  novo->tam = TAM_HASH;
  return novo;
}

void inserir(TabelaHash *th, int id, char *alimento) {
  No *novo, *aux;
  novo = (No *)calloc(1, sizeof(No));
  novo->id = id;
  strcpy(novo->alimento, alimento);

  aux = th->tab[hash(th->tam, id)];
  while(aux->prox != NULL) {
    if (aux->prox->id == id && !strcmp(aux->prox->alimento, alimento)) {
      printf("%d\n", id);
      return;
    }
    aux = aux->prox;
  }
  aux->prox = novo;
}

void liberar(TabelaHash *th) {
  No *aux;
  for (int i=0; i<th->tam; i++) {
    aux = th->tab[i];
    while (aux != NULL) {
      No *temp = aux;
      aux = aux->prox;
      free(temp);
    }
  }
  free(th);
}

int main() {
  int id;
  char alimento[MAX_ALIMENTO];
  TabelaHash *th = iniciarTabela();

  while (scanf("%d %s", &id, alimento) != EOF) {
    inserir(th, id, alimento);
  }

  liberar(th);
  return 0;
}