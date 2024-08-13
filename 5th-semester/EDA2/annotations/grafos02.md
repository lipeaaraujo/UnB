# Grafos

## Implementação

1. **Matriz de Adjacência**

```c
typedef struct grafo {
  int **adj;
  int n;
} grafo;
```
```c
grafo *cria_grafo(int n) {
  grafo *g = malloc(sizeof(grafo));
  g->adj = malloc(n*sizeof(int *));
  for (int i=0; i<n; i++) {
    g->adj[i] = calloc(n, sizeof(int));
  }
  g->n = n;
  return g;
}
```
Para inserir uma aresta entre os vértices $u$ e $v$:

```c
g->adj[u][v] = g->adj[v][u] = 1;
```
As operações de **remoção** e **verificação** de existência de arestas são análogas.

2. **Lista de Adjacências**

```c
typedef struct no {
  int dado;
  struct no *prox;
} no;

typedef struct grafo {
  no *adj;
  int n;
} grafo;
```

### Complexidade

|          | Matriz | Lista |
|----------|--------|-------|
| Inserção | $O(1)$ | $O(\delta_{max})$ |
| Remoção | $O(1)$ | $O(\delta_{max})$ |
| Existência de aresta | $O(1)$ | $O(\delta_{max})$ |
| Espaço | $O(n²)$ | $O(m+n)$ |

- $\delta_{max}$ é o **grau** máximo do grafo. ($\delta_{max}$ pode ser $n-1$).
- **grau** de um vértice é a quantidade de vértices adjacentes.
- $m$: total de arestas
- $n$: total de vértices