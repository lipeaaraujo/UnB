import java.util.Scanner;

public class MaiorNumero {

	public static void main(String[] args) {
		
		int num1,num2,num3,num4,num5,max_number;
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Entre com o primeiro numero:");
		num1 = scanner.nextInt();
		System.out.println("Entre com o segundo numero:");
		num2 = scanner.nextInt();
		System.out.println("Entre com o terceiro numero:");
		num3 = scanner.nextInt();
		System.out.println("Entre com o quarto numero:");
		num4 = scanner.nextInt();
		System.out.println("Entre com o quinto numero:");
		num5 = scanner.nextInt();
		
		max_number = num1;
		
		if (num2 > max_number) {
			max_number = num2;
		}
		if (num3 > max_number) {
			max_number = num3;
		}
		if (num4 > max_number) {
			max_number = num4;
		}
		if (num5 > max_number) {
			max_number = num5; 
		}
		
		System.out.println(max_number);
		
		scanner.close();
	}
	
}
