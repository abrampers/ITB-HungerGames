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
	enemyAt(X, Y, _),
	print('You see there\'s enemy nearby. '), !.

printEnemyAt(_, _) :- !.

printDetails :- 
	playerLocation(X, Y),
	A is X - 1, B is Y + 1, C is X + 1, D is Y - 1,
	print('You\'re in the '), printMapAtType(X, Y), print('. '), printEnemyAt(X, Y),
	printObjectAt(X, Y), nl,
	print('To the north is the '), printMapAtType(A, Y), print('; '),
	print('to the east is the '),  printMapAtType(X, B), print('; '),
	print('to the south is the '), printMapAtType(C, Y), print('; '),
	print('to the west is the '),  printMapAtType(X, D), print('. '), nl,
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
	print('You\'ve moved north.'), nl,
	printDetails,
	moveEnemyRandom(11),
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
	print('You\'ve moved north.'), nl,
	printDetails,
	moveEnemyRandom(11),
	!.

n :- 
	print('Sorry, you cannot move anymore, you are on the northernmost point!'),!.

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
	print('You\'ve moved east.'), nl,
	printDetails,
	moveEnemyRandom(11),
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
	print('You\'ve moved east.'), nl,
	printDetails,
	moveEnemyRandom(11),
	!.

e :- 
	print('Sorry, you cannot move anymore, you are on the easternmost point!'),!.

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
	print('You\'ve moved west.'), nl,
	printDetails,
	moveEnemyRandom(11),
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
	print('You\'ve moved west.'), nl,
	printDetails,
	moveEnemyRandom(11),
	!.

w :- 
	print('Sorry, you cannot move anymore, you are on the westernmost point!'),!.

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
	print('You\'ve moved south.'), nl,
	printDetails,
	moveEnemyRandom(11),
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
	print('You\'ve moved south.'), nl,
	printDetails,
	moveEnemyRandom(11),
	!.

s :- 
	print('Sorry, you cannot move anymore, you are on the southernmost point!'),!.

