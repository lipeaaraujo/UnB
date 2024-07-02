#include <stdio.h>
#include <stdlib.h>

typedef struct Grafo {
  int **adj;
  int n;
} Grafo;

Grafo *criaGrafo(int n) {
  Grafo *grafo = (Grafo *)malloc(sizeof(Grafo));
  grafo->adj = (int **)malloc(n * sizeof(int *));
  for (int i=0; i<n; i++) {
    grafo->adj[i] = (int *)calloc(n, sizeof(int));
  }
  grafo->n = n;
  return grafo;
}

int main() {
  int nLocais, nVisitados, nTeste;
  scanf("%d %d %d", &nLocais, &nVisitados, &nTeste);

  Grafo *bairro = criaGrafo(nLocais);
  int *estara = (int *)malloc(nLocais * sizeof(int));

  for (int i=0; i<nLocais; i++) {
    int nVizinhos;
    scanf("%d", &nVizinhos);
    for (int j=0; j<nVizinhos; j++) {
      int vizinho;
      scanf("%d", &vizinho);
      bairro->adj[i][vizinho] = bairro->adj[vizinho][i] = 1;
    }
  }

  for (int i=0; i<nVisitados; i++) {
    int visitado;
    scanf("%d", &visitado);
    estara[visitado] = 1;
    for (int j=0; j<nLocais; j++) {
      if (bairro->adj[visitado][j]) estara[j] = 1;
    }
  }

  for (int i=0; i<nTeste; i++) {
    int localTeste;
    scanf("%d", &localTeste);
    if (estara[localTeste]) {
      printf("Eu vou estar la\n");
    } else {
      printf("Nao vou estar la\n");
    }
  }
}