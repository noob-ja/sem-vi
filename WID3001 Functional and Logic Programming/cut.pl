lectures(susan, 2102).
lectures(ali, 2103).
lectures(chong, 3181).
lectures(ali, 2106).

studies(farid, 2102).
studies(jamil, 2103).
studies(julia, 2106).
studies(julia, 3181).
studies(haris, 3181).
studies(haris, 2106).

%query
%?- lectures(ali, Course), !, studies(Student, Course).
%rule
teach(Teacher, Student):- lectures(Teacher, Code), studies(Student, Code).

% CUT operator !
max(A,B,A):- A > B, !.
max(A,B,B).

%rather than
% max(A,B,A):- A > B.
% max(A,B,B):- A =< B.
% 
% better than this

p(1).
p(2):- !.
p(3).

%?- p(X).
%output -> X = 1, X = 2
%
%?- p(X), p(Y).
%output -> X = 1, Y = 1
%		-> X = 1, Y = 2
%		-> X = 2, Y = 1
%		-> X = 2, Y = 2
%
%?- p(X),!,p(Y).
%output -> X = 1, Y = 1
%		-> X = 1, Y = 2
%

marks(X, 'A'):- X >= 80, !.
marks(X, 'B'):- X >= 65, !.
marks(X, 'C'):- X >= 55, !.
marks(X, 'D'):- X >= 50, !.
marks(X, 'Passed'):- X >= 40, !.
marks(X, 'Failed').
