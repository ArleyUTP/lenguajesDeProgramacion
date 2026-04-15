fn main() {
    let cuadrado = |x: i32| x * x;
    println!("{}", cuadrado(5)); // 25

    let numeros = vec![1, 2, 3, 4, 5];
    let cuadrados: Vec<i32> = numeros
        .into_iter()
        .filter(|x| x % 2 == 0)
        .map(|x| cuadrado(x))
        .collect();
    println!("{:?}", cuadrados); // [4, 16]
}