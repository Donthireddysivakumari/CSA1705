% sum_to_n(N, Sum) - Sum is the total of 1 + 2 + ... + N

sum_to_n(1, 1).  % Base case: sum of 1 is 1

sum_to_n(N, Sum) :-
    N > 1,
    N1 is N - 1,
    sum_to_n(N1, Sum1),
    Sum is Sum1 + N.
