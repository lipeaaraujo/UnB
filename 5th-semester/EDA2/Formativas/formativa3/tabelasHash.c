#include <stdio.h>
#include <stdlib.h>

typedef struct No {
  int valor;
  struct No *prox;
} No;

typedef struct TabelaHash {
  No **tab;
  int tam;
} TabelaHash;

TabelaHash *iniciarTabela(int tam) {
  TabelaHash *nova = (TabelaHash *)malloc(sizeof(TabelaHash));
  nova->tam = tam;
  nova->tab = (No **)malloc(nova->tam * sizeof(No *));
  for (int i=0; i<nova->tam; i++) {
    nova->tab[i] = (No *)calloc(1, sizeof(No));
  }
  return nova;
}

int hash(int val, int tam) {
  return (val % tam);
}

void liberar(TabelaHash *th) {
  No *aux;
  for (int i=0; i<th->tam; i++) {
    aux = th->tab[i];
    while(aux != NULL) {
      No *temp = aux;
      aux = aux->prox;
      free(temp);
    }
  }
  free(th->tab);
  free(th);
}

void imprimirTabela(TabelaHash *th) {
  for (int i=0; i<th->tam; i++) {
    No *aux;
    printf("%d -> ", i);
    aux = th->tab[i]->prox;
    while(aux != NULL) {
      printf("%d -> ", aux->valor);
      aux = aux->prox;
    }
    printf("\\\n");
  }
}

void inserir(TabelaHash *th, int ch) {
  No *novo, *aux;
  novo = (No *)calloc(1, sizeof(No));
  novo->valor = ch;

  aux = th->tab[hash(novo->valor, th->tam)];
  while(aux->prox != NULL) {
    aux = aux->prox;
  }

  aux->prox = novo;
}

int main() {
  TabelaHash *th;
  int nTestes, tam, qntCh;

  scanf("%d", &nTestes);

  for (int i=0; i<nTestes; i++) {
    scanf("%d %d", &tam, &qntCh);
    th = iniciarTabela(tam);
    for(int j=0; j<qntCh; j++) {
      int ch;
      scanf("%d", &ch);
      inserir(th, ch);
    }
    imprimirTabela(th);
    if (i+1 < nTestes) printf("\n");
    liberar(th);
  }

  return 0;
}