package com.pc1;

import java.util.List;
import java.util.function.Predicate;

import com.pc1.logic.VentaFuncion;
import com.pc1.models.Venta;
import com.pc1.services.ProductoService;

public class Main {
    public static void main(String[] args) {

        // Obtener la lista de ventas desde el servicio
        List<Venta> ventas = ProductoService.obtenerVentas();

        // 1. Obtener todas las ventas que pertenecen a la categoría "Tecnología"
        List<Venta> ventasTecnologia = ventas.stream()
            .filter(VentaFuncion::esCategoriaTegnologia)
            .toList();
        System.out.println("**** Ventas de Tecnología de categoría Tecnología: ****");
        VentaFuncion.mostrarListas(ventasTecnologia);

        // 2. Transformacion de datos Generar una nueva lista que contenga el total por venta (precio * cantidad)
        List<Double> totalesPorVenta = ventas.stream()
            .map(VentaFuncion::obtenerSubPrecios)
            .toList();
        System.out.println("**** Totales por venta: ****");
        VentaFuncion.mostrarListas(totalesPorVenta);
        VentaFuncion.mostrarListasConSubtotales(ventas);

        // 3. Reduccion de datos Calcular el ingreso total acomulado de todas las ventas
        double ingresoTotal = ventas.stream()
            .mapToDouble(VentaFuncion::obtenerSubPrecios)
            .sum();
        System.out.println("|Ingreso total acumulado de todas las ventas| " + ingresoTotal + "|");
        System.out.println();

        // 4. Funcion de orden superior  Implementar metodo que reciba un predicate como parametro y filtre la lista de ventas de manera dinamica
        //Ejemplo esperado:
        //Filtrar ventas con cantidad mayor a 10
        Predicate<Venta> esCantidadMayor = venta -> venta.getCantidad() > 10;
        List<Venta> ventasMayoresA10List = VentaFuncion.filtrarVentas(ventas, esCantidadMayor);
        System.out.println("**** Ventas con cantidad mayor a 10: ****");
        if (ventasMayoresA10List.isEmpty()) System.out.println("**** No hay ventas con cantidad mayor a 10. ****");
        VentaFuncion.mostrarListas(ventasMayoresA10List);

        //5. Ordenamiento Ordene la ventas por el total de venta (precio * cantidad) de manera descendente
        List<Venta> ventasOrdenadas = VentaFuncion.ordenarVentasPorTotal(ventas);
        System.out.println("**** Ventas ordenadas por total de venta (descendente): ****");
        VentaFuncion.mostrarListasConSubtotales(ventasOrdenadas);

        //6. Top 3 productos más vendidos  obtener los 3 productos con mayor cantidad vendida
        List<Venta> top3Productos = VentaFuncion.obtenerTop3ProductosMasVendidos(ventas);
        System.out.println("**** Top 3 productos más vendidos: ****");
        VentaFuncion.mostrarListas(top3Productos);
    }
}
