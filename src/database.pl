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
de_campo :- sociales.

institucional :- educacion, !.
institucional :- administracion.

investigacion :- educacion, !.
investigacion :- exactas, !.
investigacion :- naturales, !.
investigacion :- sociales, !.
investigacion :- agropecuaria.

industria :- exactas, !.
industria :- sociales, !.
industria :- administracion, !.
industria :- agropecuaria.

ingenieria :- exactas, !.
ingenieria :- agropecuaria.


/* Carreras */
arquitectura :- (de_campo, !; industria, !), verify(disenio).
ciencias_politicas :- (oficina, !;institucional, !).
comunicacion_social :- (oficina, !;institucional, !).
relaciones_internacionales :- (oficina, !;institucional, !).
ingenieria_civil :- (ingenieria, !;oficina, !;industria, !).
ciencias_de_la_computacion :- (oficina, !;investigacion, !;industria, !;ingenieria, !).
medicina :- (de_campo, !;investigacion, !;industria, !;oficina, !).
abogacia :- (oficina, !;institucional, !).
economia :- (oficina, !;investigacion, !;industria, !;institucional, !).
agrimensura :- (de_campo, !; investigacion, !; industria, !; ingenieria, !), verify(plantas).


hypothesize(agrimensura) :- agrimensura, !.
hypothesize(arquitectura) :- arquitectura, !.
hypothesize(ciencias_politicas) :- ciencias_politicas, !.
hypothesize(comunicacion_social) :- comunicacion_social, !.
hypothesize(relaciones_internacionales) :- relaciones_internacionales, !.
hypothesize(ingenieria_civil) :- ingenieria_civil, !.
hypothesize(ciencias_de_la_computacion) :- ciencias_de_la_computacion, !.
hypothesize(medicina) :- medicina, !.
hypothesize(abogacia) :- abogacia, !.
hypothesize(economia) :- economia, !.
hypothesize(unknown).
