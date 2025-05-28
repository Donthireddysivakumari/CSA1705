hanoi(1, S, T, _) :-
    write('Move disk from '), write(S), write(' to '), write(T), nl.
hanoi(N, S, T, A) :-
    N > 1,
    N1 is N-1,
    hanoi(N1, S, A, T),
    hanoi(1, S, T, _),
    hanoi(N1, A, T, S).
