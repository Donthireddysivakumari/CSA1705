% bird(Name, can_fly).
bird(eagle, yes).
bird(penguin, no).
bird(sparrow, yes).
bird(ostrich, no).
bird(parrot, yes).

% can_fly_query(Bird) succeeds if the bird can fly.
can_fly_query(Bird) :-
    bird(Bird, yes),
    write(Bird), write(' can fly.'), nl.

% cannot_fly_query(Bird) succeeds if the bird cannot fly.
cannot_fly_query(Bird) :-
    bird(Bird, no),
    write(Bird), write(' cannot fly.'), nl.
