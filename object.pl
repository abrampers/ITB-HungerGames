% File object.pl
/*
	Abram Perdanaputra 		(13516083)
	Faza Fahleraz 			(13516095)
	Dandy Arif Rahman 		(13516086)
	Dzaky El Fikri 			(18214XXX)
	Yusuf Rahmat Pratama 	(13516062)
*/

:- dynamic(objectAt/4).
:- dynamic(bottle/1).

% Object Initialization
% Dibikin 5 kali supaya setiap objek ada 5 buah
initObject :-
	randomRadar,
	asserta(bottle(empty)),
    appendObject(ListOfObjects),
    randomObject(ListOfObjects),
    randomObject(ListOfObjects),
    randomObject(ListOfObjects),
    randomObject(ListOfObjects),
    randomObject(ListOfObjects),
    randomObject(ListOfObjects),
    randomObject(ListOfObjects),
    randomObject(ListOfObjects),
    randomObject(ListOfObjects),
    randomObject(ListOfObjects).

% Object declaration
% FOOD
object(food, mieaceh). % 4-5 jenis
object(food, sotomedan).
object(food, rendang).
object(food, martabak).
object(food, pempek).

% MEDICINE
object(medicine, cincau). %
object(medicine, lidahbuaya).
object(medicine, kumiskucing).
object(medicine, temulawak).
object(medicine, jahe).

% WEAPON
object(weapon, rencong).
object(weapon, badik).
object(weapon, kujang).
object(weapon, keris).
object(weapon, celurit).

% RADAR
object(radar, radar).


% find all
appendObject(ListOfObject) :- findall(Y, object(_, Y), ListOfObject).

% Random Object
randomObject([]) :- !.
randomObject([Head|Tail]) :-
	Head == 'radar',
	randomObject(Tail).
randomObject([Head|Tail]) :-
	Head == 'bottle',
	randomObject(Tail).
randomObject([Head|Tail]) :- 
	random(1, 15, X), random(1, 20, Y),
	object(Type, Head),
	asserta(objectAt(X, Y, Type, Head)),
	randomObject(Tail), !.

% Random Radar
randomRadar :- 
	random(1, 15, X), random(1, 20, Y),
	asserta(objectAt(X, Y, radar, radar)).

% Inventory

	
