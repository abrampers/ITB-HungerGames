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
    print('                  .NND                                      '), nl,
    print('                 ZNDDN. =8NNDDDNNNI...                      '), nl,
    print('               .NDNDDDDNNDDDDDDDDDDNDNDNM..                 '), nl,
    print('              7DNDDDDDDDDDDDDDDDDDDDDDDDDNDDN.              '), nl,
    print('             NDDDDDDDDN?....   .  ...DDDDDDDDNN7.           '), nl,
    print('           .DDDDDDDDDD7              . ..,DDDDDDND.     .   '), nl,
    print('         .DDDDDDDDDDDDN.                 . .,DDDDDD..,NN.   '), nl,
    print('        $DNDDDDDDDDDDDD.                      .NDDDDDDD.    '), nl,
    print('      .DNDDDDDDDDDDDDDD                        .NDDDDD.     '), nl,
    print('    ..NDDDDDDDDDDDDDDDD                     ..DDNDDDDDN     '), nl,
    print('    .DDDDDDDDDDDDDDDDDDDN               ...,DNDDDDDDDDDD.   '), nl,
    print('   .DDDDDDDDDDDDDDDDDDDDDD.        .~NDDDDDNDDNN.  .NNDDD   '), nl,
    print('   8DDDD~DDDDDDDDDDDDDDDDDN     ~DDDNDDDDDDDD  .   . DDDDD  '), nl,
    print('   DDDD..DDDDDDDDDDDDDDDDDDD.MNDDDDDDDDDDDD.        ..DDDN. '), nl,
    print('  NDDD$.  8DDDDDDDDDDDDDDDDDDNDDDDDDDDDDDN..          $DDNN.'), nl,
    print(' .DDDD..   .:DDDDDDDDDDDDDDDDDDDDDDDDDDDN             .DDDN.'), nl,
    print(' :DDNN        .DDDDDDDDDDDDDDDDDDDDDDDDD.              NDDD.'), nl,
    print(' DNDD8 .       $DDDDDDDDDDDDDDDDDDDDNN..              .+DDDI'), nl,
    print(' NNDDI         DDDDDDDDDDDDDDDDDDDDDD.              ..~NDDDO'), nl,
    print('.NNDD?     7 .DNDDDDDDDDDDDDDDDDDDD.              .NDDM.DDD8'), nl,
    print(' NDDNO.   .DDDDDDDDDDDDDDDDDDDDDDD.              DNDDNNDNDD7'), nl,
    print(' 8DDDN    7DDDDDDDDDDDDDDDDDDDDDDD7.          ..DDDDNI.?DDD.'), nl,
    print(' .NDND.  .NDDDDDDNNNNDDDDDDDDDDDDDDDN.     DNND        NNDD '), nl,
    print(' .DDDN..  DDDDDDDN?       .8DDDDDDDDNND..DNDD+         NDDD.'), nl,
    print(' .ODDDD   +DDDDDDDN        ..NDDDDDDDDNDD..          .NDDD7 '), nl,
    print('  .DDDN:    DDDDDND.        . .MDDDDDDDDD?.         ..DDDD. '), nl,
    print('   .DDDD      ZDDDDD         ..NDDDDDDDDDN+         .NDDDZ  '), nl,
    print('    DNDDD .   ...DNDN.    .ZDN  DDDDDDDDDNNZ       .DNDDD . '), nl,
    print('    .DDDDD.       .NDN. 7D8. .  NDDDNDNDDDDNI.    .NDDDD    '), nl,
    print('      DNDDN        .ZDNN ..    NDDD. .  .7DDDO  .~DDDDD.    '), nl,
    print('       MNDDND.  .=D...MN8     .DDZ.       .NDNZ.NDDDNN..    '), nl,
    print('        ?DDDNDDDN..   . NN    .D. .         .DDDDDDDD.      '), nl,
    print('         .NDDDDDD..                        .DDDDDDD         '), nl,
    print('   ..DDDD~..DDDDDDNN..                . .NDDDDDDDNN         '), nl,
    print('  .DDNDD    .:NDDDDDNDDNDNI...  ..=8NDDDDDDDDDDZ...N.       '), nl,
    print('~DN~.. ..     ..8DDDDDDDDDDDDDDDDDDDDDDDDDDDN  .            '), nl,
    print('                . . ODDNDDDDDDDDDDDDDNNDD...                '), nl,
    print('                       ....=$O88Z+...... '), nl, nl, nl,
    print('Welcome to the 77th Hunger Games!'), nl, nl,
    print('What\'s your name? '), nl,
    print('>>> '),
    read(Name),
    player(D),
    retract(player(D)),
    asserta(player(Name)),
    welcome_screen,
    repeat,
        nl,
        write('Enter your command:'), nl,
        write('>>> '),
        read(Input), nl,
        print('====================================================================================================='), nl, nl,
        isInput(Input),
        call(Input),
    end, !.
    % TODO: Game

isInput(listing) :- !.%nl, write('DO NOT CHEAT!'), nl, !, fail.

