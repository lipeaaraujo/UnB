same_parity(X, Y) :-
    R1 is rem(X, 2),
    R2 is rem(Y, 2),
    R1 == R2.