package com.example;

import java.util.function.BiPredicate;
import java.util.function.Function;
import java.util.function.Predicate;

public class Main {
    public static void main(String[] args) {
        Predicate<Integer> esPar = n -> n % 2 == 0;
        BiPredicate<Integer, Integer> esMayorA = (n, numMax) -> n > numMax;
        mostrarConCondicion(4, esPar);
        mostrarConCondicion(3, esMayorA);
        Function<Integer, Integer> elevarAlCuadrado = crearElevacion(2);
        System.out.println("5 elevado al cuadrado es: " + elevarAlCuadrado.apply(5));
        Function<Integer, Integer> elevarAlCubo = crearElevacion(3);
        System.out.println("5 elevado al cubo es: " + elevarAlCubo.apply(5));

        Predicate<String> validadorDeLongitud = crearValidadorDeLongitud(5, 10);
        String texto1 = "Hola";
        String texto2 = "Hola Mundo";
        System.out.println("¿'" + texto1 + "' cumple con la condición de longitud? " + validadorDeLongitud.test(texto1));
        System.out.println("¿'" + texto2 + "' cumple con la condición de longitud? " + validadorDeLongitud.test(texto2));

        BiPredicate<String, String> validadorContraseña = comprobarContraseña("miContraseña123", "miContraseña123");
        System.out.println("¿La contraseña ingresada es correcta? " + validadorContraseña.test("miContraseña123", "miContraseña123"));
        System.out.println("¿La contraseña ingresada es correcta? " + validadorContraseña.test("otraContraseña", "miContraseña123"));

    }

    public static void mostrarConCondicion(int num, Predicate<Integer> condicion) {
        if (condicion.test(num)) {
            System.out.println(num + " cumple con la condición");
        }
    }
        public static void mostrarConCondicion(int num, BiPredicate<Integer, Integer> condicion) {
        if (condicion.test(num, 5)) {
            System.out.println(num + " cumple con la condición de ser mayor que "+condicion.toString());
        }
    }

    public static Function<Integer, Integer> crearElevacion(int exponente) {
        return n -> (int) Math.pow(n, exponente);
    }

    public static Predicate<String> crearValidadorDeLongitud(int longitudMinima, int longitudMaxima) {
        return s -> s.length() >= longitudMinima && s.length() <= longitudMaxima;
    }
    public static BiPredicate<String,String> comprobarContraseña(String contraseñaIngresada, String contraseñaCorrecta) {
        return (ingresada, correcta) -> ingresada.equals(correcta);
    }
}