**Definição:** Problema similar ao do [[Interval Scheduling]], porém as tarefas tem um **peso** associado

**Relembrando:** O algoritmo ambicioso funciona se todos os pesos forem 1
- Considerar as tarefas em ordem ascendente de tempo de término
- Adicione a tarefa ao sub-conjunto se ela for compatível com as outras

**Observação:** O algoritmo ambicioso pode falhar espetacularmente com pesos arbitrários

## Ideia

**Notação:** Nomear as tarefas por tempo de término: $f_1 \le f_2 \le ... \le f_n$.
**Definição:** $p(j)$ = maior index $i \lt j$ dado que cada tarefa $i$ é compatível com $j$

**Exemplo:** $p(8)=5$, $p(7)=3$, $p(2) = 0$.

![[Pasted image 20250120105121.png]]
### Escolha binária

Notação: $OPT(j) =$ valor da solução ótima de um problema consistindo das tarefas $1,2,...,j$

- **Caso 1:** OPT seleciona a tarefa $j$.
	- Não pode usar as tarefas incompatíveis
	- Deve incluir a solução ótima para o problema consistindo das tarefas restantes $1,2,...,p(j)$
- **Caso 2:** OPT não seleciona a tarefa $j$.
	- Deve incluir a solução ótima dos problemas consistindo das tarefas compatíveis restantes $1,2,...,j-1$.

$OPT(j) = $

### Força bruta

**Observação:** O algoritmo recursivo falha de forma espetacular por causa de sub-problemas redundantes => algoritmos exponenciais

**Exemplo:** O número de chamadas recursivas para família de instâncias "camadas" cresce como a sequência de Fibonacci

## Algoritmo

## Execução

![[execução-weighted-interval-scheduling.excalidraw]]