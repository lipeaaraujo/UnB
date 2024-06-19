# Percursos em grafos

Um caminho entre dois vértices $u$ e $v$ é uma sequência de vértices adjacentes, sem **repetição**, começando em $u$ e terminando em $v$.

```mermaid
  graph LR;
  A((0)); B((1)); C((2)); D((3)); E((4)); F((5)); G((6)); H((7)); I((8));
  J((9)); K((10)); L((11)); M((12)); N((13)); O((14)); P((15));
  A --- B; A --- E
  B --- C; B --- E
  C --- G; C --- D
  D --- H
  E --- I;
  F --- J; F --- K
  G --- H; G --- L
  H
  I --- J; I --- M; I --- N
  J --- K; J --- M
  K --- N; K --- O
  L
  M
  N --- O;
  O --- P; 

  linkStyle default interpolate basis
```
## 1. Busca em profundidade - DFS (depth-first-search)

```mermaid
graph LR;
A((0))-->B((1))-->C((2))-->D((3))-->E((7))-->F((6))-->G((11))
B-->H((4))-->I((8))-->J((9))
J-->K((5))-->L((10))-->M((13))-->N((14))-->O((15))
J-->P((12))
```
Árvore de profundidade
- mais "alongada"

Vetor Pai:
| 0  | 1  | 2  | 3  | 4  | 5  | 6  | 7  | 8  | 9  | 10 | 11 | 12 | 13 | 14 | 15 |
|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|----|
| 0 | 0  | 1 | 2 | 1 | 9 | 7 | 3 | 4 | 8 | 5 | 6 | 9 | 10 | 13 | 14 |

```c
int caminhos(grafo *g, int s) {
  int *pai = malloc(g->n*sizeof(int));
  for (int i=0; i<g->n; i++) pai[i] = -1;
  dfs(g, pai, s, s);
  return pai;
}
```
```c
void dfs(grafo *g, int *pai, int p, int v) {
  pai[v]=p;
  for (int i=0; i<g->n; i++) {
    if (g->adj[v][i] && pai[i] == -1)
      dfs(g, pai, v, i);
  }
}
```

## 2. Busca em largura (breadth first-search)

```mermaid
graph LR;
A((0))-->B((1))-->C((2))-->D((3))-->E((7))
A-->F((4))-->G((8))-->H((9))-->I((5))
H-->J((10))
G-->K((12))
G-->L((13))-->M((14))-->N((15))
```
Árvore de largura
- menor caminho (em saltos)'