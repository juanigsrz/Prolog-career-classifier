/* Carreras y sus caracteristicas que las definen */
computacion  :- exactas,                      verify('informatica').
ingenieria   :- exactas,                      verify('calculos').
bellas_artes :- artisticas,                   verify('investigar').
musica       :- artisticas,                   verify('crear').
educacion    :- humanas,                      verify('enseñar').
militar      :- humanas,                      verify('calculos').
detective    :- humanas,                      verify('investigar').
veterinaria  :- salud,                        verify('animales').
medicina     :- salud,                        verify('investigar').
hoteleria    :- (humanas, !; administrativa), verify('hoteles').
marketing    :- administrativa,               verify('crear').
pepa :- verify(relaciones_sociales), verify(construir_soluciones), verify(otro_ambito), verify(manejar_informacion), verify(ambito_investigacional).
