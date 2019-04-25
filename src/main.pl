/*
area_n :- algo_especifico_de_area_n.
tipo_de_trabajo_i :- areas_de_tipo_de_trabajo_i ...,
    cosa_especifica_del_tipo_de_trabajo_i.
carrera_j :- tipos_de_trabajo_para_carrera_j,
    cosas_especificas_de_la_carrera_j.
*/
:- include('database.pl').

/*  carrer.pro
   carrer identification game.
   start with ?- go. */

add :-
      open('database.pl',append,Stream),
      write(Stream,'hypothesize(asd).'),
      nl(Stream),close(Stream),
      include('database.pl').
go :- hypothesize(Carrera),
    write('La carrera recomendada es: '),
    (Carrera == unknown -> add;write(Carrera)),
    nl,
    undo.


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
