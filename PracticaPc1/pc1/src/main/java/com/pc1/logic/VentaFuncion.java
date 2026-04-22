package com.pc1.logic;

import java.util.List;
import java.util.function.Predicate;

import com.pc1.models.Venta;

public class VentaFuncion {

    // 1. Filtrado de datos Obtener todas las ventas que pertenecen a la categoría "Tecnología".
    public static boolean esCategoriaTegnologia(Venta venta) {
        return "tecnología".equalsIgnoreCase(venta.getCategoria());
    }

    // 2. Transformación de datos Calcular el precio total de cada venta (precio * cantidad)
    public static double obtenerSubPrecios(Venta venta) {
        return venta.getPrecio() * venta.getCantidad();
    }

    // 4. Funcion de orden superior  Implementar metodo que reciba un predicate como parametro y filtre la lista de ventas de manera dinamica
    public static List<Venta> filtrarVentas(List<Venta> ventas, Predicate<Venta> criterio) {
        return ventas.stream()
            .filter(criterio)
            .toList();
    }

    //5. Ordenamiento Ordene la ventas por el total de venta (precio * cantidad) de manera descendente
    public static List<Venta> ordenarVentasPorTotal(List<Venta> ventas) {
        return ventas.stream()
            .sorted((v1, v2) -> Double.compare(obtenerSubPrecios(v2), obtenerSubPrecios(v1)))
            .toList();
    }

    //6. Top 3 productos más vendidos  obtener los 3 productos con mayor cantidad vendida
    public static List<Venta> obtenerTop3ProductosMasVendidos(List<Venta> ventas) {
        return ventas.stream()
            .sorted((v1, v2) -> Integer.compare(v2.getCantidad(), v1.getCantidad()))
            .limit(3)
            .toList();
    }

    // Método genérico para mostrar listas de cualquier tipo
    public static void mostrarListas(List<?> lista) {
        lista.forEach(System.out::println);
    }

    //Metodo para mostrar producto con su subtotales
    public static void mostrarListasConSubtotales(List<Venta> ventas) {
        ventas.forEach(venta -> {
            double subtotal = obtenerSubPrecios(venta);
            System.out.println(venta);
            System.out.printf("Subtotal: %.2f%n", subtotal);
            System.out.println("---------------------------");
        });
    }
}
