# Analíse sintática ascendente

Analisadores LR, utilizam a tabela shift-reduce = tabela sintática para gramática LR

Existem 3 técnicas para construir tabelas sintáticas para gramáticas LR

- Simple LR (SLR)
- LR canônico
- Look Ahead LR (LALR)

## Análise SLR

Construção da tabela SLR
- baseado em conjuntos
- cada conjunto será um estado do analisador
- nos conjuntos, utiliza-se um ponto (.) para indicar quais símbolos já foram analisados
- os conjuntos são criados a partir de duas operações:
1. **Transição(E,S)**
2. **Fechamento ou Closure**

### Transição (E,S)

É o conjunto composto pelas produções do estado E caso o simbolo S seja processado

Para cada $S_k \in S$, existe um conjunto Transição $(E_1,S_k)$
- Todos os itens do estado $E_0$ da forma $A \rightarrow \alpha . S_k \beta$
- No conjunto Transição $(E_1,S_k)$ os itens serão da forma $A \rightarrow \alpha S_k . \beta$

### Fechamento (I) ou Closore (I)

Construído a partir do conjunto transição, adiciona as produções que podem ser alcançadas a partir de S

- Todas $i's$ (regras de produção) encontradas em transição(E,S) serão incluídos em Fechamento(I)
- Se $A \rightarrow \alpha . S_k \beta \in$ Fechamento(I) e $S_k \rightarrow y$
- Então incluir $S_k \rightarrow. y$ em Fechamento(I)

Somente válido para $S_k \in$ Simbolos não terminais