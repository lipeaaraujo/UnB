**Definição:** 

**Objetivo:** dado duas strings $x=x_1 x_2 ... x_m$ e $y=y_1 y_2 ... y_n$. Encontre o alinhamento de menor custo.

**Definições:**
- Um alinhamento M é um conjunto de pares ordenados $x_i y_j$ tal que cada item ocorre no máximo em um par e sem cruzamentos.

- O par $x_i - y_j$, e o par 

$OPT(i,j) =$ custo mínimo de alinhar as strings  $x=x_1 x_2 ... x_m$ e $y=y_1 y_2 ... y_n$..

|     |     | T   | A   | C   | A   | T   | G   |
| --- | --- | --- | --- | --- | --- | --- | --- |
|     | 0   | 2   | 4   | 6   | 8   | 10  | 12  |
| C   | 2   | 3   | 5   | 4   | 6   | 8   | 10  |
| T   | 4   | 2   | 4   | 6   | 7   | 6   | 8   |
| A   | 6   | 4   | 2   | 4   | 6   | 8   | 9   |
| C   | 8   | 6   | 4   | 2   | 4   | 6   | 8   |
| C   | 10  | 8   | 6   | 4   | 5   | 7   | 9   |
| G   | 12  | 10  | 8   | 6   | 7   | 8   | 7   |
## Execução

![[execucao-sequence-alignment.excalidraw]]