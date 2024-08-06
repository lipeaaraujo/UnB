# Listas Encadeadas

São uma forma de armazenar um conjunto de dados alternativa a vetores.

| Vetores | Listas |
|---------|--------|
| contíguo | não contígua |
| aumentar custa O(n) | aumentar custa O(1) |
| acessar custa O(1) | acessar custa O(n) (não-indexado) |
| diminuir custa O(n) ou subutiliza espaço | diminuir custa O(1) |

$ [ head |\;] \rightarrow [ dado |\;] \rightarrow [ dado |\;] \rightarrow NULL $

```c
typedef struct {
  int dado;
  Struct no *prox;
} no;
```
**Lista vazia:**

$ [ head |\;] \rightarrow  NULL $