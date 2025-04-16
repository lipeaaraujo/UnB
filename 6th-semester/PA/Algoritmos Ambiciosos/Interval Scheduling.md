**Definição:** Algoritmo para a resolução ótima de várias tarefas, buscando encontrar o maior subconjunto de tarefas que são compatíveis.

- Cada tarefa $j$ começa em $s_{j}$ e termina em $f_j$.
- Duas tarefas só são **compatíveis** se elas não se sobrepõem.
- **Objetivo:** achar o maior subconjunto de tarefas mutualmente compatíveis.

### Template ambicioso

Utilize alguma ordem para as tarefas. Selecione cada tarefa contando que é compatível com as que já foram selecionadas

- [Earliest start time]: Tarefas em ordem crescente de horário de começo $s_j$.
- [Earliest finish time]: Tarefas em ordem crescente de horário de término $f_j$.
- [Shortest interval]: Tarefas com o menor intervalo de tamanho $f_j - s_j$.
- [Fewest conflicts]: Tarefas em ordem do menor número de conflitos com outras tarefas $c_j$.

Para critério de escolha, busque contra-exemplos que venham possivelmente quebrar a ordem escolhida (ou seja, não te permitem chegar a solução ótima):

- Exemplo contra [earliest start time]: 
	![[Pasted image 20250116231531.png]]
- Exemplo contra [shortest interval]: 
	![[Pasted image 20250116231618.png]]
- Exemplo contra [fewest conflicts]: 
	![[Pasted image 20250116231641.png]]

O único sem contra-exemplo foi o **[earliest finish time]**

## Algoritmo Ambicioso

Considere todas as tarefas em ordem crescente de tempo de término. Selecione cada tarefa contando que seja compatível com as já selecionadas

```
Sort jobs by finish times so that f1 <= f2 <= ... <= fn.

A <- null
for j = 1 to n {
	if (job j compatible with A)
		A <- A u {j}
}
return A
```

### Implementação

- Complexidade: O(n log n).
- Lembrar a última tarefa $j*$ que foi adicionada a $A$.
- A tarefa $j$ é compatível com $A$ se $s_j \ge f_{j*}$.

## Análise

- **Soluções ótimas:** o algoritmo sempre vai achar uma solução ótima, mas podem existir várias.