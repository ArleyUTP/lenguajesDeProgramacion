# Clase Alumno con validación de datos
class Alumno:
    def __init__(self,codigo: str, nombre: str, edad: int, nota: float, estado: str = "activo"):
        # Validaciones básicas
        if not isinstance(codigo, str) or not codigo.strip():
            raise ValueError("El código debe ser una cadena no vacía.")
        if not isinstance(nombre, str) or not nombre.strip():
            raise ValueError("El nombre debe ser una cadena no vacía.")
        if not isinstance(edad, int) or edad <= 0:
            raise ValueError("La edad debe ser un número entero positivo.")
        if not isinstance(nota, (int, float)) or not (0 <= nota <= 20):
            raise ValueError("La nota debe estar entre 0 y 20.")

        self.nombre = nombre.strip().title()
        self.edad = edad
        self.nota = float(nota)
        self.codigo = codigo.strip()
        self.estado = estado.strip().lower()
    def mostrar_datos(self):
        """Muestra la información del alumno."""
        print(f"Código: {self.codigo}")
        print(f"Nombre: {self.nombre}")
        print(f"Edad: {self.edad} años")
        print(f"Nota: {self.nota}")
        print(f"Estado: {self.estado}")

    def aprobado(self) -> bool:
        """Devuelve True si el alumno aprobó (nota >= 11)."""
        return self.nota >=12

# EJemplos por default
alumnos = [
    Alumno("u23238842", "Juan Pérez", 20, 15.5),
    Alumno("u23238843", "María López", 22, 9.0),
    Alumno("u23238844", "Carlos García", 19, 12.0)
]

def generar_codigo_estudiante(alumnos: list[Alumno]) -> str:
    """Genera un código de estudiante basado en el nombre y un número aleatorio."""
    import random
    import string
    numero_aleatorio = ''.join(random.choices(string.digits, k=8))
    if any(alumno.codigo == f"u{numero_aleatorio}" for alumno in alumnos):
        return generar_codigo_estudiante(alumnos)  # Generar otro código si ya existe
    return f"u{numero_aleatorio}"


opciones = """
Seleccione una opción:
1. Agregar alumno
2. Mostrar alumnos
3. Calificar alumnos
4. Reporte de aprobados y desaprobados
5. Dar de baja a un alumno
6. Salir
"""

while (True):
    print(opciones)
    opcion = input("Ingrese su opción: ")

    if opcion == "1":
        try:
            codigo = generar_codigo_estudiante(alumnos)
            nombre = input("Ingrese el nombre del alumno: ")
            edad = int(input("Ingrese la edad del alumno: "))
            nota = float(input("Ingrese la nota del alumno (0-20): "))
            alumno = Alumno(codigo, nombre, edad, nota)
            alumnos.append(alumno)
            print("Alumno agregado exitosamente.\n")
        except ValueError as e:
            print(f"Error: {e}\n")

    elif opcion == "2":
        if not alumnos:
            print("No hay alumnos registrados.\n")
        else:
            for alumno in alumnos:
                if alumno.estado == "activo":
                    alumno.mostrar_datos()
                    print()

    elif opcion == "3":
        if not alumnos:
            print("No hay alumnos registrados para calificar.\n")
        else:
            for alumno in alumnos:
                print(f"Calificando al alumno {alumno.nombre} (Código: {alumno.codigo})")
                try:
                    nueva_nota = float(input(f"Ingrese la nueva nota para {alumno.nombre} (0-20): "))
                    if 0 <= nueva_nota <= 20:
                        alumno.nota = nueva_nota
                        print(f"Nota actualizada a {alumno.nota}.\n")
                    else:
                        print("La nota debe estar entre 0 y 20.\n")
                except ValueError:
                    print("Entrada inválida. La nota debe ser un número.\n")

    elif opcion == "4":
        aprobados = [alumno for alumno in alumnos if alumno.aprobado()]
        if not aprobados:
            print("No hay alumnos aprobados.\n")
        else:
            print("Alumnos aprobados:")
            for alumno in aprobados:
                print(f"{alumno.nombre} (Código: {alumno.codigo}) - Nota: {alumno.nota}")
            print()
        desaprobados = [alumno for alumno in alumnos if not alumno.aprobado()]
        if not desaprobados:
            print("No hay alumnos desaprobados.\n")
        else:
            print("Alumnos desaprobados:")
            for alumno in desaprobados:
                print(f"{alumno.nombre} (Código: {alumno.codigo}) - Nota: {alumno.nota}")
            print()
    
    elif opcion == "5":
        codigo_baja = input("Ingrese el código del alumno a dar de baja: ")
        alumno_encontrado = False
        for alumno in alumnos:
            if alumno.codigo == codigo_baja:
                alumno.estado = "inactivo"
                alumno_encontrado = True
                print(f"Alumno {alumno.nombre} (Código: {alumno.codigo}) dado de baja.\n")
                break
        if not alumno_encontrado:
            print("No se encontró un alumno con ese código.\n")

    elif opcion == "6":
        print("Saliendo del programa.")
        break

    else:
        print("Opción inválida. Por favor, seleccione una opción válida.\n")