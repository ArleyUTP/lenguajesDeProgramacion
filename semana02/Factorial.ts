//Implementar una función pura que calcule el factorial de un número en TypeScript.
function factorial(n: number): number {
    if (n < 0) {
        throw new Error("El factorial no está definido para números negativos.");
    }
    if (n === 0 || n === 1) {
        return 1;
    }
    let result = 1;
    for (let i = 2; i <= n; i++) {
        result *= i;
    }
    return result;
}


console.log(factorial(5));
console.log(factorial(0));