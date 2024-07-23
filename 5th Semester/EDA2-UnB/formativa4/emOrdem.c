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

void em_ordem(No *raiz) {
  No *aux = raiz;
  Pilha *pilha = (Pilha *)calloc(1, sizeof(Pilha));
  
  while (pilha->prox != NULL || aux != NULL) {
    if (aux == NULL) {
      aux = desempilhar(pilha);
      printf("%d ", aux->dado);
      aux = aux->dir;
    } else {
      empilhar(pilha, aux);
      aux = aux->esq;
    }
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
//   arvore = inserirArvore(arvore, 1);
//   arvore = inserirArvore(arvore, 2);
//   arvore = inserirArvore(arvore, -1);

//   em_ordem(arvore);

//   return 0;
// }