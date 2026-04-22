package com.pc1.models;

public class Venta {
    private int id;
    private String producto;
    private String categoria;
    private double precio;
    private int cantidad;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getProducto() {
        return producto;
    }
    public void setProducto(String producto) {
        this.producto = producto;
    }
    public String getCategoria() {
        return categoria;
    }
    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
    public double getPrecio() {
        return precio;
    }
    public void setPrecio(double precio) {
        this.precio = precio;
    }
    public int getCantidad() {
        return cantidad;
    }
    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    @Override
    public String toString() {
        return """
                Venta:
                ID: %d
                Producto: %s
                Categoria: %s
                Precio: %.2f
                Cantidad: %d
                """.formatted(id, producto, categoria, precio, cantidad);
    }
}
