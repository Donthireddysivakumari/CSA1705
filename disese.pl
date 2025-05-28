% diet(Disease, DietSuggestion).

diet(diabetes, 'Low sugar, high fiber diet').
diet(hypertension, 'Low salt, DASH diet').
diet(obesity, 'Low calorie, balanced diet').
diet(anemia, 'Iron rich foods diet').
diet(heart_disease, 'Low fat, Mediterranean diet').
diet(gout, 'Low purine diet').

% Rule to suggest diet
suggest_diet(Disease) :-
    diet(Disease, Diet),
    write('For '), write(Disease), write(', suggested diet is: '), write(Diet), nl.
