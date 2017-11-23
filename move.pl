% File move.pl
/*
	Abram Perdanaputra 		(13516083)
	Faza Fahleraz 			(13516095)
	Dandy Arif Rahman 		(13516086)
	Dzaky El Fikri 			(18214XXX)
	Yusuf Rahmat Pratama 	(13516062)
*/

% Move commands
% Sistem koordinat sama kaya alstrukdat 0,0 di pojok kanan atas dengan X adalah Kolom dan Y adalah Baris

is_move_valid(X, Y) :-
	mapAt(X, Y, Type),
	Type \== '#',
	!.

printEnemyAt(X, Y) :-
	enemyAt(X, Y, _), !,
	print('There\'s an enemy nearby. '), nl, !.

printEnemyAt(_, _) :- !.

printDetails :-
	playerLocation(X, Y),
	A is X - 1, B is Y + 1, C is X + 1, D is Y - 1,
	print('You\'re in a '), printMapAtType(X, Y), print('. '), nl,
	print('To the north is a '), printMapAtType(A, Y), print('. '), nl,
	print('To the east is a '),  printMapAtType(X, B), print('. '), nl,
	print('To the south is a '), printMapAtType(C, Y), print('. '), nl,
	print('To the west is a '),  printMapAtType(X, D), print('. '), nl,
	printEnemyAt(X, Y),
	printObjectAt(X, Y),
	!.


n :-
	playerLocation(X, Y),
	NewX is X - 1,
	is_move_valid(NewX, Y),
	isThirsty(T),
	retract(playerLocation(X, Y)),
	asserta(playerLocation(NewX, Y)),
	hunger(H),
	retract(hunger(H)),
	NewH is H - 1,
	asserta(hunger(NewH)),
	thirst(TempT),
	retract(thirst(TempT)),
	asserta(thirst(T)),
	retract(isThirsty(T)),
	print('You\'ve moved north.'), nl, nl,
	moveEnemyRandom(11),
	printDetails,
	!.

n :-
	playerLocation(X, Y),
	NewX is X - 1,
	is_move_valid(NewX, Y),
	retract(playerLocation(X, Y)),
	asserta(playerLocation(NewX, Y)),
	hunger(H),
	retract(hunger(H)),
	NewH is H - 1,
	asserta(hunger(NewH)),
	thirst(T),
	NewT is T - 1,
	asserta(isThirsty(NewT)),
	print('You\'ve moved north.'), nl, nl,
	moveEnemyRandom(11),
	printDetails,
	!.

n :-
	print('You cannot move north, you are on the northernmost point.'), nl, !.

e :-
	playerLocation(X, Y),
	NewY is Y + 1,
	is_move_valid(X, NewY),
	isThirsty(T),
	retract(playerLocation(X, Y)),
	asserta(playerLocation(X, NewY)),
	hunger(H),
	retract(hunger(H)),
	NewH is H - 1,
	asserta(hunger(NewH)),
	thirst(TempT),
	retract(thirst(TempT)),
	asserta(thirst(T)),
	retract(isThirsty(T)),
	print('You\'ve moved east.'), nl, nl,
	moveEnemyRandom(11),
	printDetails,
	!.

e :-
	playerLocation(X, Y),
	NewY is Y + 1,
	is_move_valid(X, NewY),
	retract(playerLocation(X, Y)),
	asserta(playerLocation(X, NewY)),
	hunger(H),
	retract(hunger(H)),
	NewH is H - 1,
	asserta(hunger(NewH)),
	thirst(T),
	NewT is T - 1,
	asserta(isThirsty(NewT)),
	print('You\'ve moved east.'), nl, nl,
	moveEnemyRandom(11),
	printDetails,
	!.

e :-
	print('You cannot move east, you are on the easternmost point.'), nl, !.

w :-
	playerLocation(X, Y),
	NewY is Y - 1,
	is_move_valid(X, NewY),
	isThirsty(T),
	retract(playerLocation(X, Y)),
	asserta(playerLocation(X, NewY)),
	hunger(H),
	retract(hunger(H)),
	NewH is H - 1,
	asserta(hunger(NewH)),
	thirst(TempT),
	retract(thirst(TempT)),
	asserta(thirst(T)),
	retract(isThirsty(T)),
	print('You\'ve moved west.'), nl, nl,
	moveEnemyRandom(11),
	printDetails,
	!.

w :-
	playerLocation(X, Y),
	NewY is Y - 1,
	is_move_valid(X, NewY),
	retract(playerLocation(X, Y)),
	asserta(playerLocation(X, NewY)),
	hunger(H),
	retract(hunger(H)),
	NewH is H - 1,
	asserta(hunger(NewH)),
	thirst(T),
	NewT is T - 1,
	asserta(isThirsty(NewT)),
	print('You\'ve moved west.'), nl, nl,
	moveEnemyRandom(11),
	printDetails,
	!.

w :-
	print('You cannot move west, you are on the westernmost point.'), nl, !.

s :-
	playerLocation(X, Y),
	NewX is X + 1,
	is_move_valid(NewX, Y),
	isThirsty(T),
	retract(playerLocation(X, Y)),
	asserta(playerLocation(NewX, Y)),
	hunger(H),
	retract(hunger(H)),
	NewH is H - 1,
	asserta(hunger(NewH)),
	thirst(TempT),
	retract(thirst(TempT)),
	asserta(thirst(T)),
	retract(isThirsty(T)),
	print('You\'ve moved south.'), nl, nl,
	moveEnemyRandom(11),
	printDetails,
	!.

s :-
	playerLocation(X, Y),
	NewX is X + 1,
	is_move_valid(NewX, Y),
	retract(playerLocation(X, Y)),
	asserta(playerLocation(NewX, Y)),
	hunger(H),
	retract(hunger(H)),
	NewH is H - 1,
	asserta(hunger(NewH)),
	thirst(T),
	NewT is T - 1,
	asserta(isThirsty(NewT)),
	print('You\'ve moved south.'), nl, nl,
	moveEnemyRandom(11),
	printDetails,
	!.

s :-
	print('You cannot move south, you are on the southernmost point.'), nl, !.
