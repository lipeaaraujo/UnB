#exercises #todo 
## Parte A - Fundamentos da programação lógica

1. a) `time/3`, `campeao/1` e `selecionado/1`
   b) São 8 fatos, 3 regras e 11 cláusulas
   c) 
   ![[Pasted image 20250419214527.png]]
```prolog
time('5am, wood again', 2, 'mg').
time('Amigos do Mortandela', 3, 'mg').
time('C++ ou uma linguagem misteriosa?', 2, 'go').
time('Lone Wolves', 2, 'df').
time('Monkeys', 1, 'go').
time('Teorema de Off', 1, 'df').
time('Teorema do Chinês Viajante', 3, 'df').
time('Torcida Pão de Alho', 1, 'mg').

  

campeao(X) :- time(X, 1, _).
selecionado(X) :- campeao(X).
```

   ![[Pasted image 20250419214907.png]]

2. a) `false`
   b) `true`
   c) `X = a; X = b.`
   d) `Y = b, Y = c.`
   
3. Exibirá as variáveis lógicas e seus respectivos valores quando a consulta for bem sucedida sair pela porta `exit`. É possível inserir o ponto-e-vírgula quando existe mais que um fato que atenda a consulta, nesse caso o fluxo de controle volta pela porta `redo` onde a consulta é realizada novamente de onde parou.

4. Implementações:
```prolog
calouro(X) :- estudante(X, 1, _).

tem_calouros(X) :-
	matricula(X, Y),
	calouro(Y).

turma_mista(X) :-
	matricula(X, A),
	estudante(A, _, 'Engenharia de Software'),
	matricula(X, B),
	estudante(B, _, 'Engenharias'),
	matricula(X, C),
	estudante(C, _, 'Engenharia de Energia').

software :-
	write('Estudantes de Software:'), nl,
	estudante(X, _, 'Engenharia de Software'),
	write(X), nl,
	fail.
```

## Parte B - Regras

5. Implementação:
```prolog
siblings(X, Y) :-
	father(X, Z), father(Y, Z),
	mother(X, M), mother(Y, M),
	Y \= X.

uncle(X, Y) :-
	father(X, F),
	siblings(F, Y).
	male(Y).

uncle(X, Y) :-
	mother(X, F),
	siblings(F, Y),
	male(Y).

grandmother(X, Y) :-
	mother(X, M),
	mother(M, Y).

grandmother(X, Y) :-
	father(X, F),
	mother(F, Y).
```

6. 
$v^2 = v^2_0 + 2*a*\Delta s$
$\frac{v^2-v_0^2}{2*a} = s - s_0$
$s = \frac{v^2-v_0^2}{2*a} + s_0$
$s = \frac{v^2}{2a}+s_0$

Implementação:
```
distance(S, I, V, A) :-
	S is (V ** 2)/(2*A) + I.
```

7. 
```
divisors(Cnt, N, Cnt, D) :-

D > N.

  

divisors(X, N, Cnt, D) :-

write(D), nl,

D < N,

R is N rem D,

R == 0,

NewCnt is Cnt + 1,

NewD is D + 1,

divisors(X, N, NewCnt, NewD).

  

divisors(X, N, Cnt, D) :-

write(D), nl,

D < N,

R is N rem D,

R \= 0,

NewD is D + 1,

divisors(X, N, Cnt, NewD).
```

## Parte C - Funções

8. A consulta está realizando a chamada do predicado `is_set/1` com 3 argumentos (números inteiros separados), enquanto o predicado tem aridade 1 em que o parâmetro é uma **lista** de inteiros, diferente do que foi feito na consulta.

9. Esse consulta terá como resultado uma falha, pois na comparação `Y \= Z`, a variável `Y` não tem nenhum valor atado, sendo assim a operação falha.
   
   Observando o resultado, ao invés de um erro, foi retornado apenas um `false`. Mas ainda creio que pelo mesmo motivo, não foi atado um valor a `Y` em momento algum.
 
   A consulta será bem sucedida quando as variáveis forem atadas antes de haver a comparação, como abaixo:
   
```prolog
?- X = a, Y = X, W = b, Z = W, Y \= Z.
```

10. Na implementação o operador `=` está atando o valor de `rem(Y, 2)` em `rem(X, 2)` e não fazendo o que parece que é comparar os valores retornados por cada operação. Para isso podemos reescrever como a seguir:

```
same_parity(X, Y) :-
    R1 is rem(X, 2),
    R2 is rem(Y, 2),
    R1 == R2.
```