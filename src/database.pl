/* Ambitos de trabajo */
industria     :- verify('ambito_industrial').
investigacion :- verify('ambito_investigacional').
otro          :- verify('otro_ambito').

/* Perfil personal */
organizador :- industria,     verify('manejar_informacion').
hacedor     :- industria,     verify('construir_soluciones'). 
persuasor   :- industria,     verify('relaciones_sociales').
pensador    :- investigacion, verify('manejar_informacion').
ayudante    :- otros,         verify('relaciones_sociales').
creador     :- otros,         verify('construir_soluciones').

/* Orientacion */
exactas        :- (pensador, !; hacedor),      verify('').
artisticas     :- (creador, !; hacedor),       verify('').
humanas        :- ayudante,                    verify('').
salud          :- ayudante,                    verify('').
administrativa :- (organizador, !; persuasor), verify('').


