square(Number):- Number<6, write(Number), Squared is Number*Number,write(' '), write(Squared),nl,NewNumber is Number+1, square(NewNumber).

edge(a,b).
edge(a,c).
edge(b,c).
edge(c,d).
edge(c,e).
edge(e,b).
edge(e,d).
path(X,Y):- edge(X,Y).
path(X,Y):- edge(X,Z), path(Z,Y).

factorial(I):- factorial(I,Carry), write('Ans= '), write(Carry), nl.
factorial(1,1).
factorial(I,Carry):- I > 1, NewI is I-1, factorial(NewI, NewCarry), Carry is NewCarry*I.
