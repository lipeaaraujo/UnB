#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define BUFFER_SIZE 50

typedef struct No {
  char nome[BUFFER_SIZE];
  int chave;
  struct No *prox;
} No;

typedef struct Grafo {
  No **adj;
  int n;
} Grafo;

Grafo *criarGrafo(int n) {
  Grafo *g = (Grafo *)malloc(sizeof(Grafo));
  g->adj = (No **)calloc(n, sizeof(No *));
  g->n = n;
  return g;
}

void printGrafo(Grafo *g) {
  for (int i=0; i<g->n; i++) {
    for (No *w = g->adj[i]; w != NULL; w = w->prox) {
      printf("%s(%d) --> ", w->nome, w->chave);
    }
    printf("NULL\n");
  }
}

unsigned long hash_string(const char *str) {
    unsigned long hash = 5381;
    int c;
    while ((c = *str++)) {
        hash = ((hash << 5) + hash) + c; // hash * 33 + c
    }
    return hash;
}

int busca(Grafo *g, char *nome) {
  unsigned long hash = hash_string(nome);
  int chave = hash % g->n;

  while (strcmp(nome, g->adj[chave]->nome) != 0)
    chave = (chave + 1) % g->n;
  
  return chave;
}

void addPessoa(Grafo *g, char *nome) {
  unsigned long hash = hash_string(nome);
  int chave = hash % g->n;

  while (g->adj[chave] != NULL) {
    if (strcmp(g->adj[chave]->nome, nome) == 0) return;
    chave = (chave + 1) % g->n;
  }

  No *novo = (No *)malloc(sizeof(No));
  strcpy(novo->nome, nome);
  novo->chave = chave;
  novo->prox = NULL;
  g->adj[chave] = novo;
}

void addRelacao(Grafo *g, char *nome, char *parente) {
  No *aux = g->adj[busca(g, nome)];
  while (aux->prox != NULL) {
    if (strcmp(parente, aux->nome) == 0) return;
    aux = aux->prox;
  }

  No *novo = (No *)malloc(sizeof(No));
  strcpy(novo->nome, parente);
  novo->chave = busca(g, parente);
  novo->prox = NULL;

  aux->prox = novo;
}

void dfs(Grafo *g, int *comp, int c, int v) {
  comp[v] = c;
  if (g->adj[v] == NULL) return;
  for (No *w = g->adj[v]->prox; w != NULL; w = w->prox)
    if (!comp[w->chave])
      dfs(g, comp, c, w->chave);
}

int familiasConexas(Grafo *g) {
  int *familias = (int *)calloc(g->n, sizeof(int)), c = 0;
  for (int v=0; v<g->n; v++)
    if (!familias[v]) {
      c++;
      dfs(g, familias, c, v);
    }

  return c;
}

int main() {
  int m, n;
  char nome[BUFFER_SIZE], relacao[BUFFER_SIZE], parente[BUFFER_SIZE];

  scanf("%d %d", &m, &n);
  
  Grafo *g = criarGrafo(m);

  for (int i=0; i<n; i++) {
    scanf("%s %s %s", nome, relacao, parente);
    addPessoa(g, nome);
    addPessoa(g, parente);
    addRelacao(g, nome, parente);
    addRelacao(g, parente, nome);
  }

  //printGrafo(g);
  printf("%d\n", familiasConexas(g));

  return 0;
}