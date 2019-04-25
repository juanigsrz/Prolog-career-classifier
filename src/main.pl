/*
area_n :- algo_especifico_de_area_n.
tipo_de_trabajo_i :- areas_de_tipo_de_trabajo_i ...,
    cosa_especifica_del_tipo_de_trabajo_i.
carrera_j :- tipos_de_trabajo_para_carrera_j,
    cosas_especificas_de_la_carrera_j.
*/


/*  carrer.pro
   carrer identification game.
   start with ?- go. */

/* Esta funcion arma una lista de X tales que se sabe que yes(X) */
formarLista(Y) :- yes(X), not(member(X,Y)), !, formarLista([X|Y]).
formarLista(Y) :- /* write('done'), nl,*/ escupir(Y).

/* Esta funcion imprime bonito verify(X) para cada X es una lista */
escupir([X])   :- write('verify('), write(X), write(').'), true.
escupir([X|Y]) :- write('verify('), write(X), write('), '), escupir(Y).

add(S) :- append('hypothesize.pl'),
          write('hypothesize('), write(S), write(') :- '), write(S), write(', !.'), nl,
          told,
          append('carreras.pl'),
          write(S), write(' :- '), 
          formarLista([]),
          nl,
          told.
       
go :- consult('database.pl'), consult('hypothesize.pl'), consult('carreras.pl'),
      hypothesize(Carrera), 
      write('Le recomendamos la carrera: '), write(Carrera), nl, undo.
go :- write('No encontramos la carrera adecuada, ingrese una nueva: '),
      flush_output(), read(S), add(S),
      write('Agregamos '), write(S), write(' a nuestra base de datos!'), nl, undo.


/* how to ask questions */
ask(Question) :-
    write('Le gusta la siguiente caracteristica: '),
    write(Question),
    write('? '),
    flush_output(), /* Fixes a flush problem on some terminals */
    read(Response),
    nl,
    ( (Response == yes ; Response == y)
    ->
    assert(yes(Question)) ;
    assert(no(Question)), fail).
:- dynamic yes/1, no/1.

/* How to verify something */
verify(S) :-
    (yes(S) -> true ;
    	(no(S) -> fail ; ask(S))
    ).

/* undo all yes/no assertions */
undo :- retract(yes(_)), fail.
undo :- retract(no(_)), fail.
undo.
