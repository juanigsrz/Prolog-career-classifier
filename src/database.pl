/* Ambitos de trabajo */
industria     :- verify('ambito_industrial').
investigacion :- verify('ambito_investigacional').
otro          :- verify('otro_ambito').

/* Perfil personal */
organizador :- industria,                     verify('manejar_informacion').
hacedor     :- (industria, !; investigacion), verify('construir_soluciones'). 
persuasor   :- industria,                     verify('relaciones_sociales').
pensador    :- investigacion,                 verify('manejar_informacion').
ayudante    :- otro,                          verify('relaciones_sociales').
creador     :- otro,                          verify('construir_soluciones').

/* Orientacion */
exactas        :- (pensador, !; hacedor),      verify('ciencia').
artisticas     :- (creador, !; hacedor),       verify('cultura').
humanas        :- ayudante,                    verify('cultura').
salud          :- ayudante,                    verify('ciencia').
administrativa :- (organizador, !; persuasor), verify('ciencia').
