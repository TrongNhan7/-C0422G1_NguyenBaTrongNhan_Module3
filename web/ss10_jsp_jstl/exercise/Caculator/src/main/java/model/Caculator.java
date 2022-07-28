package model;

public class Caculator {
    private double firstNumber;
    private double secondNumber;

    public Caculator() {
    }

    public Caculator(double firstNumber, double secondNumber) {
        this.firstNumber = firstNumber;
        this.secondNumber = secondNumber;
    }

    public static double caculator(double firstNumer, double secondNumber, String operator) {
        double result = 0;
        switch (operator) {
            case "+":
                result = firstNumer + secondNumber;
                break;
            case "-":
                result = firstNumer - secondNumber;
                break;
            case "*":
                result = firstNumer * secondNumber;
                break;
            case "/":
               if(secondNumber !=0) {
                   result = firstNumer / secondNumber;
               }
        }
        return result;
    }
}
