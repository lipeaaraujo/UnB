#include <stdio.h>
#include <stdlib.h>

typedef struct No {
  int dado;
  struct No *esq, *dir;
} No;

typedef struct Pilha {
  No *no;
  struct Pilha *prox;
} Pilha;

void empilhar(Pilha *pilha, No *no) {
  Pilha *novo = (Pilha *)malloc(sizeof(Pilha));
  novo->no = no;
  novo->prox = pilha->prox;
  pilha->prox = novo;
}

No *desempilhar(Pilha *pilha) {
  if (pilha->prox == NULL) return NULL;
  Pilha *removido = pilha->prox;
  pilha->prox = removido->prox;
  return removido->no;
}

// void pos_ordem_recur(No *raiz) {
//   if (raiz == NULL) {
//     return;
//   }
//   pos_ordem_recur(raiz->esq);
//   pos_ordem_recur(raiz->dir);
//   printf("%d ", raiz->dado);
// }

void pos_ordem(No *raiz) {
  No *aux = NULL;
  Pilha *pilha = (Pilha *)malloc(sizeof(Pilha));
  Pilha *saida = (Pilha *)malloc(sizeof(Pilha));

  empilhar(pilha, raiz);

  while (pilha->prox != NULL || aux != NULL) {
    if (aux == NULL) {
      aux = desempilhar(pilha);
    } else {
      empilhar(pilha, aux->esq);
      empilhar(saida, aux);
      aux = aux->dir;
    }
  }

  while (saida->prox != NULL) {
    printf("%d ", desempilhar(saida)->dado);
  }
  printf("\n");
}

// No *inserirArvore(No *raiz, int dado) {
//   if (raiz == NULL) {
//     No *novo = (No *)calloc(1, sizeof(No));
//     novo->dado = dado;
//     return novo;
//   }
//   if (dado < raiz->dado) raiz->esq = inserirArvore(raiz->esq, dado);
//   if (dado > raiz->dado) raiz->dir = inserirArvore(raiz->dir, dado);

//   return raiz;
// }

// int main() {
//   No *arvore = (No *)malloc(sizeof(No));
//   arvore->dado = 3;
//   arvore->dir = NULL;
//   arvore->esq = NULL;
//   arvore = inserirArvore(arvore, 4);
//   arvore = inserirArvore(arvore, 2);
//   arvore = inserirArvore(arvore, 1);
//   arvore = inserirArvore(arvore, -1);

//   pos_ordem(arvore);

//   return 0;
// }