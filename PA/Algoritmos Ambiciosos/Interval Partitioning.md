**Definição:** Algoritmo ambicioso utilizado para achar o menor número de processos ou espaços necessários para realizar um certo número de tarefas dentro de um intervalo, de forma que as tarefas nunca aconteçam ao mesmo tempo no mesmo processo ou espaço.

- Uma aula $j$ começa em $s_j$ e termina em $f_j$.
- **Objetivo:** encontrar o menor número de salas para agendar todas as aulas, de forma que nenhuma aula aconteça no mesmo tempo que a outra em uma mesma sala.

### Borda inferior da solução ótima

- A **profundidade** de um conjunto de intervalos abertos é a quantidade **máxima** de tarefas ocorrendo em qualquer tempo.

$$ Number \, of \, classrooms \, needed \ge depth. $$
- Então um agendamento ótimo é menor ou igual a profundidade dos intervalos.

## Algoritmo Ambicioso

Considere as aulas em ordem crescente do tempo de início, selecione as aulas para qualquer sala compatível

```bash
Sort intervals by starting time so that s1 <= s2 <= ... <= sn.
d <- 0

for j = 1 to n {
	if (lecture j is compatible with some classroom k)
		schedule lecture j in classroom k
	else
		allocate a new classroom d + 1
		schedule lecture j in classroom d + 1
		d <- d + 1
}
```

**Observação:** O algoritmo nunca vai alocar duas aulas para a mesma sala.

---
### Implementação

- **Complexidade:** $O(n²)$
- Para cada sala de aula $k$, mantenha o horário de término da última aula $j$ adicionada.
- Mantenha as salas em uma lista.

1. Comparando o tempo de início de $j$ com o tempo de término de cada aula: $O(n)$
2. Agendar aula numa sala $k$: $O(1)$
3. Alocar uma nova sala na lista de salas com tempo de término $f_j$: $O(1)$

---

- **Complexidade:** $O(n \log{n})$ (usando heap de **maior horário de término**)
- Para cada sala de aula $k$, mantenha o horário de término da última aula $j$ adicionada.
- Mantenha as salas em uma **heap de prioridade**.

1. Comparar o tempo de início de $j$ com o tempo de término da sala $k$ no topo da heap. $O(1)$
2. Agendar aula na sala $k$ e atualizar heap. $O(\log{n})$
3. Alocar nova sala na heap. $O(\log{n})$