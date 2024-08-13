import java.util.Scanner;

public class SomaNumeros {

	public static void main(String[] args) {
		
		int num, soma=0;
		Scanner scanner = new Scanner(System.in);
		
		do {
			System.out.println("Digite um numero positivo para ser somado ou negativo para sair:");
			num = scanner.nextInt();
			if (num >= 0) {
				soma += num;
			}
		} while (num >= 0);
		
		System.out.println("A soma é: "+soma);
		
		scanner.close();
	}
	
}
