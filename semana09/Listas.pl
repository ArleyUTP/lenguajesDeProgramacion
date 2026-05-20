% ? Base de datos de empleados
empleados([
          empleado(juan,sistemas,programador,3500),
          empleado(luis,sistemas,contador,4000),
          empleado(maria,'RRHH',analista,3000),
          empleado(carlos,ventas,gerente,5000),
            empleado(ana,marketing,coordinador,3200)
          ]).
% ? Mostrar todos los empleados de la lista
mostrar_empleados([]).
mostrar_empleados([empleado(Nombre, Area, Cargo, Sueldo) | T]) :-
    write('Nombre: '), write(Nombre), nl,
    write('Área: '), write(Area), nl,
    write('Cargo: '), write(Cargo), nl,
    write('Sueldo: '), write(Sueldo), nl, nl,
    write('-----------------------------'), nl,
    mostrar_empleados(T).

% ? Buscar empleado por nombre
buscar_empleado(Nombre, [empleado(Nombre,Area,Cargo,Sueldo) | _]) :-
    write('Empleado encontrado:'), nl,
    write('Nombre: '), write(Nombre), nl,
    write('Área: '), write(Area), nl,
    write('Cargo: '), write(Cargo), nl,
    write('Sueldo: '), write(Sueldo), nl.
buscar_empleado(Nombre, [_ | T]) :-
    buscar_empleado(Nombre, T).

% ? Mostrar empleados por área
empleados_por_area(_, []).
empleados_por_area(Area, [empleado(Nombre,Area,Cargo,Sueldo) | T]) :-
    write('Nombre: '), write(Nombre), nl,
    write('Área: '), write(Area), nl,
    write('Cargo: '), write(Cargo), nl,
    write('Sueldo: '), write(Sueldo), nl, nl,
    write('-----------------------------'), nl,
    empleados_por_area(Area, T).
empleados_por_area(Area, [_ | T]) :-
    empleados_por_area(Area, T).

% ? Contar empleados
contar_empleados([], 0).
contar_empleados([_ | T], Count) :-
    contar_empleados(T, Count1),
    Count is Count1 + 1.