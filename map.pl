% File map.pl
/*
	Abram Perdanaputra 		(13516083)
	Faza Fahleraz 			(13516095)
	Dandy Arif Rahman 		(13516086)
	Dzaky El Fikri 			(18214XXX)
	Yusuf Rahmat Pratama 	(13516062)
*/
/*
	Disini kita pake peta 15 x 20, tapi gue tambahin pagernya di ujung jadi 17 x 22 dengan zero based index
	row 0 - 21 dan col 0 - 16
*/

% INITIALIZE MAP
:- dynamic(mapAt/3).

% CREATE MAP
makeMapAt(_, [], _) :- !.
makeMapAt(Row, [A|B], Col) :-
	asserta(mapAt(Row, Col, A)),
	NewCol is Col + 1,
	makeMapAt(Row, B, NewCol), !.

makeMapRow0  :- makeMapAt(0,  ['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'], 0), !.
makeMapRow1  :- makeMapAt(1,  ['#', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', '#'], 0), !.
makeMapRow2  :- makeMapAt(2,  ['#', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', '#'], 0), !.
makeMapRow3  :- makeMapAt(3,  ['#', 'F', 'F', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'F', 'F', '#'], 0), !.
makeMapRow4  :- makeMapAt(4,  ['#', 'F', 'F', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'F', 'F', '#'], 0), !.
makeMapRow5  :- makeMapAt(5,  ['#', 'F', 'F', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'F', 'F', '#'], 0), !.
makeMapRow6  :- makeMapAt(6,  ['#', 'F', 'F', 'O', 'O', 'O', 'L', 'L', 'L', 'L', 'O', 'O', 'L', 'L', 'L', 'L', 'O', 'O', 'O', 'F', 'F', '#'], 0), !.
makeMapRow7  :- makeMapAt(7,  ['#', 'F', 'F', 'O', 'O', 'O', 'L', 'L', 'L', 'L', 'O', 'O', 'L', 'L', 'L', 'L', 'O', 'O', 'O', 'F', 'F', '#'], 0), !.
makeMapRow8  :- makeMapAt(8,  ['#', 'F', 'F', 'O', 'O', 'O', 'L', 'L', 'L', 'L', 'O', 'O', 'L', 'L', 'L', 'L', 'O', 'O', 'O', 'F', 'F', '#'], 0), !.
makeMapRow9  :- makeMapAt(9,  ['#', 'F', 'F', 'O', 'O', 'O', 'L', 'L', 'L', 'L', 'O', 'O', 'L', 'L', 'L', 'L', 'O', 'O', 'O', 'F', 'F', '#'], 0), !.
makeMapRow10 :- makeMapAt(10, ['#', 'F', 'F', 'O', 'O', 'O', 'L', 'L', 'L', 'L', 'O', 'O', 'L', 'L', 'L', 'L', 'O', 'O', 'O', 'F', 'F', '#'], 0), !.
makeMapRow11 :- makeMapAt(11, ['#', 'F', 'F', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'F', 'F', '#'], 0), !.
makeMapRow12 :- makeMapAt(12, ['#', 'F', 'F', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'F', 'F', '#'], 0), !.
makeMapRow13 :- makeMapAt(13, ['#', 'F', 'F', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'F', 'F', '#'], 0), !.
makeMapRow14 :- makeMapAt(14, ['#', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', '#'], 0), !.
makeMapRow15 :- makeMapAt(15, ['#', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', 'F', '#'], 0), !.
makeMapRow16 :- makeMapAt(16, ['#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#', '#'], 0), !.


makeMap :- makeMapRow0, makeMapRow1, makeMapRow2,  makeMapRow3,  makeMapRow4, makeMapRow5, makeMapRow6, makeMapRow7, makeMapRow8, makeMapRow9, makeMapRow10, makeMapRow11, makeMapRow12, makeMapRow13, makeMapRow14, makeMapRow15, makeMapRow16, !.


printMap(16, 21) :- mapAt(16, 21, T), print(' '), print(T), print(' ').
printMap(X, 21)  :- mapAt(X, 21, T), print(' '), print(T), print(' '), nl, XX is X + 1, YY is 0, printMap(XX, YY), !.
printMap(X, Y)   :- mapAt(X, Y, _), enemyAt(X, Y, _), 									print(' E '), YY is Y + 1, printMap(X, YY), !.
printMap(X, Y)   :- mapAt(X, Y, _), objectAt(X, Y, Jenis, _), Jenis == 'radar', 		print(' r '), YY is Y + 1, printMap(X, YY), !.
printMap(X, Y)   :- mapAt(X, Y, _), objectAt(X, Y, Jenis, _), Jenis == 'medicine', 		print(' m '), YY is Y + 1, printMap(X, YY), !.
printMap(X, Y)   :- mapAt(X, Y, _), objectAt(X, Y, Jenis, _), Jenis == 'food', 			print(' f '), YY is Y + 1, printMap(X, YY), !.
printMap(X, Y)   :- mapAt(X, Y, _), objectAt(X, Y, Jenis, _), Jenis == 'bottle', 		print(' b '), YY is Y + 1, printMap(X, YY), !.
printMap(X, Y)   :- mapAt(X, Y, _), objectAt(X, Y, Jenis, _), Jenis == 'weapon', 		print(' w '), YY is Y + 1, printMap(X, YY), !.
printMap(X, Y)   :- mapAt(X, Y, _), playerLocation(X, Y), 								print(' P '), YY is Y + 1, printMap(X, YY), !.
printMap(X, Y)   :- mapAt(X, Y, T), T == 'F', 											print(' + '), YY is Y + 1, printMap(X, YY), !.
printMap(X, Y)   :- mapAt(X, Y, T), T == 'L', 											print(' * '), YY is Y + 1, printMap(X, YY), !.
printMap(X, Y)   :- mapAt(X, Y, T), T == 'O', 											print(' - '), YY is Y + 1, printMap(X, YY), !.
printMap(X, Y)   :- mapAt(X, Y, T) ,  print(' '), print(T), print(' '), YY is Y + 1, printMap(X, YY), !.

% Look
look :-
	playerLocation(X, Y),
	A is X - 1, B is Y - 1, C is X + 1, D is Y + 1,
	print('Here\'s your surrounding:'), nl, nl,
	printAt(A, B), printAt(A, Y), printAt(A, D), nl,
	printAt(X, B), printAt(X, Y), printAt(X, D), nl,
	printAt(C, B), printAt(C, Y), printAt(C, D), nl, nl,
	print('You\'re in a '), printMapAtType(X, Y), print('. '), nl,
	printObjectAt(X, Y).

printMapAtType(X, Y) :-
	mapAt(X, Y, Type),
	Type == 'F', print('Forest'), !.

printMapAtType(X, Y) :-
	mapAt(X, Y, Type),
	Type == 'O', print('Open Field'), !.

printMapAtType(X, Y) :-
	mapAt(X, Y, Type),
	Type == 'L', print('Lake'), !.

printMapAtType(X, Y) :-
	mapAt(X, Y, Type),
	Type == '#', print('Inaccessible'), !.

appendObjectAt(X, Y, ListOfObjectAt) :- findall(Object, objectAt(X, Y, _, Object), ListOfObjectAt).

printObjectAt(X, Y) :-
	appendObjectAt(X, Y, ListOfObjectAt),
	printObjectList(ListOfObjectAt).

printObjectList([]) :- !.

printObjectList([Head|Tail]) :-
	print('There is a '), print(Head), print(' on the ground. '), nl,
	printObjectList(Tail), !.



printAt(16, 21) :- mapAt(16, 21, T), print(' '), print(T), print(' ').
printAt(X, 21) :- mapAt(X, 21, T), print(' '), print(T), print(' '), !.
printAt(X, Y) :- mapAt(X, Y, _), enemyAt(X, Y, _), 									print(' E '), !.
printAt(X, Y) :- mapAt(X, Y, _), objectAt(X, Y, Jenis, _), Jenis == 'radar', 		print(' r '), !.
printAt(X, Y) :- mapAt(X, Y, _), objectAt(X, Y, Jenis, _), Jenis == 'medicine', 	print(' m '), !.
printAt(X, Y) :- mapAt(X, Y, _), objectAt(X, Y, Jenis, _), Jenis == 'food', 		print(' f '), !.
printAt(X, Y) :- mapAt(X, Y, _), objectAt(X, Y, Jenis, _), Jenis == 'bottle', 		print(' b '), !.
printAt(X, Y) :- mapAt(X, Y, _), objectAt(X, Y, Jenis, _), Jenis == 'weapon', 		print(' w '), !.
printAt(X, Y) :- mapAt(X, Y, _), playerLocation(X, Y), 								print(' P '), !.
printAt(X, Y) :- mapAt(X, Y, T), T == 'F', 											print(' + '), !.
printAt(X, Y) :- mapAt(X, Y, T), T == 'L', 											print(' * '), !.
printAt(X, Y) :- mapAt(X, Y, T), T == 'O', 											print(' - '), !.
printAt(X, Y) :- mapAt(X, Y, T) ,  print(' '), print(T), print(' '), !.

% Map
map :- inventory(radar), print('Here\'s your map:'), nl, nl, printMap(0, 0), nl, !.
map :- print('You don\'t have any radar.'), nl, !. % Error Message
