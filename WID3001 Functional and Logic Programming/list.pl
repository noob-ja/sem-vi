conc([],L,L).
conc([X|L1],L2,[X|L3]):- conc(L1,L2,L3).

% Example conc([a,b], [c,d], R)
% 1 - X = a, L1 = b, L2 = [c,d], L3 = [X' | L3']
% 2 - X' = b, L1' = [], L2 = [c,d], L3' = [X'' | L3'']
% 3 - X'' = [], L1'' = [], L2 = [c,d], L3'' = L2
% 2 - X' = b, L1' = [], L2 = [c,d], L3' = [c,d]
% 1 - X = a, L1 = b, L2 = [c,d], L3 = [ b | [c,d] ]

%length([],0).
%length([_|Tail], N):- length(Tail,N1), N is N1+1.

add(X,L,[X|L]).

del(X, [X | Tail], Tail).
del(X, [Y | Tail], [Y | Tail1]):- del(X, Tail, Tail1).

permutation([],[]).
permutation([X|L],P):- permutation(L,L1), insert(X,L1,P).
insert(X,L,L1):- del(X,L1,L).

%TUTORIAL
%Q1
%palindrome_date([X,Y,Z]):- split_d(X,X1), split_d(Y,Y1), split_d(Z,Z1), conc(X1,Y1,L), conc(L,Z1,List), write(List) .
%split_d(X,R):- X1 is X mod 10, X2 is (X - X1)/10, R = [X2,X1].
palindrome_date([X,Y,Z]):- string_chars(X,X1), string_chars(Y,Y1), string_chars(Z,Z1), conc(X1,Y1,L), conc(L,Z1,List), my_reverse(List,Reverse,[]), Reverse == List.

my_reverse([],L,L).
my_reverse([X|L1],L2,L3):- my_reverse(L1,L2,[X|L3]).
