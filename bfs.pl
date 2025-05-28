% Define edges: edge(From, To)
edge(a, b).
edge(a, c).
edge(b, d).
edge(c, d).
edge(d, goal).

% Define heuristic values (smaller is better)
heuristic(a, 5).
heuristic(b, 3).
heuristic(c, 4).
heuristic(d, 1).
heuristic(goal, 0).

% Best First Search main rule
best_first(Start, Goal, Path) :-
    bfs([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

% Stop when goal is reached
bfs([[Goal|Rest]|_], Goal, [Goal|Rest]).

% Continue searching
bfs([[Current|RestPath]|OtherPaths], Goal, FinalPath) :-
    findall([Next, Current|RestPath],
        (edge(Current, Next), \+ member(Next, [Current|RestPath])),
        NewPaths),
    append(OtherPaths, NewPaths, AllPaths),
    sort_by_heuristic(AllPaths, SortedPaths),
    bfs(SortedPaths, Goal, FinalPath).

% Sort paths based on heuristic of the head node
sort_by_heuristic(Paths, Sorted) :-
    map_list_to_pairs(path_heuristic, Paths, Pairs),
    keysort(Pairs, SortedPairs),
    pairs_values(SortedPairs, Sorted).

% Get heuristic of first node in path
path_heuristic([Node|_], H) :-
    heuristic(Node, H).
