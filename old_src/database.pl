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
