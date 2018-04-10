+(-(2,*(1,3)),4)
-(2,+(*(1,3),4))

:-op(300, xfx, likes).
:-op(200, xfy, and).
likes(danial, drawing).
likes(danial, reading).

danial likes drawing and reading
likes(danial,and(reading, drawing))

?.danial likes What and reading.

:-op(500,yfx,chases).
dog('dude').
cat('girl').
chases(X,Y):- dog(X), cat(Y).
?.Who chases Whom.

%TUTORIAL
%Q1
%ball and marble inside blue_box inside red_box
:-op(400,xfy,and).
:-op(600,yfx,inside).
inside(inside(and(ball,marble),blue_box),red_box).
?.What and Wut inside What2 inside red_box.

:-op(400,xfy,and).
:-op(600,xfy,inside).
inside(and(ball,marble),inside(blue_box,red_box)).

Left-associative is better, more human-like

%Q2
:-op(500,yfx,was).
:-op(400,yfx,of).
:-op(300,fy,the).
was(zara,of(the(dean),the(faculty))).
?. Who is the dean of the faculty.
