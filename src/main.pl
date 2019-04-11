*/
area_n :- algo_especifico_de_area_n.
tipo_de_trabajo_i :- areas_de_tipo_de_trabajo_i ...,
    cosa_especifica_del_tipo_de_trabajo_i.
carrera_j :- tipos_de_trabajo_para_carrera_j,
    cosas_especificas_de_la_carrera_j.
    */

/*  animal.pro
   animal identification game.
   start with ?- go. */

go :- hypothesize(Carrera),
    write('La carrera recomendada es: '),
    write(Carrera),
    nl,
    undo.

/* Areas */
educacion      :- verify(area_educacion), !.
exactas        :- verify(area_exactas), !.
naturales      :- verify(area_naturales), !.
sociales       :- verify(area_sociales), !.
administracion :- verify(area_administracion), !.
agropecuaria   :- verify(area_agropecuaria), !.

/* Tipos de trabajo */
oficina :- exactas, !.
oficina :- sociales, !.
oficina :- administracion.

de_campo :- naturales, !.
de_campo :- sociales, !.

institucional :- educacion, !.
institucional :- administracion, !.

investigacion :- educacion, !.
investigacion :- exactas, !.
investigacion :- naturales, !.
investigacion :- sociales, !.
investigacion :- agropecuaria, !.

industria :- exactas, !.
industria :- sociales, !.
industria :- administracion, !.
industria :- agropecuaria, !.

ingenieria :- exactas, !.
ingenieria :- agropecuaria, !.


/* Carreras */
Agrimensura
Arquitectura




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
