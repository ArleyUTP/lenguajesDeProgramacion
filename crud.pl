% Necesario para poder modificar la BD con retract/asserta
:- dynamic empleados/1.

% --- DATOS INICIALES ---
empleados([empleado(juan, desarrollador, 2500),
           empleado(ana, tester, 2000),
           empleado(pedro, lider, 3500)]).

% ============================================================
% READ - Consultar datos
% ============================================================

% 2. Buscar datos de un empleado
%    member/2 bindea Cargo y Sueldo con los valores de la BD.
datos_empleado(Nombre, Cargo, Sueldo) :-
    empleados(Lista),
    member(empleado(Nombre, Cargo, Sueldo), Lista).

% 3. Listar TODOS los empleados
%    Recursion con [Cabeza|Resto]: muestra 1, sigue con el resto.
listar_empleados :-
    empleados(Lista),
    listar_emp(Lista).

listar_emp([]).  % Caso base: lista vacia, no hago nada.
listar_emp([empleado(N, C, S) | Resto]) :-
    format('~w -> ~w, $~w~n', [N, C, S]),
    listar_emp(Resto).

% 4. Buscar por cargo (devuelve lista de resultados)
%    findall/3 junta TODAS las soluciones en una lista.
empleados_por_cargo(Cargo, Resultado) :-
    empleados(Lista),
    findall(empleado(N, Cargo, S),
            member(empleado(N, Cargo, S), Lista),
            Resultado).

% 5. Buscar por sueldo minimo
%    findall + condicion en el medio.
empleados_sueldo_mayor(Minimo, Resultado) :-
    empleados(Lista),
    findall(empleado(N, C, S),
            (member(empleado(N, C, S), Lista), S >= Minimo),
            Resultado).

% ============================================================
% CREATE - Agregar empleado
% ============================================================
%
% Formula general:  verifico -> retract -> asserta -> corte
%
agregar_empleado(Nombre, Cargo, Sueldo) :-
    % 1. Verifico que NO exista ya (\+ es "no se cumple")
    empleados(Lista),
    \+ member(empleado(Nombre, _, _), Lista),
    % 2. Borro el hecho viejo
    retract(empleados(Lista)),
    % 3. Agrego el nuevo al principio
    asserta(empleados([empleado(Nombre, Cargo, Sueldo) | Lista])),
    % 4. Corte: si llegue aca, no quiero que backtrackee a otra regla
    !.

% Si ya existe, muestro error y fallo.
% Prolog llega aca SOLO si la regla de arriba fallo (ya existia).
agregar_empleado(Nombre, _, _) :-
    format('ERROR: ~w ya existe~n', [Nombre]),
    fail.

% ============================================================
% DELETE - Eliminar empleado
% ============================================================
%
% select/3 busca el elemento, lo saca de la lista, y deja el resto.
% Es la forma mas limpia de "buscar y eliminar" en una lista.
%
eliminar_empleado(Nombre) :-
    empleados(Lista),
    select(empleado(Nombre, _, _), Lista, Resto),
    retract(empleados(Lista)),
    asserta(empleados(Resto)),
    !.

% Si no existe: select falla, entonces Prolog prueba esta regla.
eliminar_empleado(Nombre) :-
    format('ERROR: ~w no encontrado~n', [Nombre]),
    fail.

% ============================================================
% UPDATE - Actualizar empleado
% ============================================================
%
% select/3 busca el empleado VIEJO, lo saca,
% y creamos el NUEVO con los datos actualizados.
%

% Actualizar sueldo
actualizar_sueldo(Nombre, NuevoSueldo) :-
    empleados(Lista),
    select(empleado(Nombre, Cargo, _), Lista, Resto),
    retract(empleados(Lista)),
    asserta(empleados([empleado(Nombre, Cargo, NuevoSueldo) | Resto])),
    !.

actualizar_sueldo(Nombre, _) :-
    format('ERROR: ~w no encontrado~n', [Nombre]),
    fail.

% Actualizar cargo y sueldo
actualizar_empleado(Nombre, NuevoCargo, NuevoSueldo) :-
    empleados(Lista),
    select(empleado(Nombre, _, _), Lista, Resto),
    retract(empleados(Lista)),
    asserta(empleados([empleado(Nombre, NuevoCargo, NuevoSueldo) | Resto])),
    !.

actualizar_empleado(Nombre, _, _) :-
    format('ERROR: ~w no encontrado~n', [Nombre]),
    fail.

% ============================================================
% VARIANTE: las mismas operaciones pero con RECURSION
% (por si en el examen piden hacerlo a mano sin select/3)
% ============================================================

% --- Eliminar con recursion (version alternativa) ---
eliminar_rec(Nombre) :-
    empleados(Lista),
    sacar(Nombre, Lista, NuevaLista),
    retract(empleados(Lista)),
    asserta(empleados(NuevaLista)),
    !.

sacar(_, [], []).                                    % Caso base
sacar(N, [empleado(N, _, _) | R], R) :- !.           % Encontre, descarto
sacar(N, [E | R], [E | R2]) :- sacar(N, R, R2).     % No es este, sigo

% --- Actualizar con recursion (version alternativa) ---
actualizar_rec(Nombre, NuevoCargo, NuevoSueldo) :-
    empleados(Lista),
    reemplazar(Nombre, NuevoCargo, NuevoSueldo, Lista, NuevaLista),
    retract(empleados(Lista)),
    asserta(empleados(NuevaLista)),
    !.

reemplazar(_, _, _, [], []).                                 % Caso base
reemplazar(N, NC, NS, [empleado(N, _, _) | R],
                       [empleado(N, NC, NS) | R]) :- !.      % Encontre
reemplazar(N, NC, NS, [E | R], [E | R2]) :-
    reemplazar(N, NC, NS, R, R2).                            % Sigo buscando

% ============================================================
% CONSEJOS PARA EL EXAMEN
% ============================================================
%
% 1.  La coma (,) en el CUERPO de la regla = AND logico
% 2.  _ significa "no me importa el valor" (variable anonima)
% 3.  [Cabeza|Resto] parte la lista: el primero, y el resto
% 4.  Toda recursion necesita CASO BASE ([]) y CASO RECURSIVO ([C|R])
% 5.  ! (corte) evita backtracking. Siempre al final de retract+asserta
% 6.  \+ es "no se cumple" (negacion por falla)
% 7.  member/2 busca y puede devolver MULTIPLES soluciones (backtracking)
% 8.  select/3 busca Y elimina de la lista en un solo paso
% 9.  findall/3 colecciona todas las soluciones
% 10. retract/1 borra un hecho, asserta/1 agrega uno nuevo
%
