**Definição:** Algoritmo desenvolvido por Kruskal para achar a **árvore geradora mínima** de um grafo considerando uma ordem crescente de pesos e a verificação por ciclos.

- Considerar arestas em ordem crescente de peso.
- **Caso 1:** se adicionar $e$ a $T$ cria um ciclo, então descarte $e$ (a solução ótima da árvore geradora mínima não tem ciclo).
- **Caso 2:** caso contrário, insira $e=(u,v)$ em $T$.

## Algoritmo

- Utilizar uma estrutura de dados **[union-find](Union-Find.md)**.
- Construir um conjunto $T$ de arestas no MST.
- Manter o conjunto para cada componente conectado.
- Complexidade: $O(m\log{n})$ para ordenação e $O(m\,\alpha\,(m,n))$ para o **union-find**.

```bash
Kruskal(G,c) {
	Sort edges weights so that c1 <= c2 <= ... <= cm.
	T <- null
	
	foreach (u in V) make a set containing singleton u

	for i = 1 to m
		(u, v) = e_i
		if (u and v are in different sets) {
			T <- T union {e_i}
			merge the sets containing u and v
		}
	return T
}
```

## Execução

![[kruskal.excalidraw]]