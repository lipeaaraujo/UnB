#include <stdio.h>
#include <stdlib.h>

typedef struct No {
  int dado;
  struct No *prox;
} No;

typedef struct GrafoLista {
  No **adj;
  int n;
} GrafoLista;

typedef struct GrafoMatriz {
  int **adj;
  int n;
} GrafoMatriz;

GrafoLista *criarGrafoLista(int n) {
  GrafoLista *novo = (GrafoLista *)malloc(sizeof(GrafoLista));
  novo->adj = (No **)malloc(n * sizeof(No));
  for (int i=0; i<n; i++) {
    novo->adj[i] = (No *)calloc(1, sizeof(No));
  }
  novo->n = n;
  return novo;
}

void addLigacao(GrafoLista *grafo, int p, int v) {
  No *no = (No *)calloc(1, sizeof(No));
  no->dado = v;
  grafo->adj[p]->prox = no;
}

GrafoMatriz *criarGrafoMatriz(int n) {
  GrafoMatriz *novo = (GrafoMatriz *)malloc(sizeof(GrafoMatriz));
  novo->adj = (int **)malloc(n * sizeof(int *));
  for (int i=0; i<n; i++) {
    novo->adj[i] = (int *)calloc(n, sizeof(int));
  }
  novo->n = n;
  return novo;
}

int maisPopular(GrafoMatriz *grafo) {
  int maiorGrau, maisPopular;
  for (int i=0; i<grafo->n; i++) {
    int grau = 0;
    for (int j=0; j<grafo->n; j++) {
      if (grafo->adj[i][j]) grau++;
    }
    if (grau >= maiorGrau) {
      maiorGrau = grau;
      maisPopular = i;
    }
  }

  return maisPopular;
}

void imprimeRecomendacoes(GrafoMatriz *grafo, int v) {
  int *recomendacoes = (int *)calloc(grafo->n, sizeof(int));
  for (int i=0; i<grafo->n; i++) {
    if (grafo->adj[v][i]) {
      for (int j=0; j<grafo->n; j++) {
        if (grafo->adj[i][j] && !grafo->adj[v][j] && j != v) {
          recomendacoes[j] = 1;
        }
      }
    }
  }

  for (int i=0; i<grafo->n; i++) {
    if (recomendacoes[i]) {
      printf("%d ", i);
    }
  }
  printf("\n");
}

int *dfs(GrafoMatriz *grafo, int *pai, int p, int v) {
  pai[v] = p;
  for (int i=0; i<grafo->n; i++) {
    if (grafo->adj[v][i] && pai[i] == -1) {
      dfs(grafo, pai, v, i);
    }
  }
}

int *caminhos(GrafoMatriz *grafo, int p, int v) {
  int *pai = (int *)malloc(grafo->n * sizeof(int));
  for (int i=0; i<grafo->n; i++) pai[i] = -1;
  dfs(grafo, pai, p, v);
  return pai;
}

void imprimePaiDfs(GrafoMatriz *grafo, int p, int v) {
  int *pai = (int *)malloc(grafo->n * sizeof(int));
  pai = caminhos(grafo, p, v);
  printf("vetor pai dfs: ");
  for (int i=0; i<grafo->n; i++) {
    printf("%d ", pai[i]);
  }
  printf("\n");
}

void popularGrafos(GrafoMatriz *matriz, GrafoLista *lista) {
  matriz->adj[0][1] = matriz->adj[1][0] = 1;
  matriz->adj[0][4] = matriz->adj[4][0] = 1;
  matriz->adj[0][5] = matriz->adj[5][0] = 1;
  matriz->adj[1][2] = matriz->adj[2][1] = 1;
  matriz->adj[1][4] = matriz->adj[4][1] = 1;
  matriz->adj[2][3] = matriz->adj[3][2] = 1;
  matriz->adj[2][5] = matriz->adj[5][2] = 1;
  matriz->adj[3][5] = matriz->adj[5][3] = 1;

  addLigacao(lista, 0, 1);
  addLigacao(lista, 0, 2);
  addLigacao(lista, 1, 3);
  addLigacao(lista, 1, 4);
  addLigacao(lista, 1, 7);
  addLigacao(lista, 2, 3);
  addLigacao(lista, 2, 5);
  addLigacao(lista, 3, 4);
  addLigacao(lista, 3, 5);
  addLigacao(lista, 4, 5);
  addLigacao(lista, 4, 6);
  addLigacao(lista, 5, 6);
  addLigacao(lista, 8, 6);
}

int main() {
  GrafoMatriz *matrizAdj = criarGrafoMatriz(6);
  GrafoLista *listaAdj = criarGrafoLista(9);

  popularGrafos(&matrizAdj, &listaAdj);

  printf("mais popular: %d\n", maisPopular(matrizAdj));
  printf("recomendações: \n");
  imprimeRecomendacoes(matrizAdj, 0);
  imprimePaiDfs(matrizAdj, 0, 1);  

  return 0;
}