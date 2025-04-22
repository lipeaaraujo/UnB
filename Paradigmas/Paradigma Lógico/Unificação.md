#annotation #summary #todo 
## Igualdade

## Variáveis e unificação

## Listas em prolog
- Sintaxe `[term1, term2, ..., termN]`
- Termos podem ser qualquer tipos de dados do Prolog, incluindo estruturas e outras listas
- Lista vazia `[]` ou `nil`.
## Casamento de padrão em listas
- Notação `[X|Y]`, `X` ou *head* vira o primeiro elemento e `Y` ao resto, denominados *tail*.
- Podem ser listados vários elementos antes da barra, separados por vírgulas `[A, B|T] = [1, 2, 3, 4, 5]`.

## Listas e predicados
- Listas são predicados com dois argumentos, primeiro é o *head* e o segundo é o *tail*.

## Teste de pertinência
- O predicado `member/2` determina se um termo é membro ou não da lista
```prolog
member(H, [H|T]).
member(X, [H|T]) := member(X,T).
```

## Concatenação de listas
- O predicado `append/3` anexa o segundo argumento ao primeiro, guardando o resultado no terceiro:
```prolog
?- append([1,2], [3,4,5], X).
X = [1,2,3,4,5].
```

- Implementação
```prolog
append([], X, X).
append([H|T1], X, [H, T2]) :-
	append(T1, X, T2).
```

- Também pode ser utilizado para decompor listas:
```prolog
?- append(X, Y, [1,2,3]).
X = [], Y = [1,2,3];
X = [1], Y = [2,3];
X = [1,2], Y = [3];
X = [1,2,3], Y = [];
false.
```

## Listas e fatos
- É possível criar vários fatos a partir de uma única lista.
```prolog
list_to_facts([]).
list_to_facts([H|T]) :-
	assertz(fact(H)),
	list_to_facts(T).
```

- `findall/3`:
```
findall(X, fact(X), L).
```

## Operadores e construtores
- Operadores aritméticos em Prolog são construtores (functors)

## Ordem de precedência
- diretiva `op/3`

## Fatos e operadores

## Associatividade de operadores

## Predicado `is`
- O predicado pré-definido `is` computa a expressão dada:
```prolog
?- X is 2 + 3
X = 5

?- X = 2 + 3.
X = 2+3.

?- 5 = 2 + 3.
false.
```

- O predicado `=/2` unifica os resultados sem computá-los.

## Operador pescoço
- Em Prolog, as clásulas são estruturas de dados escritas com sintaxe de operadores
- Construtor pescoço (*neck*) `:-` é um operador infixado de dois argumentos
```
:-(Head, Body).
```

- O corpo é uma estrutura de dados com o construtor `and` (vírgula):
```
,(objetivo1, ,(objetivo2, ..., ,(objetivoN)))
```

- Vírgula funciona tanto como separador dos argumentos quanto como "e" lógico.

## Predicado `cut`
- Predicado cut `!` permite a interrupção do backtracking.
- Congela todas as decisões tomadas pelo *backtracking*.
- Usado para aumento de performance
- É considerado o **goto** do paradigma

## Negação
- O `not/1` é implementado em termos do operador *cut* e do predicado `call/1`:
```prolog
not(X) :- call(X), !, fail.
```

