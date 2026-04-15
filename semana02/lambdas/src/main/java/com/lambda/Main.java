package com.lambda;

import java.math.BigInteger;
import java.util.List;
import java.util.function.Function;
import java.util.function.Predicate;


public class Main {
    public static void main(String[] args) {
        //Calcular un factorial de un número utilizando funciones
        Function<Integer,BigInteger> factorial = n ->{
            if (n < 0) {
                throw new IllegalArgumentException("Negative numbers are not allowed.");
            }
            BigInteger result = BigInteger.ONE;
            for (int i = 2; i <= n; i++) {
                result = result.multiply(BigInteger.valueOf(i));
            }
            return result;
        };
        System.out.println(factorial.apply(5));
        //Calcular el cuadrado de los números pares en una lista utilizando funciones
        List<Integer> numeros = List.of(1, 2, 3, 4, 5);
        Function<Integer, BigInteger> cuadrado = n -> BigInteger.valueOf(n).multiply(BigInteger.valueOf(n));
        Predicate<Integer> esPar = n -> n % 2 == 0;
        List<BigInteger> nuevaLista = numeros.stream()
                .filter(esPar)
                .map(cuadrado)
                .toList();
        System.out.println(nuevaLista);
    }
}