/*
   Sistema básico de clínica veterinaria en Prolog
   ------------------------------------------------
   Este programa usa:
   - Hechos (mascota, enfermedad, tratamientos)
   - Reglas (consultas derivadas)
   - Listas (tratamientos por mascota)
   - Unificación, resolución e indeterminismo (backtracking)

   Cargar en SWI-Prolog:
   ?- [prueba].
*/

% =========================
% HECHOS: MASCOTAS
% mascota(NombreMascota, Especie, Edad, Propietario).
% =========================

mascota(firulais, perro, 5, ana).
mascota(luna, gato, 3, ana).
mascota(rocky, perro, 7, carlos).
mascota(mishi, gato, 2, beatriz).
mascota(nemo, pez, 1, daniel).
mascota(kiara, perro, 4, elena).

% =========================
% HECHOS: ENFERMEDADES
% enfermedad(Mascota, Enfermedad).
% =========================

enfermedad(firulais, dermatitis).
enfermedad(luna, otitis).
enfermedad(rocky, dermatitis).
enfermedad(mishi, gripe_felina).
enfermedad(nemo, infeccion_bacteriana).
enfermedad(kiara, otitis).

% =========================
% HECHOS: TRATAMIENTOS
% tratamientos(Mascota, ListaDeTratamientos).
% Se usa una lista para almacenar varios tratamientos por mascota.
% =========================

tratamientos(firulais, [bano_medico, antibiotico, dieta_hipoalergenica]).
tratamientos(luna, [gotas_oticas, antibiotico]).
tratamientos(rocky, [bano_medico, antiinflamatorio]).
tratamientos(mishi, [antiviral, vitaminas]).
tratamientos(nemo, [antibiotico_agua, control_temperatura]).
tratamientos(kiara, [gotas_oticas, antiinflamatorio]).

% =====================================================
% REGLAS
% =====================================================

% recibe_tratamiento(Mascota, Tratamiento)
% Verdadero si Tratamiento pertenece a la lista de tratamientos de Mascota.
recibe_tratamiento(Mascota, Tratamiento) :-
	tratamientos(Mascota, Lista),
	member(Tratamiento, Lista).

% misma_enfermedad(Mascota1, Mascota2, Enfermedad)
% Verdadero si ambas mascotas tienen la misma enfermedad.
% Mascota1 @< Mascota2 evita pares repetidos (A,B) y (B,A).
misma_enfermedad(Mascota1, Mascota2, Enfermedad) :-
	enfermedad(Mascota1, Enfermedad),
	enfermedad(Mascota2, Enfermedad),
	Mascota1 @< Mascota2.

% propietario_con_mas_de_una_mascota(Propietario)
% Verdadero si un propietario tiene 2 o más mascotas registradas.
propietario_con_mas_de_una_mascota(Propietario) :-
	setof(M,
	    Especie^Edad^mascota(M, Especie, Edad, Propietario),
		  ListaMascotas),
	length(ListaMascotas, Cantidad),
	Cantidad > 1.

% cantidad_mascotas(Propietario, Cantidad)
% Devuelve cuántas mascotas tiene cada propietario.
cantidad_mascotas(Propietario, Cantidad) :-
	findall(M,
			mascota(M, _, _, Propietario),
			ListaMascotas),
	length(ListaMascotas, Cantidad).

% =====================================================
% CONSULTAS DE EJEMPLO (ejecutar en consola Prolog)
% =====================================================

/*
1) ¿Qué mascotas reciben un determinado tratamiento?

?- recibe_tratamiento(Mascota, antibiotico).

Resultado esperado (por backtracking):
Mascota = firulais ;
Mascota = luna.

Explicación: La consulta busca todas las mascotas que tienen "antibiotico" en su lista de tratamientos. El sistema encuentra a "firulais" y "luna" como resultados válidos usando el concepto de backtracking que es
cuando Prolog explora todas las posibilidades para encontrar soluciones a la consulta, se usa indeterminismo con el ; para mostrar múltiples resultados.

2) ¿Qué mascotas presentan la misma enfermedad?

?- misma_enfermedad(M1, M2, E).

Ejemplos esperados:
M1 = firulais, M2 = rocky, E = dermatitis ;
M1 = kiara, M2 = luna, E = otitis.

Explicación: La consulta busca pares de mascotas que compartan la misma enfermedad. Prolog unifica las variables M1, M2 y E con los hechos de enfermedades, mostrando combinaciones únicas gracias a @<.

3) ¿Qué propietarios tienen más de una mascota?

?- propietario_con_mas_de_una_mascota(P).

Resultado esperado:
P = ana.

Explicación: La consulta identifica a los propietarios que tienen más de una mascota registrada. Prolog utiliza setof para crear una lista de mascotas por propietario y luego verifica la cantidad con length.

4) ¿Cuántas mascotas tiene un propietario?

?- cantidad_mascotas(ana, C).
Resultado esperado: C = 2.

Explicación: La consulta cuenta cuántas mascotas tiene el propietario "ana". Prolog usa findall para reunir todas las mascotas de "ana" y luego length para contar cuántas hay.

5) Ver tratamientos completos de una mascota (lista)

?- tratamientos(firulais, T).
Resultado esperado: T = [bano_medico, antibiotico, dieta_hipoalergenica].

explicación: La consulta muestra la lista completa de tratamientos para "firulais". Prolog unifica T con la lista de tratamientos definida en los hechos.
*/

