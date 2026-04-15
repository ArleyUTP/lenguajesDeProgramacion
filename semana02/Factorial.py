##Implementar una funcion pura para calcular el factorial en python

numeros = [1, 2, 3, 4, 5]
cuadrado = lambda numero: numero * numero
esPar = lambda numero: numero % 2 == 0
numero_finales = list(filter(esPar, map(cuadrado, numeros)))
print(numero_finales)