isInput(help) :- !.
isInput(quit) :- !.
isInput(q) :- !.
isInput(look) :- !.
isInput(map) :- !.
isInput(n) :- !.
isInput(s) :- !.
isInput(e) :- !.
isInput(w) :- !.
isInput(take(_)) :- !.
isInput(use(_)) :- !.
isInput(drop(_)) :- !.
isInput(attack) :- !.
isInput(status) :- !.
isInput(save) :- !.
isInput(load) :- !.

%% isInput(_) :- nl, write('WRONG INPUT'),  fail, !.


end :-
    health(X), X =< 0,
    write('Enemy killed you!'),
    !.

end :-
    hunger(X), X =< 0,
    write('You starved to death!'),
    !.

end :-
    thirst(X), X =< 0,
    write('You died of thirst!'),
    !.

end :-
    totalEnemy(X), X =< 0,
    write('You\'ve killed all the enemies!'),
    !.


initGame :-
    initPlayer,
    makeMap,
    initObject,
    initEnemy(11),
    asserta(totalEnemy(11)).

help :-
    print('+-----------------------------------------------------------------------------+'), nl,
    print('| These are some commands you can use to progress through the game:           |'), nl,
    print('+-----------------------------------------------------------------------------+'), nl,
    print('| help.           | show available commands                                   |'), nl,
    print('| quit.           | quit the game                                             |'), nl,
    print('| look.           | look around you                                           |'), nl,
    print('| n. s. e. w.     | move                                                      |'), nl,
    print('| map.            | look at the map and detect enemies (need radar to use)    |'), nl,
    print('| take(Object).   | pick up an object                                         |'), nl,
    print('| drop(Object).   | drop an object                                            |'), nl,
    print('| use(Object).    | use an object                                             |'), nl,
    print('| attack.         | attack enemy that crosses your path                       |'), nl,
    print('| status.         | show your status                                          |'), nl,
    print('| save.           | save your game                                            |'), nl,
    print('| load.           | load previously saved game                                |'), nl,
    print('+-----------------------------------------------------------------------------+'), nl,

    print('+--------------------+'), nl,
    print('| Map legends:       |'), nl,
    print('+--------------------+'), nl,
    print('| P | Player         |'), nl,
    print('| E | Enemy          |'), nl,
    print('| m | Medicine       |'), nl,
    print('| f | Food           |'), nl,
    print('| w | Weapon         |'), nl,
    print('| r | Radar          |'), nl,
    print('| b | Bottle         |'), nl,
    print('| + | Forest         |'), nl,
    print('| * | Lake           |'), nl,
    print('| - | Open Field     |'), nl,
    print('| # | Inaccessible   |'), nl,
    print('+--------------------+'), nl.

quit :- halt.

q :- quit.

save :-
    open('a.pl', write, Data),
    player(PlayerName),
    write(Data, player(PlayerName)), write(Data, '.'), nl(Data),
    playerLocation(CoordX, CoordY),
    write(Data, playerLocation(CoordX, CoordY)), write(Data, '.'), nl(Data),
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
    nl, print('You\'ve saved the game!'), nl,
    !.

load :-
    consult('a.pl'),
    print('You\'ve load the game.'), nl, !.

readFacts(Data) :-
    repeat,
        read(Data, X),
        asserta(X),
        at_end_of_stream(Data).

welcome_screen :-
    nl,
    print('+-----------------------------------------------------------------------------+'), nl,
    print('| These are some commands you can use to progress through the game:           |'), nl,
    print('+-----------------------------------------------------------------------------+'), nl,
    print('| help.           | show available commands                                   |'), nl,
    print('| quit.           | quit the game                                             |'), nl,
    print('| look.           | look around you                                           |'), nl,
    print('| n. s. e. w.     | move                                                      |'), nl,
    print('| map.            | look at the map and detect enemies (need radar to use)    |'), nl,
    print('| take(Object).   | pick up an object                                         |'), nl,
    print('| drop(Object).   | drop an object                                            |'), nl,
    print('| use(Object).    | use an object                                             |'), nl,
    print('| attack.         | attack enemy that crosses your path                       |'), nl,
    print('| status.         | show your status                                          |'), nl,
    print('| save.           | save your game                                            |'), nl,
    print('| load.           | load previously saved game                                |'), nl,
    print('+-----------------------------------------------------------------------------+'), nl,

    print('+--------------------+'), nl,
    print('| Map legends:       |'), nl,
    print('+--------------------+'), nl,
    print('| P | Player         |'), nl,
    print('| E | Enemy          |'), nl,
    print('| m | Medicine       |'), nl,
    print('| f | Food           |'), nl,
    print('| w | Weapon         |'), nl,
    print('| r | Radar          |'), nl,
    print('| b | Bottle         |'), nl,
    print('| + | Forest         |'), nl,
    print('| * | Lake           |'), nl,
    print('| - | Open Field     |'), nl,
    print('| # | Inaccessible   |'), nl,
    print('+--------------------+'), nl, nl,

    print('You have been chosen as one of the lucky contestants. Be the last man standing and you'), nl,
    print('will be remembered as one of the victors.'),nl, nl,
    print('Happy Hunger Games! And may the odds be ever in your favor!'), nl.

bersih :-
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
    retractall(enemyAt(_, _, _)).
