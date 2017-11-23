% File player.pl
/*
	Abram Perdanaputra 		(13516083)
	Faza Fahleraz 			(13516095)
	Dandy Arif Rahman 		(13516086)
	Dzaky El Fikri 			(18214XXX)
	Yusuf Rahmat Pratama 	(13516062)
*/

% Dynamic Variables
:- dynamic(player/1).
:- dynamic(health/1).
:- dynamic(hunger/1).
:- dynamic(thirst/1).
:- dynamic(isThirsty/1).
:- dynamic(weapon/1).
:- dynamic(playerLocation/2).
:- dynamic(inventory/1).

% Player Initialization
initPlayer :-
    asserta(player(unnamed)),
    asserta(health(100)),
    asserta(hunger(100)),
    asserta(thirst(100)),
    asserta(weapon(none)),
    random(1, 15, X), random(1, 20, Y),
    asserta(playerLocation(X, Y)).

% TAKE
take(Object) :-
	playerLocation(X, Y), objectAt(X, Y, _, Object),
	asserta(inventory(Object)),
	print('You\'ve taken '), print(Object), print('.'), nl,
	retract(objectAt(X, Y, _, Object)),
	!.

take(Object) :-
	print('There\'s no '), print(Object), print(' here.'), nl,
	!.

% DROP
drop(Object) :-
	inventory(Object),
	playerLocation(X, Y), object(Type, Object),
	retract(inventory(Object)),
	asserta(objectAt(X, Y, Type, Object)),
	print('You\'ve dropped '), print(Object), print('.'), nl,
	!.

drop(Object) :-
	print('You don\'t have '), print(Object), print(' in your inventory.'), nl,
	!.

% USE
use(Object) :-
	inventory(Object),
	object(Type, Object),
	Type == 'food',
	eat(Object),
	print('You\'ve eaten '), print(Object), write('. '), nl, nl,
	print('Your Hunger is now '), hunger(Hunger), print(Hunger), print('.'), nl,
	retract(inventory(Object)),
	!.

use(Object) :-
	inventory(Object),
	object(Type, Object),
	Type == 'medicine',
	drink(Object),
	print('You\'ve drunk '), print(Object), write('. '), nl, nl,
	print('Your new Health is '), health(Health), print(Health), print('.'), nl,
	retract(inventory(Object)),
	!.

use(Object) :-
	inventory(Object),
	object(Type, Object),
	Type == 'weapon',
	weapon(none), retract(weapon(none)),
	asserta(weapon(Object)),
	print('You\'re now using '), print(Object), write('. '), nl,
	retract(inventory(Object)),
	!.

use(Object) :-
	inventory(Object),
	object(Type, Object),
	Type == 'weapon',
	weapon(AllW), retract(weapon(AllW)), asserta(inventory(AllW)),
	asserta(weapon(Object)),
	print('You\'re now using '), print(Object), write('. '), nl,
	retract(inventory(Object)),
	!.

use(bottle) :-
	useBottle,
	!.

use(Object) :-
	inventory(Object),
	object(Type, Object),
	Type == 'radar',
	print('Use command \"map.\" to use radar.'), nl,
	!.

use(Object) :-
	print('You don\'t have '), print(Object), print(' in your inventory.'), nl,
	!.

% EAT
eat(Object) :-
	Object == 'mieaceh',
	hunger(Hunger), NewHunger is Hunger + 50, NewHunger > 100,
	retract(hunger(Hunger)), asserta(hunger(100)), !.

eat(Object) :-
	Object == 'mieaceh',
	hunger(Hunger), NewHunger is Hunger + 50,
	retract(hunger(Hunger)), asserta(hunger(NewHunger)), !.

eat(Object) :-
	Object == 'sotomedan',
	hunger(Hunger), NewHunger is Hunger + 40, NewHunger > 100,
	retract(hunger(Hunger)), asserta(hunger(100)), !.

eat(Object) :-
	Object == 'sotomedan',
	hunger(Hunger), NewHunger is Hunger + 40,
	retract(hunger(Hunger)), asserta(hunger(NewHunger)), !.

eat(Object) :-
	Object == 'rendang',
	hunger(Hunger), NewHunger is Hunger + 30, NewHunger > 100,
	retract(hunger(Hunger)), asserta(hunger(100)), !.

eat(Object) :-
	Object == 'rendang',
	hunger(Hunger), NewHunger is Hunger + 30,
	retract(hunger(Hunger)), asserta(hunger(NewHunger)), !.

eat(Object) :-
	Object == 'martabak',
	hunger(Hunger), NewHunger is Hunger + 20, NewHunger > 100,
	retract(hunger(Hunger)), asserta(hunger(100)), !.

