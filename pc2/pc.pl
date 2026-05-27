% Hechos sobre mascotas, propietarios, enfermedades y tratamientos

% ? Mascotas
mascota(firulais, perro, 5, ana).
mascota(luna, gato, 3, ana).
mascota(rocky, perro, 7, carlos).
mascota(mishi, gato, 2, beatriz).
mascota(nemo, pez, 1, daniel).
mascota(kiara, perro, 4, elena).
% ? Enfermedades
enfermedad(firulais, dermatitis).
enfermedad(luna, otitis).
enfermedad(rocky, dermatitis).
enfermedad(mishi, gripe_felina).
enfermedad(nemo, infeccion_bacteriana).
enfermedad(kiara, otitis).

% ? Tratamientos
% Uso de lista para almacenar varios tratamientos por mascota
tratamientos(firulais, [bano_medico, antibiotico, dieta_hipoalergenica]).
tratamientos(luna, [gotas_oticas, antibiotico]).
tratamientos(rocky, [bano_medico, antiinflamatorio]).
tratamientos(mishi, [antiviral, vitaminas]).
tratamientos(nemo, [antibiotico_agua, control_temperatura]).
tratamientos(kiara, [gotas_oticas, antiinflamatorio]).

% * Reglas

% recibe_tratamiento(Mascota, Tratamiento)
% Verdadero si Tratamiento pertenece a la lista de tratamientos de Mascota.
recibe_tratamiento(Mascota, Tratamiento) :-
    tratamientos(Mascota, Lista),
    member(Tratamiento, Lista).

% misma_enfermedad(Mascota1, Mascota2, Enfermedad)
% Verdadero si Mascota1 y Mascota2 presentan la misma Enfermedad.
% se usa @< para obtener solo combinaciones únicas (sin repetir el mismo par al revés)
misma_enfermedad(Mascota1, Mascota2, Enfermedad) :-
    enfermedad(Mascota1, Enfermedad),
    enfermedad(Mascota2, Enfermedad),
    Mascota1 @< Mascota2.

% propietario_con_mas_de_una_mascota(Propietario)
% Verdadero si un propietario tiene 2 o más mascotas registradas.
% ^ se usa para indicar que no nos interesa el valor de Especie y Edad al contar mascotas
% setof se usa para obtener una lista de mascotas únicas por propietario
propietario_con_mas_de_una_mascota(Propietario) :-
    setof(M, Especie^Edad^mascota(M, Especie, Edad, Propietario), ListaMascotas),
    length(ListaMascotas, Cantidad),
    Cantidad > 1.

% cantidad_mascotas(Propietario, Cantidad)
% Devuelve cuántas mascotas tiene cada propietario.
cantidad_mascotas(Propietario, Cantidad) :-
	findall(M,
			mascota(M, _, _, Propietario),
			ListaMascotas),
	length(ListaMascotas, Cantidad).
