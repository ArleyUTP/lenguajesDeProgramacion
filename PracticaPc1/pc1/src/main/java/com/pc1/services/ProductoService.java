package com.pc1.services;

import java.util.List;

import com.pc1.models.Venta;

public class ProductoService {
    public static List<Venta> obtenerVentas() {
        return List.of(
                new Venta() {
                    {
                        setId(1);
                        setProducto("Laptop");
                        setCategoria("Tecnología");
                        setPrecio(1200.00);
                        setCantidad(2);
                    }
                },
                new Venta() {
                    {
                        setId(2);
                        setProducto("Smartphone");
                        setCategoria("Tecnología");
                        setPrecio(800.00);
                        setCantidad(3);
                    }
                },
                new Venta() {
                    {
                        setId(3);
                        setProducto("Camiseta");
                        setCategoria("Ropa");
                        setPrecio(20.00);
                        setCantidad(5);
                    }
                },
                new Venta() {
                    {
                        setId(4);
                        setProducto("Televisor");
                        setCategoria("Tecnología");
                        setPrecio(1500.00);
                        setCantidad(1);
                    }
                },
                new Venta() {
                    {
                        setId(5);
                        setProducto("Zapatos");
                        setCategoria("Ropa");
                        setPrecio(50.00);
                        setCantidad(4);
                    }
                },
                new Venta() {
                    {
                        setId(6);
                        setProducto("Tablet");
                        setCategoria("Tecnología");
                        setPrecio(300.00);
                        setCantidad(6);
                    }
                },
                new Venta() {
                    {
                        setId(7);
                        setProducto("Auriculares");
                        setCategoria("Tecnología");
                        setPrecio(150.00);
                        setCantidad(12);
                    }
                },
                new Venta() {
                    {
                        setId(8);
                        setProducto("Pantalones");
                        setCategoria("Ropa");
                        setPrecio(40.00);
                        setCantidad(7);
                    }
                },
                new Venta() {
                    {
                        setId(9);
                        setProducto("Monitor");
                        setCategoria("Tecnología");
                        setPrecio(200.00);
                        setCantidad(4);
                    }
                },
                new Venta() {
                    {
                        setId(10);
                        setProducto("Mouse");
                        setCategoria("Tecnología");
                        setPrecio(50.00);
                        setCantidad(10);
                    }
                });
    }
}
