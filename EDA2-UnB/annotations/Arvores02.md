# Árvores

<ins>**Distância**</ins> entre dois nós é a quantidade de <ins>**arestas**</ins> (ligaçoes) que os unem.

A <ins>**altura**</ins> de um nó é a maior distância entre este nó e uma folha da árvore. A <ins>**altura da árvore**</ins> é a altura da raiz.

$Altura\,da\,árvore = Qntd.\,de\,níveis - 1$

### Representação da altura de cada nó
```mermaid
graph TB;
    A((3))-->B((2))
    A-->C((2))
    B-->E((1))
    B-->F((0))
    E-->J((0))
    E-->K((0))
    C-->H((0))
    C-->I((1))
    I-->L((0))
    I-->M((0))
```

```c
int altura(no *raiz) {
  if (raiz == NULL) return -1;

  int he = altura(raiz->esq);
  int hd = altura(raiz->dir);
  return (he > hd) ? (he+1) : (hd+1);
}
```

### Percursos em Árvores Binárias

1. **Profundidade**

Visam alcançar folhas o quanto antes. Há 3 tipos comuns:

- Pré-Ordem:
  - "visita" raiz
  - esquerda
  - direita

- Em ordem:
  - esquerda
  - "visita" a raiz
  - direita

- Pós-Ordem:
  - esquerda
  - direita
  - "visita" raiz

```mermaid
graph TB;
    A((10))-->B((3))
    A-->C((4))
    B-->E((7))
    B-->F((6))
    E-->G((8))
    E-->H((9))
    F-->I((13))
    I-->J((11))
    C-->K((5))
    K-->L((12))
    L-->N((15))
    C-->O((1))
    O-->P((2))
```
**Pré-ordem**: 10, 3, 7, 8, 9, 6, 13, 11, 4, 5, 12, 15, 1, 2

**Em-ordem**: 8, 7, 9, 3, 6, 11, 13, 10, 12, 15, 5, 4, 1, 2

**Pós-ordem**: 8, 9, 7, 11, 13, 6, 3, 15, 12, 5, 2, 1, 4, 10

### Balanceamento

Uma árvore é dita balanceada se:
1. Cada nó possui "aproximadamente" a mesma altura.
2. A altura da árvore é "aproximadamente" $\log n$. 