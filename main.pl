% File main.pl
/*
    Abram Perdanaputra      (13516083)
    Faza Fahleraz           (13516095)
    Dandy Arif Rahman       (13516086)
    Dzaky El Fikri          (18214XXX)
    Yusuf Rahmat Pratama    (13516062)
*/
/*
    TODO:   Rapiin dan bagusin messagenya,
            Command look harus ditambahin detail,
            moveRandomEnemy belom bisa diem.
*/

:- include('map.pl').
:- include('enemy.pl').
:- include('move.pl').
:- include('object.pl').
:- include('player.pl').

% Bikin initialize, biar pas program jalan, langsung start aja gausah pake command

% Commands
start :-
    initGame,
    print('Welcome to the 77th Hunger Games!'), nl,
    print('What\'s your name? '), nl,
    read(Name),
    player(D),
    retract(player(D)),
    asserta(player(Name)),
    welcome_screen, nl, nl.
    repeat
        write('> '),
        read(Input),
        do(Input),
        end_condition(Input).
    % TODO: Game

do() :- panggil move

end :-
    health(0), write('Kamu kalah'), 
    halt, !.

end :-

initGame :- 
    initPlayer,
    makeMap,
    initObject,
    initEnemy(11),
    asserta(totalEnemy(11)).

help :-
    print('These are some commands you may use'), nl,
    print('help.           -- show available commands ') , nl,
    print('quit.           -- quit the game ') , nl,
    print('look.           -- look around you ') , nl,
    print('n. s. e. w.     -- move ') , nl,
    print('map.            -- look at the map and detect enemies (need radar to use) ') , nl,
    print('take(Object).   -- pick up an object ') , nl,
    print('drop(Object).   -- drop an object ') , nl,
    print('use(Object).    -- use an object ') , nl,
    print('attack.         -- attack enemy that crosses your path ') , nl,
    print('status.         -- show your status ') , nl,
    print('save(Filename). -- save your game ') , nl,
    print('load(Filename). -- load previously saved game ') , nl, nl,
    print('Legends: ') , nl,
    print('P = player ') , nl,
    print('E = enemy ') , nl,
    print('m = medicine ') , nl,
    print('f = food ') , nl,
    print('w = weapon ') , nl,
    print('+ = Forest ') , nl,
    print('* = Lake ') , nl,
    print('- = Open Field ') , nl,
    print('# = Inaccessible  ') , nl,
    print('Happy Hunger Games! And may the odds be ever in your favor.') , nl , nl.

quit :- halt. % TODO:

q :- quit. % TODO:

save :- 
    %% print('Masukkan nama file: '),
    %% read(NamaFile),
    open('a.txt', write, Data),
    player(PlayerName),
    write(Data, player(PlayerName)), write(Data, '.'), nl(Data),
    playerLocation(CoordX, CoordY),
    write(Data, playerLocation(CoordX, CoordY)), write('.'), nl(Data),
    health(Health),
    write(Data, health(Health)), write(Data, '.'), nl(Data),
    hunger(Hunger),
    write(Data, hunger(Hunger)), write(Data, '.'), nl(Data),
    thirst(Thirst),
    write(Data, thirst(Thirst)), write(Data, '.'), nl(Data),
    weapon(Weapon),
    write(Data, weapon(Weapon)), write(Data, '.'), nl(Data),
    totalEnemy(Count),
    write(Data, totalEnemy(Count)), write(Data, '.'), nl(Data),
    forall(inventory(Inventory), (write(Data, inventory(Inventory)), write(Data, '.'), nl(Data))),
    forall(objectAt(W, X, Y, Z), (write(Data, objectAt(W, X, Y, Z)), write(Data, '.'), nl(Data))),
    forall(enemyAt(E, F, G), (write(Data, enemyAt(E, F, G)), write(Data, '.'), nl(Data))),
    close(Data),
    nl, print('You\'ve saved the game!')
    , !.

loads :- 
    %% inventory(_),
    %% retractall(inventory(_)),
    weapon(Weapon),
    retract(weapon(Weapon)),
    player(PlayerName),
    retract(player(PlayerName)),
    hunger(Hunger),
    retract(hunger(Hunger)),
    playerLocation(CoordX, CoordY),
    retract(playerLocation(CoordX, CoordY)),
    totalEnemy(Total),
    retractall(totalEnemy(Total)),
    thirst(Thirst),
    retractall(thirst(Thirst)),
    health(Health),
    retractall(health(Health)),
    objectAt(_, _, _, _),
    retractall(objectAt(_, _, _, _)),
    enemyAt(_, _, _),
    retractall(enemyAt(_, _, _)),
    print('Masukkan nama file: '),
    open('a.txt', read, Data),
    readFacts(Data),
    close(Data),
    nl, print('You\'ve load the game!'), !.

readFacts(Data) :-
    repeat,
        read(Data, X),
        asserta(X),
        at_end_of_stream(Data).

welcome_screen :-
    nl,
    print('You have been chosen as one of the lucky contestants. Be the last man standing and you will be remembered as one of the victors.'),nl, nl,
    print('These are some commands you may use'), nl,
    print('help.           -- show available commands ') , nl,
    print('quit.           -- quit the game ') , nl,
    print('look.           -- look around you ') , nl,
    print('n. s. e. w.     -- move ') , nl,
    print('map.            -- look at the map and detect enemies (need radar to use) ') , nl,
    print('take(Object).   -- pick up an object ') , nl,
    print('drop(Object).   -- drop an object ') , nl,
    print('use(Object).    -- use an object ') , nl,
    print('attack.         -- attack enemy that crosses your path ') , nl,
    print('status.         -- show your status ') , nl,
    print('save(Filename). -- save your game ') , nl,
    print('load(Filename). -- load previously saved game ') , nl, nl,
    print('Legends: ') , nl,
    print('P = Player ') , nl,
    print('E = Enemy ') , nl,
    print('m = Medicine ') , nl,
    print('f = Food ') , nl,
    print('w = Weapon ') , nl,
    print('r = Radar ') , nl,
    print('b = Bottle ') , nl,
    print('+ = Forest ') , nl,
    print('* = Lake ') , nl,
    print('- = Open Field ') , nl,
    print('# = Inaccessible  ') , nl,
    print('Happy Hunger Games! And may the odds be ever in your favor.') , nl , nl.