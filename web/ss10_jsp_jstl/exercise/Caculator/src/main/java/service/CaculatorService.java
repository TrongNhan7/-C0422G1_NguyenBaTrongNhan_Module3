package service;

public class CaculatorService {
    public static double countCaculator(double firstNumer, double secondNumber, String operator) {
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