eat(Object) :-
	Object == 'martabak',
	hunger(Hunger), NewHunger is Hunger + 20,
	retract(hunger(Hunger)), asserta(hunger(NewHunger)), !.

eat(Object) :-
	Object == 'pempek',
	hunger(Hunger), NewHunger is Hunger + 10, NewHunger > 100,
	retract(hunger(Hunger)), asserta(hunger(100)), !.

eat(Object) :-
	Object == 'pempek',
	hunger(Hunger), NewHunger is Hunger + 10,
	retract(hunger(Hunger)), asserta(hunger(NewHunger)), !.

% DRINK
drink(Object) :-
	Object == 'lidahbuaya',
	health(Health), NewHealth is Health + 50, NewHealth > 100,
	retract(health(Health)), asserta(health(100)), !.

drink(Object) :-
	Object == 'lidahbuaya',
	health(Health), NewHealth is Health + 50,
	retract(health(Health)), asserta(health(NewHealth)), !.

drink(Object) :-
	Object == 'cincau',
	health(Health), NewHealth is Health + 40, NewHealth > 100,
	retract(health(Health)), asserta(health(100)), !.

drink(Object) :-
	Object == 'cincau',
	health(Health), NewHealth is Health + 40,
	retract(health(Health)), asserta(health(NewHealth)), !.

drink(Object) :-
	Object == 'temulawak',
	health(Health), NewHealth is Health + 30, NewHealth > 100,
	retract(health(Health)), asserta(health(100)), !.

drink(Object) :-
	Object == 'temulawak',
	health(Health), NewHealth is Health + 30,
	retract(health(Health)), asserta(health(NewHealth)), !.

drink(Object) :-
	Object == 'kumiskucing',
	health(Health), NewHealth is Health + 20, NewHealth > 100,
	retract(health(Health)), asserta(health(100)), !.

drink(Object) :-
	Object == 'kumiskucing',
	health(Health), NewHealth is Health + 20,
	retract(health(Health)), asserta(health(NewHealth)), !.

drink(Object) :-
	Object == 'jahe',
	health(Health), NewHealth is Health + 10, NewHealth > 100,
	retract(health(Health)), asserta(health(100)), !.

drink(Object) :-
	Object == 'jahe',
	health(Health), NewHealth is Health + 10,
	retract(health(Health)), asserta(health(NewHealth)), !.

% Use Bottle
useBottle :-
	playerLocation(X, Y), mapAt(X, Y, Type),
	Type == 'L', thirst(Thirst), bottle(Bottle),
	retract(thirst(Thirst)), asserta(thirst(100)),
	retract(bottle(Bottle)), asserta(bottle(full)),
	write('You\'ve filled your bottle.'), nl, nl,
	print('Your new Thirst is 100.'), nl,
	!.

useBottle :-
	bottle(full), thirst(Thirst), bottle(Bottle),
	retract(thirst(Thirst)), NewThirst is Thirst + 50, NewThirst > 100, asserta(thirst(100)),
	retract(bottle(Bottle)), asserta(bottle(empty)),
	print('Your Thirst is now '), thirst(Thirst), print(Thirst), print('.'), nl, nl,
	print('Your bottle is now empty'), nl,
	!.

useBottle :-
	bottle(full), thirst(Thirst), bottle(Bottle),
	retract(thirst(Thirst)), NewThirst is Thirst + 50, asserta(thirst(NewThirst)),
	retract(bottle(Bottle)), asserta(bottle(empty)),
	print('Your Thirst is now '), thirst(Thirst), print(Thirst), print('.'), nl, nl,
	print('Your bottle is now empty'), nl,
	!.

useBottle :-
	print('Your bottle is empty, you can\'t drink.'), nl,
	!.

% Attack
attack :-
	playerLocation(X, Y),
	enemyAt(X, Y, Z),
	weapon('rencong'),
	health(Health), NewHealth is Health - 10,
	NewHealth > 0,
	retract(health(Health)), asserta(health(NewHealth)),
	retract(enemyAt(X, Y, Z)),
	retract(totalEnemy(Tot)),
	NewTot is Tot - 1,
	asserta(totalEnemy(NewTot)),
    print('You\'ve killed an enemy.'), nl, nl,
    print('Your Health is now '), print(NewHealth), print('.'), nl,
	print('There are '), print(NewTot), print(' enemies left.'), nl,
	!.

attack :-
	playerLocation(X, Y),
	enemyAt(X, Y, _),
	weapon('rencong'),
	health(Health),
	retract(health(Health)), asserta(health(0)),
	print('You\'re dead.'), nl,
	!.

