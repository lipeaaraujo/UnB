**Definição:** É uma estrutura de dados que facilita operações de achar uma raiz de um nó específico e de unificar duas árvores separadas, atualizando a informação de qual é o nó raiz.

- Utilizando uma árvore binária normal, é necessário $O(\log{n})$ para encontrar a raiz de um nó.
- Guardando a informação da raiz no nó diminui para $O(1)$.
- Porém, para unir duas árvores diferentes é necessário atualizar a raiz de todos os nós. $O(n)$.

Para o seguinte grafo, a estrutura **Union-Find** pode ser observada na tabela abaixo:

![[Pasted image 20250117021354.png]]

| **A** | **B** | **C** | **D** | **E** | F   |
| ----- | ----- | ----- | ----- | ----- | --- |
| 1     | 1     | 1     | 1     | 1     | 1   |
| A     | B     | C     | D     | E     | F   |



