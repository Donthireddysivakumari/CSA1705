% Facts: fruit_color(Fruit, Color)
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(lemon, yellow).
fruit_color(cherry, red).

% Query to find fruits of a certain color
fruits_of_color(Color, Fruit) :-
    fruit_color(Fruit, Color).

% Query to find colors of a fruit
colors_of_fruit(Fruit, Color) :-
    fruit_color(Fruit, Color).
