/*
 * Sistema experto para orientación vocacional
 * Para comenzar use ?- go.
 */

:- dynamic yes/1, no/1.

/* obtenerHechos arma una lista de X tales que se sabe que yes(X) */
obtenerHechos(Y) :- yes(X), not(member(X,Y)), !, obtenerHechos([X|Y]).
obtenerHechos(Y) :- volcarHechos(Y).

/* volcarHechos agrega a nuestros archivos de BD el listado de hechos */
volcarHechos([X])   :- write('verify('), write(X), write(').'), true.
volcarHechos([X|Y]) :- write('verify('), write(X), write('), '), volcarHechos(Y).

/* add(S) agrega la hipótesis y carrera correspondiente de S */
add(S) :- append('hypothesize.pl'),
          write('hypothesize('), write(S), write(') :- '), write(S), write(', !.'), nl,
          told,
          append('careers.pl'),
          write(S), write(' :- '),
          obtenerHechos([]), nl,
          told.

/* go corre el identificador de carreras */
go :- consult('database.pl'), consult('hypothesize.pl'), consult('careers.pl'),
      hypothesize(Carrera),
      write('Le recomendamos la carrera: '), write(Carrera), nl, undo.
go :- write('No encontramos la carrera adecuada, ingrese una nueva: '),
      flush_output(), read(S), add(S),
      write('Agregamos '), write(S), write(' a nuestra base de datos!'), nl, undo.

/* ask(Q) le pregunta al usuario sobre Q */
ask(Question) :-
    write('Le interesa la siguiente caracteristica: '), write(Question), write('? '),
    flush_output(), read(Response), nl,
    ( (Response == yes ; Response == y) -> assert(yes(Question)) ;
    assert(no(Question)), fail).

/* Verificar la propiedad S */
verify(S) :- ( yes(S) -> true ; (no(S) -> fail ; ask(S)) ).

/* Eliminar todos los asserts al finalizar el programa */
undo :- retract(yes(_)), fail.
undo :- retract(no(_)), fail.
undo.
