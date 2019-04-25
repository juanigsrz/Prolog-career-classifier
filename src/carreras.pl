/* Carreras */
arquitectura :- (de_campo, !; industria, !), verify(edificaciones).
ciencias_politicas :- (oficina, !;institucional, !), verify(habilidades_sociales).
comunicacion_social :- (oficina, !;institucional, !), verify(habilidades_sociales).
relaciones_internacionales :- (oficina, !;institucional, !), verify(habilidad_sociales).
ingenieria_civil :- (ingenieria, !;oficina, !;industria, !), verify(edificaciones).
ciencias_de_la_computacion :- (oficina, !;investigacion, !;industria, !;ingenieria, !), verify(informatica).
medicina :- (de_campo, !;investigacion, !;industria, !;oficina, !), verify(biologia).
abogacia :- (oficina, !;institucional, !), verify(asuntos_legales).
economia :- (oficina, !;investigacion, !;industria, !;institucional, !), verify(asuntos_legales).
agrimensura :- (de_campo, !; investigacion, !; industria, !; ingenieria, !), verify(edificaciones).
enguel :- verify(area_naturales).