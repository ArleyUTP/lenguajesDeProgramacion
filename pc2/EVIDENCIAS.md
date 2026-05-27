# Evidencias de Cumplimiento - Sistema Veterinario en Prolog

Este documento indica exactamente en qué parte del código se evidencia cada criterio solicitado y qué puedes mostrar durante la exposición.

## 1) Representar los hechos y reglas del problema utilizando programación lógica

- Hechos de mascotas: [pc2/prueba.pl](pc2/prueba.pl#L19)
- Hechos de enfermedades: [pc2/prueba.pl](pc2/prueba.pl#L31)
- Hechos de tratamientos: [pc2/prueba.pl](pc2/prueba.pl#L44)
- Reglas de inferencia: [pc2/prueba.pl](pc2/prueba.pl#L57)

Qué evidencia mostrar:
- Que los datos base están como hechos (`mascota/4`, `enfermedad/2`, `tratamientos/2`).
- Que las respuestas derivadas salen de reglas (`recibe_tratamiento/2`, `misma_enfermedad/3`, `propietario_con_mas_de_una_mascota/1`, `cantidad_mascotas/2`).

## 2) Aplicar términos, átomos, constantes y predicados correctamente

- Predicado con términos compuestos: [pc2/prueba.pl](pc2/prueba.pl#L19)
- Uso de átomos/constantes (`firulais`, `perro`, `ana`, `dermatitis`, `antibiotico`): [pc2/prueba.pl](pc2/prueba.pl#L19)
- Variables lógicas (`Mascota`, `Tratamiento`, `Propietario`, etc.): [pc2/prueba.pl](pc2/prueba.pl#L57)

Qué evidencia mostrar:
- En Prolog, nombres en minúscula son átomos/constantes y en mayúscula son variables.
- Cada predicado tiene aridad correcta: `mascota/4`, `enfermedad/2`, `tratamientos/2`.

## 3) Implementar consultas que permitan extraer respuestas automáticas

- Consultas guía dentro del archivo: [pc2/prueba.pl](pc2/prueba.pl#L90)

Qué evidencia mostrar:
- Ejecutar en consola:

```prolog
?- recibe_tratamiento(Mascota, antibiotico).
?- misma_enfermedad(M1, M2, E).
?- propietario_con_mas_de_una_mascota(P).
?- cantidad_mascotas(ana, C).
```

- Explicar que Prolog responde automáticamente por búsqueda lógica y backtracking.

## 4) Utilizar listas para registrar tratamientos médicos

- Listas en hechos de tratamiento: [pc2/prueba.pl](pc2/prueba.pl#L44)
- Consulta de pertenencia a lista con `member/2`: [pc2/prueba.pl](pc2/prueba.pl#L59)

Qué evidencia mostrar:
- Estructura lista: `[bano_medico, antibiotico, dieta_hipoalergenica]`.
- Consulta:

```prolog
?- tratamientos(firulais, T).
?- recibe_tratamiento(firulais, antibiotico).
```

## 5) Demostrar uso de unificación, resolución e indeterminismo

- Unificación de variables con hechos: [pc2/prueba.pl](pc2/prueba.pl#L57)
- Resolución encadenando objetivos: [pc2/prueba.pl](pc2/prueba.pl#L64)
- Indeterminismo (múltiples respuestas): [pc2/prueba.pl](pc2/prueba.pl#L57)

Qué evidencia mostrar:
- Unificación: en `recibe_tratamiento(Mascota, antibiotico)`, `Mascota` se unifica con cada mascota válida.
- Resolución: `misma_enfermedad/3` combina dos hechos `enfermedad/2` y una condición de orden.
- Indeterminismo: al pedir más respuestas con `;`, aparecen más soluciones.

## 6) Mostrar ejemplos de ejecución y resultados obtenidos

Resultados ejecutados en SWI-Prolog:

```text
Q1: recibe_tratamiento(M, antibiotico)
firulais
luna

Q2: misma_enfermedad(A,B,E)
firulais, rocky, dermatitis
kiara, luna, otitis

Q3: propietario_con_mas_de_una_mascota(P)
ana

Q4: cantidad_mascotas(ana, C)
2

Q5: tratamientos(firulais, T)
[bano_medico,antibiotico,dieta_hipoalergenica]
```

## Lógica empleada (explicación breve)

El programa modela la clínica veterinaria mediante hechos para datos base y reglas para inferir información nueva. Las listas permiten almacenar varios tratamientos por mascota, y `member/2` verifica si un tratamiento pertenece a la lista. Las consultas se resuelven con unificación de variables, resolución de objetivos y backtracking, lo que permite obtener respuestas automáticas y múltiples soluciones cuando existen.

## Qué evidencias mostrar en tu entrega

- Captura del archivo con hechos y reglas: [pc2/prueba.pl](pc2/prueba.pl).
- Captura de ejecución de consultas en consola con resultados.
- Explicación corta de unificación, resolución e indeterminismo usando una consulta real (por ejemplo, `recibe_tratamiento/2`).
- Señalar explícitamente el uso de listas en `tratamientos/2`.
