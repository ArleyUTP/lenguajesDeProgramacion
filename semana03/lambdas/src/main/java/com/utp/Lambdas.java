package com.utp;

import java.util.function.Consumer;
import java.util.function.Predicate;
import java.util.function.ToDoubleFunction;

public class Lambdas {
    Predicate<Empleado> esMayorAlMinimoSalario = empleado -> empleado.getSalario() > 1200;
    Consumer<Empleado> imprimirEmpleado = empleado -> System.out.println(empleado.getNombre() + " tiene un salario mayor al mínimo: " + empleado.getSalario());
    ToDoubleFunction<Empleado> obtenerSalario = Empleado::getSalario;
}
