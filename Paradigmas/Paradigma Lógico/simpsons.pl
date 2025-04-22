male(abraham).
male(herb).
male(homer).
male(bart).
male(clancy).

female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

father(herb, abraham).
father(homer, abraham).
father(bart, homer).
father(lisa, homer).
father(maggie, homer).
father(marge, clancy).
father(patty, clancy).
father(selma, clancy).

mother(homer, mona).
mother(marge, jackie).
mother(patty, jackie).
mother(selma, jackie).
mother(bart, marge).
mother(lisa, marge).
mother(maggie, marge).
mother(ling, selma).

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

