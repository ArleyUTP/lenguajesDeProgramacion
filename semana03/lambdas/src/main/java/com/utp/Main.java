package com.utp;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<String> names = Arrays.asList("Carlos", "Ana", "Pedro");

        Collections.sort(names, (a, b) -> a.compareTo(b));

        System.out.println(names);

        List<Empleado> empleados = Arrays.asList(
                new Empleado("Carlos", 1500),
                new Empleado("Ana", 1000),
                new Empleado("Pedro", 1300)
        );

        Lambdas lambda = new Lambdas();
        empleados.stream()
                .filter(lambda.esMayorAlMinimoSalario)
                .forEach(lambda.imprimirEmpleado);

        //calcular salario total de los que superen el minimo
        double salarioTotal = empleados.stream()
                .filter(lambda.esMayorAlMinimoSalario)
                .mapToDouble(lambda.obtenerSalario)
                .sum();
        System.out.println("Salario total a pagar: " + salarioTotal);
    }
}