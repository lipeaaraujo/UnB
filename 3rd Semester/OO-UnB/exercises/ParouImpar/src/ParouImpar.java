import java.util.Scanner;

public class ParouImpar {
	
	public static void main(String[] args) {
		
		int num;
		boolean par;
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("Digite o numero:");
		num = scanner.nextInt();
		
		if (num % 2 == 0) {
			par = true;
			System.out.println(par);
		} else {
			par = false;
			System.out.println(par);
		}
	}
	
}
