#summary 
### Produto cartesiano
Sejam $A$ e $B$ dois conjuntos. O produto cartesiano é o conjunto de todos os pares ordenados cujo primeiro componente é um elemento $A$ e o segundo componente é um elemento de $B$.

$$ A \times B = \{(a,b) \vert a \in A, b \in B \}$$
### Relações e Funções
Uma **relação** entre dois conjuntos é um subconjunto de seu produto cartesiano.

Uma relação $f$ de $A$ em $B$ é uma **função** se, para qualquer $a \in A$ existe um único $b \in B$ tal que $(a,b) \in f$.

> Notação: $f : A \rightarrow B$

### Domínio, imagem e gráfico

O conjunto $A$ é denominado **domínio** da função $f$ e o  conjunto $B$ é o **contradomínio**. Além disso o conjunto $Img(f)$ é a **imagem** da função, tal que: 

$$ Img(f) = \{ b \in B \, \vert \, \exists a \in A \rightarrow f(a) = b \} $$
ou
$$ Img(f) = f(A) $$
O **gráfico** de $f$ é o conjunto:

$$ Gr(f) = \{ (x, f(x)) \, \vert \, x \in A \} $$
## Composição de funções

Sejam $f : A \rightarrow B$ e $g : C \rightarrow D$ duas funções. Se $f(A) \subset C$, então a **função composta** $h A \rightarrow D$ é definida como
$$h(x)=(g \circ f)(x) = g(f(x))$$
Em geral $(g \circ f)(x) \neq g(f(x))$.

## Funções injetoras, sobrejetoras e bijetoras

Seja $f : A \rightarrow B$ uma função
1. f é **injetora** se $f(x) = f(y)$ implica $x=y$, para todos $x,y \in A$.
2. f é **sobrejetora** se $Img(f)=f(A)=B$
3. f é dita **bijetora** se é injetora e sobrejetora

Em uma função injetora, cada elemento do contradomínio $B$ pode estar relacionado a, no máximo, um elemento do domínio $A$, em uma função sobrejetora, todos os elementos de $B$ devem estar associados a, no mínimo, um elemento de $A$.