attack :-
	playerLocation(X, Y),
	enemyAt(X, Y, Z),
	weapon('badik'),
	health(Health), NewHealth is Health - 20,
	NewHealth > 0,
	retract(health(Health)), asserta(health(NewHealth)),
	retract(enemyAt(X, Y, Z)),
	retract(totalEnemy(Tot)),
	NewTot is Tot - 1,
	asserta(totalEnemy(NewTot)),
    print('You\'ve killed an enemy.'), nl, nl,
    print('Your Health is now '), print(NewHealth), print('.'), nl,
	print('There are '), print(NewTot), print(' enemies left.'), nl,
	!.

attack :-
	playerLocation(X, Y),
	enemyAt(X, Y, _),
	weapon('badik'),
	health(Health),
	retract(health(Health)), asserta(health(0)),
	print('You\'re dead.'), nl,
	!.

attack :-
	playerLocation(X, Y),
	enemyAt(X, Y, Z),
	weapon('kujang'),
	health(Health), NewHealth is Health - 30,
	NewHealth > 0,
	retract(health(Health)), asserta(health(NewHealth)),
	retract(enemyAt(X, Y, Z)),
	retract(totalEnemy(Tot)),
	NewTot is Tot - 1,
	asserta(totalEnemy(NewTot)),
    print('You\'ve killed an enemy.'), nl, nl,
    print('Your Health is now '), print(NewHealth), print('.'), nl,
	print('There are '), print(NewTot), print(' enemies left.'), nl,
	!.

attack :-
	playerLocation(X, Y),
	enemyAt(X, Y, _),
	weapon('kujang'),
	health(Health),
	retract(health(Health)), asserta(health(0)),
	print('You\'re dead.'), nl,
	!.

attack :-
	playerLocation(X, Y),
	enemyAt(X, Y, Z),
	weapon('keris'),
	health(Health), NewHealth is Health - 40,
	NewHealth > 0,
	retract(health(Health)), asserta(health(NewHealth)),
	retract(enemyAt(X, Y, Z)),
	retract(totalEnemy(Tot)),
	NewTot is Tot - 1,
	asserta(totalEnemy(NewTot)),
    print('You\'ve killed an enemy.'), nl, nl,
    print('Your Health is now '), print(NewHealth), print('.'), nl,
	print('There are '), print(NewTot), print(' enemies left.'), nl,
	!.

attack :-
	playerLocation(X, Y),
	enemyAt(X, Y, _),
	weapon('keris'),
	health(Health),
	retract(health(Health)), asserta(health(0)),
	print('You\'re dead.'), nl,
	!.

attack :-
	playerLocation(X, Y),
	enemyAt(X, Y, Z),
	weapon('celurit'),
	health(Health), NewHealth is Health - 50,
	NewHealth > 0,
	retract(health(Health)), asserta(health(NewHealth)),
	retract(enemyAt(X, Y, Z)),
	retract(totalEnemy(Tot)),
	NewTot is Tot - 1,
	asserta(totalEnemy(NewTot)),
    print('You\'ve killed an enemy.'), nl, nl,
    print('Your Health is now '), print(NewHealth), print('.'), nl,
	print('There are '), print(NewTot), print(' enemies left.'), nl,
	!.

attack :-
	playerLocation(X, Y),
	enemyAt(X, Y, _),
	weapon('celurit'),
	health(Health),
	retract(health(Health)), asserta(health(0)),
	print('You\'re dead.'), nl,
	!.

attack :-
	playerLocation(X, Y),
	enemyAt(X, Y, Z),
	health(Health), NewHealth is Health - 60,
	NewHealth > 0,
	retract(health(Health)), asserta(health(NewHealth)),
	retract(enemyAt(X, Y, Z)),
	retract(totalEnemy(Tot)),
	NewTot is Tot - 1,
	asserta(totalEnemy(NewTot)),
	print('You\'ve killed an enemy.'), nl, nl,
    print('Your Health is now '), print(NewHealth), print('.'), nl,
	print('There are '), print(NewTot), print(' enemies left.'), nl,
	!.

attack :-
	playerLocation(X, Y),
	enemyAt(X, Y, _),
	health(Health),
	retract(health(Health)), asserta(health(0)),
	print('You\'re dead.'), nl,
	!.

attack :-
	print('There\'s no enemy nearby.'), nl,
	!.


% Append all inventory
appendInventory(ListOfInventory) :- findall(X, inventory(X), ListOfInventory).

% Print Inventory
printInventory([Head|Tail]) :-
	print('  '), print(Head), nl,
	printInventory(Tail),
	!.

inventory(radar).

% Status
status :-
	health(Health), thirst(Thrist), hunger(Hunger), weapon(Weapon),
	print('Health    : '), print(Health), nl,
	print('Hunger    : '), print(Hunger), nl,
	print('Thirst    : '), print(Thrist), nl,
	print('Weapon    : '), print(Weapon), nl,
	print('Inventory : '), nl,
	appendInventory(List),
	printInventory(List),
	!. % TODO:
