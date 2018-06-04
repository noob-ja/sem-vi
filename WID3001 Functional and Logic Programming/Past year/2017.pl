%2017
%%Q2
%a = []
%b
print_first([Head|_], Head).
%c
print_last([Head|Tail]):- 
    (   Tail = [] ->  
          	write('Last element of the list: '), write(Head), nl;
    		print_last(Tail)
    ).

%Q3
:-op(300,xfx,[is_a,on]).
:-op(450,xfx,are).
:-op(400,xfy,[and,of,in]).
:-op(200,fx,likes). %change the precedence level to lower to bind first
:-op(500,yfx,was).
:-op(100,fy,[the,good]).
:-op(600,yfx,from). %make it high precendence level to bind later

on(the(book),the(deck)).
are(and(donate,volunteer), good(deeds)).
fara is_a shopaholic and likes dresses.
myra is_a graduate from university of malaya.
the duck was swimming in the river.

%Q4
b_t(37.5, normal):-!.
b_t(T,fever):- (T>37.5,T=<39.5),!.
b_t(_,high_fever).

%Q5
go:-
    write('Waist-to-hip ratio calculator'), nl,
    write('Waist(cm): '), read(Waist),
   	write('Hip(cm):   '), read(Hip),
    write('Gender(w/m): '), read(Gender),
    Ratio is Waist/Hip,
    write('Ratio: '),write(Ratio), nl,
    (   Gender=w->  
    	(   Ratio =< 0.8 ->  Risk=low; 
        (   Ratio =< 0.85 ->  Risk=average; Risk=high
        ));
    	(   Ratio =< 0.95 ->  Risk=low; 
        (   Ratio =< 1 ->  Risk=average; Risk=high
        ))
    ),
    (   Risk=low->Shape=pear;(Risk=average->Shape=avacado;Shape=apple)  
    ),
    write('Risk: '),write(Risk),nl,
    write('Shape: '),write(Shape),nl.