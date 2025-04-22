> [!definição]
> **Definição:** Algoritmo que tem como objetivo o calculo de menor caminho em um grafo, similar ao Dijkstra, porém que permite pesos negativos.

**Restrição:** Não pode existir ciclos negativos no grafo.

O número de linhas das matrizes é relacionada a quantidade de nós do grafo. 
$$ numLinhas = nos - 1 $$
A matriz de vizinhos pode ser convertida em um vetor, a rastreabilidade do menor custo pode ser feita com a última linha individualmente.
## Execução
![[execucao-bellmond-ford.excalidraw]]