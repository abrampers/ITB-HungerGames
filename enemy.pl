% File enemy.pl
/*
	Abram Perdanaputra 		(13516083)
	Faza Fahleraz 			(13516095)
	Dandy Arif Rahman 		(13516086)
	Dzaky El Fikri 			(18214XXX)
	Yusuf Rahmat Pratama 	(13516062)
*/

:- dynamic(enemyAt/3).
:- dynamic(totalEnemy/1).

% Enemy Initialization
initEnemy(0) :- !.
initEnemy(N) :-
	random(1, 15, X), random(1, 20, Y),
	asserta(enemyAt(X, Y, N)),
	NewN is N - 1,
	initEnemy(NewN), !.

% EnemyMovement
isEnemyMoveValid(X, Y) :- 
	mapAt(X, Y, Type),
	Type \== '#',
	!.

moveEnemy(Z, 1) :- 
	enemyAt(X, Y, Z),
	NewX is X - 1,
	isEnemyMoveValid(NewX, Y),
	retract(enemyAt(X, Y, Z)), 
	asserta(enemyAt(NewX, Y, Z)),
	!.

moveEnemy(Z, 1) :- moveEnemy(Z, 4).

moveEnemy(Z, 2) :- 
	enemyAt(X, Y, Z),
	NewY is Y + 1,
	isEnemyMoveValid(X, NewY),
	retract(enemyAt(X, Y, Z)), 
	asserta(enemyAt(X, NewY, Z)),
	!.

moveEnemy(Z, 2) :- 
	moveEnemy(Z, 3),!.

moveEnemy(Z, 3) :- 
	enemyAt(X, Y, Z),
	NewY is Y - 1,
	isEnemyMoveValid(X, NewY),
	retract(enemyAt(X, Y, Z)), 
	asserta(enemyAt(X, NewY, Z)),
	!.

moveEnemy(Z, 3) :- 
	moveEnemy(Z, 2),!.

moveEnemy(Z, 4) :- 
	enemyAt(X, Y, Z),
	NewX is X + 1,
	isEnemyMoveValid(NewX, Y),
	retract(enemyAt(X, Y, Z)), 
	asserta(enemyAt(NewX, Y, Z)),
	!.

moveEnemy(Z, 4) :- 
	moveEnemy(Z, 1), !.

moveEnemy(Z, 5) :- !.

% Move EnemyRandom
moveEnemyRandom(0) :- !.
moveEnemyRandom(X) :-
	enemyAt(_, _, X),
	random(1, 6, Dir),	moveEnemy(X, Dir),
	NewX is X - 1,
	moveEnemyRandom(NewX), !.

moveEnemyRandom(X) :-
	NewX is X - 1,
	moveEnemyRandom(NewX), !.

