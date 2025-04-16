- Um predicado é definido por clausulas, as quais podem ser fatos ou regras.
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

## Operadores aritméticos

## Operadores relacionais

- `X > Y`
- `X < Y`
- `X >= Y`
- `X <= Y`
- `X \= Y`
## Manipulação na base de dados
- `asserta(X)`:
- `assertz(X)`
- `retract(X)`

Predicado dinâmico:
```prolog
:- dynamic
	pred/N
```

## Variáveis globais
- Não há variáveis globais: são locais às cláusulas
- Base de dados "substitui" as variáveis globais

### Programas sem variáveis globais

## Recursão
- Em Prolog, a recursão acontece quando um predicado contém um objetivo que se refere ao próprio predicado
- A recursão acontece naturalmente em Prolog, cada consulta usa o corpo da regra para criar uma nova consulta com novas variáveis
- Chamada recursiva são compostas por duas partes:
	1. casos-base e
	2. chamada recursiva

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

