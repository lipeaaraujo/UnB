# Tabelas de dispersão (hashing)

- conjunto universo de tamanho $S$.
- conjunto de dados de tamanho $n$.

Construir uma tabela de tamanho $T < S$.
- <ins>colisão</ins>: duas chaves ocupam a mesma posição na tabela.
- <ins>função de espalhamento</ins>: dada uma chave x, a posição na tabela será $hash(x)$. $hash: U \rightarrow \left\{ 0,...,T-1 \right\}$

Para implementar tabelas hash, precisamos de:
1. uma forma de armazenamento da tabela.
2. uma função de espalhamento.
3. um método para lidar com colisões.

## Função de espalhamento

A função hash ideal preencheria toda a tabela sem colisões. A primeira colisão aconteceria apenas quando $n>T$. **(hash universal uniforme)**.

A função hash mais comum segue o <ins>método da divisão<ins>

```c
int hash(int x) {
  return x % T;
}
```

### 1. Encadeamento separado

| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
|---|---|---|---|---|---|---|---|---|---|
| N | 81 | 72 | | 24 | | | | | |
| | N | N | | N | | | | | |

**Implementação**
```c
typedef struct No{
  int dado;
  struct No *prox;
} No;

typedef struct {
  No *tab;
  int T;
} TabelaHash;

void cria_tabela(TabelaHash *h, int T);
void destroi_tabela(TabelaHash *h);
void insere(TabelaHash *h, int x);
void remove(TabelaHash *h, int x);
int busca(TabelaHash *h, int x);
```
**Algoritmo de busca:**
```c
int busca(TabelaHash *h, int x) {
  No *p = h->tab[hash(x)]->prox;
  while (p != NULL) {
    if(p->dado == x) return 1;
    p = p->prox;
  }
  return 0;
}
```
Portanto, uma boa implementação de hash consiste em **limitar o total de colisões**. Isso pode ser feito:
- escolhendo uma função hash ótima (pode exigir o conhecimento sobre o conjunto de dados).
- limitar as colisões na inserção (consequentemente, podemos ter tabela cheia).

Boas escolhas para $T$: <ins>números primos</ins>, preferencialmente bem maior que $n$.


