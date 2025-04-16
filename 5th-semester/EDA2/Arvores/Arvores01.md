# Árvores

São estruturas compostas por **nós** interligados entre si de tal forma que:

1. Um nó pode ter um único antecessor. Há apenas um nó que não possui antecessor e se chama **raiz**.

2. Um nó pode ter zero ou mais filhos. Um nó que não tem filhos é chamado de **folha**.

**<ins>Ex:</ins>**

```mermaid
graph TB;
    A((0))-->B((2))
    A-->O((1))
    A-->C((3))
    B-->E((4))
    B-->F((5))
    E-->J((8))
    E-->K((9))
    C-->H((6))
    C-->I((7))
    I-->L((11))
    I-->M((12))
    H-->N((10))
```
## Árvores binárias

São árvores em que cada nó pode ter, no máximo dois filhos.

```mermaid
graph TB;
    A((1))-->B((2))
    A-->C((3))
    B-->E((4))
    B-->F((5))
    E-->J((8))
    E-->K((9))
    C-->H((6))
    C-->I((7))
    I-->L((10))
    I-->M((11))
```
- Um nível k pode ter, no máximo $2^k$ nós.
- Uma árvore com $n$ nós tem, no mínimo, $\log_2n$ níveis e, no máximo $n$ níveis.

**Representação**
```c
typedef struct no {
  int dado;
  struct no *esq;
  struct no *dir;
} no;

no *raiz;
```