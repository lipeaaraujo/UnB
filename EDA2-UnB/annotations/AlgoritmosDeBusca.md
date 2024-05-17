## O problema de busca
*Aula dia 10/04/2024*

Consiste em determinar se um elemento x pertence ou não a um determinado conjunto.

Suponha que temos:
- um conjunto universo com **S** elementos.
- um conjunto de dados com **N** elementos.
- deseja-se realizar **M** consultas.

### 1. Busca sequencial
```c
int buscaSequencial(int *v, int n, int x) {
  for(int i=0; i<n; i++) {
    if(v[i] == x) return 1;
  }
  return 0;
}
```
Considerando que queremos realizar M consultas, o custo total é m.O(n) = O(m.n).

### 2. Busca binária
**Premissa:** o conjunto precisa estar ordenado.

Para realizar M consultas:
1. Ordenar v. *O(nlg(n))*.
2. Aplicar M buscas binárias. *M.O(lg(n))*.

Logo, o custo total é *O(nlg(n)) + M.O(lg(n)) = O((n+m)lg(n))*

Até o momento, **busca sequencial** compensa se m for O(1). Se m for O(lg(n)) são similares. Demais casos **busca binária** é mais rápido.

### 3. Endereçamento direto
1. Uso um vetor V de Os e 1s de tamanho **S**.
2. Para cada elemento y do conjunto, marca **V[y - offset]** como sendo 1, os demais 0. *(offset: o menor elemento do conjunto universo)*

```c
int buscaEnderecada(char *v, int x) {
  return v[x - OFFSET];
}
```
Considerando m buscas, o custo é **O(m) + O(S) de memória auxiliar**

### 4. Tabela HASH
Cada <ins>chave</ins> é mapeada em uma <ins>tabela</ins> (vetor ou lista encadeada), cuja posição é determinada por uma função de espalhamento (função hash).

A ideia é que o tamanho da tabela seja menor que **S**. Nesse caso, pode ocorrer uma <ins>**colisão**</ins>, ou seja, duas chaves distintas serem mapeadas para a mesma posição na tabela.