%library books:- ISBN no, title, author, publisher
%library members:- member no, name, address
%loaned books:- member no, ISBN no, borrow date, due date
%display list of all book title a member has borrowed
%display a list of members with overdue book titles, current date as input param
%and any other utility

book('0470211660','Database Applications Using PROLOG',['Robert Lucas'],'Ellis Horwood Ltd.').
book('0632012463','Prolog Programming: A Tutorial Introduction',['Carlton McDonald', 'Masoud Yazdani'],'Alfred Waller Ltd.').
book('0123456789','Hello World',['Author'],'Publisher').

member('WEA150022','Ong Jia Aun','B11-5, Jalan SS2/113, 47600 Petaling Jaya, Selangor').
member('WER150031','Ong Seow Sze','B11-5, Jalan SS2/113, 47600 Petaling Jaya, Selangor').
member('WEA150000','Ali','Taman Bahagia').
member('WEA150001','Abu','Taman Mawar').
member('WEA150002','Ah Kau','Taman Seri Wangsa').

loaned('WEA150022','0632012463',[28,4,2018],[30,4,2018]).
loaned('WEA150000','0123456789',[1,1,2011],[1,1,2012]).
loaned('WEA150001','0470211660',[1,5,2018],[9,5,2018]).

list_borrowed(Member, Book):- loaned(Member, ISBN_No,_,_), book(ISBN_No, Book,_,_).
list_borrowed(Member, Book):- member(Member_No, Member,_), loaned(Member_No, ISBN_No,_,_), book(ISBN_No,Book,_,_).

compare([D,M,Y],[D_,M_,Y_]):- (Y =< Y_ -> (M =< M_ -> (D =< D_ -> false ; true ) ; true ) ; true).
list_overdue(DMY, Member, Book):- loaned(Member_No, ISBN_No,_,DMY_), compare(DMY,DMY_), member(Member_No,Member,_), book(ISBN_No,Book,_,_).

author(ISBN, Name):- book(ISBN,_,Name,_).
author(Title, Name):- book(_,Title,Name,_).
publisher(ISBN, Name):- book(ISBN,_,_,Name).
publisher(Title, Name):- book(_,Title,_,Name).