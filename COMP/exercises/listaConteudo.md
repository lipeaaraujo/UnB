# Lista pré-Prova 2

Link da lista: 
https://brunoribas.com.br/compiladores/2019-1/lista-offline/t.html

1. GLC é a sigla para Gramática Livre de Contexto, é uma maneira poderosa de descrever linguagens formal, formada por um conjunto de regras de produção que envolve terminais e não-terminais, as GLC geram cadeias aplicando regras de produção repetidamente, essas cadeias podem ser representadas por árvores de derivação.

2. G = $\{V, \Sigma, R, S\}$, onde
- V = As variáveis ou não-terminais
- $\Sigma$ = Os terminais da gramática
- R = As regras de produção da gramática
- S = O símbolo inicial

3. 
```mermaid
graph TD;
A((E))-->B((T))-->C((F))-->D(((a)))

E((E))-->F((E))-->G((T))-->H((F))-->I(((a)))
E-->J(((+)))
E-->K((T))-->L((F))-->M(((a)))

N((E))-->O((E))-->P((T))-->Q((F))-->R(((a)))
O-->S(((+)))
O-->T((T))-->U((F))-->V(((a)))
N-->W(((+)))
N-->X((T))-->Y((F))-->Z(((a)))

A1((E))-->B1((T))-->C1((F))-->D1((("(")))
C1-->E1((E))-->F1((F))-->G1(((a)))
C1-->H1(((")")))
```

4. 
- R, S, T, X
- a, b, $\epsilon$
- R
- Verdadeiro
- Falso
- baa, ab, aaba
- a, b, aa

5. 
- V = {< STMT >, < ASSIGN >, < IF-THEN >, < IF-THEN-ELSE >}
- $\Sigma$ = {if, condition, then, a, :=, 1}

A regra do if-then-else pode causar ambiguidade pois a regra else pode ser associada ao if mais interno ou ao if mais externo.