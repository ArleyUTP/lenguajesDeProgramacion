class Suma{
    private num1: number;
    private num2: number;

    constructor(num1: number, num2: number){
        this.num1 = num1;
        this.num2 = num2;
    }

    public suma(): number {
        return this.num1 + this.num2;
    }
}
let suma = new Suma(12,12);
console.log("El resultado de la suma es: "+suma.suma());
