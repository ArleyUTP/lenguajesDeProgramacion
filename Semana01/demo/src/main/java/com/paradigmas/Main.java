package com.paradigmas;

public class Main {
    public static void main(String[] args) {
        Suma suma = new Suma(5, 10);
        int resultado = suma.sumar();
        System.out.println("El resultado de la suma es: " + resultado);
    }
}