% Rules for diagnosis
disease(flu) :-
    has(fever),
    has(cough).

disease(cold) :-
    has(runny_nose),
    has(sneezing).

disease(covid19) :-
    has(fever),
    has(cough),
    has(loss_of_taste).

% Ask symptoms
start :-
    write('Answer with yes or no.'), nl,
    ask(fever),
    ask(cough),
    ask(runny_nose),
    ask(sneezing),
    ask(loss_of_taste),
    (disease(D) ->
        write('You may have: '), write(D), nl ;
        write('No matching disease found.'), nl),
    clear_answers.

% Asking function
ask(Symptom) :-
    write('Do you have '), write(Symptom), write('? '),
    read(Reply),
    (Reply == yes -> assert(has(Symptom)) ; true).

% Clear stored facts
clear_answers :-
    retractall(has(_)).
