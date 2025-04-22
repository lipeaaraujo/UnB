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