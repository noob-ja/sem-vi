p_c(tom, patricia).
p_c(tom, sarah).
p_c(tom, max).
p_c(lin, patricia).
p_c(lin, sarah).
p_c(lin, max).
p_c(jim, james).
p_c(patricia, james).
p_c(sarah, dora).
p_c(david, dora).
p_c(sarah, betty).
p_c(david, betty).

male(tom).
male(jim).
male(david).
male(max).
male(james).
female(lin).
female(patricia).
female(sarah).
female(dora).
female(betty).

father(X,Y):- p_c(X,Y), male(X).
mother(X,Y):- p_c(X,Y), female(X).
sibling(X,Y):- father(Z,Y), father(Z,X), mother(T,Y), mother(T,X), X\=Y.
sister(X,Y):- sibling(X,Y), female(X).
brother(X,Y):- sibling(X,Y), male(X).
aunty(X,Y):- p_c(Z,Y), sister(X,Z).
uncle(X,Y):- p_c(Z,Y), brother(X,Z).
cousin(X,Y):- p_c(Z,Y), sibling(T,Z), p_c(T,X).

ancestor(X,Y):- p_c(X,Y).
ancestor(X,Y):- p_c(Z,Y), ancestor(X,Z).
