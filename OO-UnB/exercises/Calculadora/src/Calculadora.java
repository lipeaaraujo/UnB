import java.util.Scanner;

public class Calculadora {
	
	public static void main(String[] args) {
		
		char operation;
		int num1, num2, resultado;
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Entre com a operação a ser realizada (+, - ou *):");
		operation = scanner.next().charAt(0);
		System.out.println("Entre com o primeiro número:");
		num1 = scanner.nextInt();
		System.out.println("Entre com o segundo número:");
		num2 = scanner.nextInt();
		
		if (operation == '+') {
			resultado = num1 + num2;
			System.out.println("O resultado da operação é: "+resultado);
		} else if (operation == '-') {
			resultado = num1 - num2;
			System.out.println("O resultado da operação é: "+resultado);
		} else if (operation == '*') {
			resultado = num1 * num2;
			System.out.println("O resultado da operação é: "+resultado);
		} else {
			System.out.println("Operação inválida");
		}
		
	}
	
}
