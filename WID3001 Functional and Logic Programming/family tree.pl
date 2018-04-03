p_c(gg, bapak).
p_c(bapak, tom).
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
son(X,Y):- p_c(Y,X), male(X).
daughter(X,Y):- p_c(Y,X), female(X).
ancestor(X,Y):- p_c(X,Y).
ancestor(X,Y):- p_c(Z,Y), ancestor(X,Z).

%tutorial 8
/*
 * Q2a. sister(X,Y)
 *  X = sarah,
    Y = patricia
    X = patricia,
    Y = sarah
    X = patricia,
    Y = max
    X = sarah,
    Y = max
    X = betty,
    Y = dora
    X = dora,
    Y = betty
 * b. father(david,_) : true
 * c. aunty(X,james) : sarah
 * d. aunty(patricia, dora) : true
 * e. cousin(james, X) : dora, betty
 * f. mother(X,betty), aunty(X,james) : sarah
 * g. \+p_c(tom,patricia) : false
 * h. p_c(max,_); cousin(max,betty) : false
 */
