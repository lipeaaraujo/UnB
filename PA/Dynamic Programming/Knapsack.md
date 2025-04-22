**Definição:** Problema de maximizar o preenchimento de uma mochila com o máximo de itens possíveis, sendo que cada item tem um **valor** e **peso** e a mochila tem um limite de peso.

- Dado $n$ objetos e uma "mochila".
- O item $i$ tem um peso $w_i > 0$ quilogramas e tem valor $v_i > 0$
- Pesos são inteiros
- A mochila tem capacidade de $W$ quilogramas
- Objetivo: encher a mochila ao máximo de itens.

**Algoritmo Ambicioso:** repetidamente adicionar o item com a máxima razão $v_i / w_i$.

### Template inicial

**Def.** $OPT(i)$ = arrecadação máxima de um subconjunto de itens $1, ..., i$

- **Caso 1:** $OPT$ não seleciona o item $i$
	- $OPT$ seleciona o melhor de $\{1,2,...,i-1\}$.
- **Caso 2:** $OPT$ seleciona o item $i$
	- aceitando o item $i$ não significa que vamos imediatamente rejeitar outros itens
	- sem saber os itens selecionados antes de $i$, nem sabemos se teremos espaço para $i$

**Conclusão:** precisamos de mais sub-problemas

### Nova variável

Def. $OPT(i, w)$ = arrecadação máxima do conjunto de itens $1, ..., i$ com limite de peso $w$.

- Caso 1: $OPT$ não seleciona o item $i$.
	- $OPT$ seleciona o melhor de $\{1,2,...,i-1\}$ usando o limite de peso $w$.
- Caso 2: $OPT$ seleciona o item $i$
	- Novo limite de peso = $w - w_1$
	- $OPT$ seleciona o melhor de $\{1,2,...,i-1\}$ usando o novo limite de peso

## Execução

![[execução-knapsack.excalidraw]]