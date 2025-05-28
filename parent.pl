% Facts: parent(Parent, Child)
parent(john, mary).
parent(john, mike).
parent(linda, mary).
parent(linda, mike).

% Rule: siblings have the same parent
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y.
