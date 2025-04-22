#annotation #summary

- Um predicado é definido por cláusulas, as quais podem ser fatos ou regras.
- Sintaxe: `?- head :- body.`
- Exemplo:
```prolog
capitais(X,Y) :- regiao(Y, Z), cidade(X,Z), capital(X)
```
- Consultas:
```prolog
?- capitais(X, norte)
?- capitais(X, Y)
```

## Processamento das regras
1. Inicialmente, o objetivo é unificado com a head
2. Com a unificação sucedida, inicia-se uma consulta com os objetivos listados no corpo da regra

- Exemplo:
```prolog
connected(X, Y) :- edge(X, Y)
connected(X, Y) :- edge(Y, X)
```

**Variável anônima:**
- representada pelo símbolo '_' (underscore)
### Exemplo:
![[Pasted image 20250403190438.png]]

## Características do Prolog
- A unificação é o processo de **pattern matching** do Prolog, utilizada na comunicação entre fatos e regras
- A execução é controlada pelo mecanismo de **backtracking**, o `fail/0` pode ser usado para forçar o retorno do **backtracking** (via porta *fail*).
- O backtracking substitui os laços de outras linguagens.
## Operadores aritméticos
- Predicado pré-definido `is`. Sintaxe: `X is <expressão aritmética>`.
- A variável `X` é atada ao valor da expressão e é desatada no **backtracking**.
- As expressões são semelhantes às utilizadas em outras linguagens:
	- `?- X is 2 + 2.`
	- `?- X is 3*4 + 2.`
	- `?- X is 3*(4 + 2).`
## Operadores relacionais
- `X > Y`
- `X < Y`
- `X >= Y`
- `X <= Y`
- `X \= Y` (`X` é diferente de `Y`)
## Manipulação na base de dados
- `asserta(X)`: adiciona a cláusula `X` como primeira cláusula para o seu predicado.
- `assertz(X)`: igual anterior, mas adiciona como última cláusula do predicado.
- `retract(X)`: remove a cláusula `X` da base de dados. É preciso que a cláusula seja dinâmica.

**Predicado dinâmico:**
```prolog
:- dynamic
	pred/N
```

## Variáveis globais
- Não há variáveis globais: são locais às cláusulas
- Base de dados "substitui" as variáveis globais.
- `asserts` e `retracts` são as ferramentas para manipular os dados da base, dados estes que correspondem às variáveis globais.
- Alguns programadores tentam eliminar dados globais e o uso de `asserts` e `retracts` em seus código Prolog.

### Programas sem variáveis globais
- É possível escrever programas que não modificam a base de dados, o que elimina o problema das variáveis globais.
- A versão de `assert` apresentada a seguir desfaz seu trabalho no `backtracking`:
```
backtracking_assert(X) :-
	asserta(X).
backtracking_assert(X) :-
	retract(X), fail.
```

- Inicialmente, a primeira cláusula é executada
- Se um objetivo posterior falhar, o *backtracking* vai tentar a segunda cláusula, que desfará o trabalho da primeira e falhar, resultando no efeito desejado.

## Recursão
- Em Prolog, a recursão acontece quando um predicado contém um objetivo que se refere ao próprio predicado
- A recursão acontece naturalmente em Prolog, cada consulta usa o corpo da regra para criar uma nova consulta com novas variáveis
- Chamada recursiva são compostas por duas partes:
	1. casos-base e
	2. chamada recursiva

**Exemplo de recursão:**
```prolog
% Implementação recrusiva da função fatorial
fact(F, 0) :- F is 1.
fact(F, N) :-
	N > 0,
	NewN is N - 1,
	fact(X, NewN),
	F is X*N.

% Implementação recursiva de cauda
factTR(F, 0, Acc) :- F is Acc.
factTR(F, N, Acc) :-
	N > 0,
	NewN is N - 1,
	NewAcc is Acc * N,
	factTR(F, NewN, NewAcc).

factorial(F, N) :- factTR(F, N, 1).
```
### Características da recursão em Prolog
- O escopo das variáveis de uma regra é a própria regra
- Os casos bases devem ser definidos antes da chamada recursiva
- Na cláusula de chamada recursiva, é preciso garantir que os valores não correspondem aos casos bases
- **Importante:** a ordem dos predicados na recursão pode afetar a performance.

## Estruturas de dados em Prolog
- Combina termos primitivos (átomos, inteiros, etc) e estruturas em tipos compostos
- Sintaxe:
```
functor(arg1, arg2, ..., argN).
```
- Cada argumento pode ser um tipo primitivo ou outra estrutura

### Exemplo:
```
car(peugeot, black, 2).
car(honda, red, 4).
```

### Consultas envolvendo estruturas de dados
- A ordem dos argumentos é importante nas consultas
```prolog
car(X, red, _)
```

> [!tip]
> Campos podem ser ignorados com a variável anônima

- Aumentando legibilidade
```prolog
car(honda, color(red), doors(4)).
```

- O predicado `not/1` recebe um objetivo como argumento e é bem sucedida quando o objetivo falha, e falha quando o objetivo é bem sucedido

### Exemplo de estruturas recursivas
![[Pasted image 20250408192804.png]]
![[Pasted image 20250408192844.png]]

>[!tip]
>O predicado `succ/2` retorna o valor sucessor. **Exemplo:** `succ(1,Y).` retorna `2`, `succ(Y,1).` retorna `0`.

