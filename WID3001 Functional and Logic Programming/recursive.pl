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

%TUTORIAL
%Q1
loop(0).
loop(X):- X>0, write('The value is: '), write(X), nl, Y is X-1, loop(Y).
%Q2
sum_of_digit(X, SUM):- X<10, SUM is X.
sum_of_digit(X, SUM):- T is X mod 10,Y is X//10,X>=10, sum_of_digit(Y, NewSUM),SUM is NewSUM+T.
%Q3
go:- repeat, write('Enter a number (0 to exit): |: '), 
    read(X), 
    Y is sqrt(X), 
    write('The square root of the number is: '),write(Y),nl,
    (X=0,!;fail).
%Q4
pyramid(Level):- Level > 0, 
    N is Level,
    repeat,
    write('*'),N is -(N,1),(N=0,!;fail),
    nl,
    Next is Level - 1, 
    pyramid(Next).
