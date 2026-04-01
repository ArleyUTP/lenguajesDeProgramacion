package com.lambda;

import java.math.BigInteger;
import java.util.function.Function;

public class Main {
    public static void main(String[] args) {
        
        Function<Integer,BigInteger> factorial = n ->{
            if (n < 0) {
                throw new IllegalArgumentException("Negative numbers are not allowed.");
            }
            BigInteger result = BigInteger.ONE;
            for (int i = 2; i <= n; i++) {
                result = result.multiply(BigInteger.valueOf(i));
            }
            return result;
        };
        System.out.println(factorial.apply(5));
    }
}