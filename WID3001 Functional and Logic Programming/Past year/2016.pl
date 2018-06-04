%2016
%Q3
:-op(100,yfx,[*,/]).
:-op(200,yfx,[+,-]).

%Q4
ci(t4,t3):-!.
ci(t3,t2):-!.
ci(t2,t1):-!.
ci(t1,_):- !, fail.
ci(X,Y):- ci(X,Z), ci(Z,Y).

%Q5
si(Score, I):- Score<2.58, I = 'Optimum', !.
si(Score, I):- Score=<3.34, I= 'Near Optimum', !.
si(Score, I):- Score=<4.11, I= 'Borderline', !.
si(Score, I):- Score=<4.89, I= 'High', !.
si(_, I):- I= 'Very High', !.