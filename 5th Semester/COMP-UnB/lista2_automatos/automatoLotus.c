#include <stdio.h>
#include <stdlib.h>

#define MAX_BUFFER 5000

typedef struct No {
  char simbolo;
  struct No *prox;
} No;

void printarPilha(No *pilha) {
  No *aux = pilha->prox;
  if (aux == NULL) {
    printf("nil\n");
    return;
  }

  while (aux != NULL) {
    printf("%c", aux->simbolo);
    aux = aux->prox;
  }
  printf("\n");
}

void empilhar(No *pilha, char val) {
  No *novo = (No *)malloc(sizeof(No));
  novo->simbolo = val;
  novo->prox = NULL;

  if (pilha->prox == NULL) {
    pilha->prox = novo;
    return;
  }

  novo->prox = pilha->prox;
  pilha->prox = novo;
}

No *consultar(No *pilha) {
  return pilha->prox;
}

void desempilhar(No *pilha) {
  if (pilha->prox != NULL) {
    No *removido = pilha->prox;
    pilha->prox = pilha->prox->prox;
    free(removido);
  }
}

void processar(No *pilha, char *palavra) {
  if (palavra[0] == '\0') {
    if (consultar(pilha) != NULL) {
      printf("Rejeito\n");
      return;
    }
    printf("Aceito\n");
    return;
  }

  No *topo = consultar(pilha);

  switch(palavra[0]) {
    case 'a':
      if (topo != NULL) {
        if (topo->simbolo == 'A') empilhar(pilha, 'A');
        if (topo->simbolo == 'B') desempilhar(pilha);
      } else {
        empilhar(pilha, 'A');
      }
    break;
    case 'b':
      if (topo != NULL) {
        if (topo->simbolo == 'A') desempilhar(pilha);
        if (topo->simbolo == 'B') empilhar(pilha, 'B');
      } else {
        empilhar(pilha, 'B');
      }
    break;
    default:
      printf("Rejeito\n");
      return;
  }
  printarPilha(pilha);
  processar(pilha, &palavra[1]);
}

int main() {
  char palavra[MAX_BUFFER];

  while(scanf("%s", palavra) != EOF) {
    No *pilha = (No *)malloc(sizeof(No));
    processar(pilha, palavra);
    free(pilha);
  }

  return 0;
}