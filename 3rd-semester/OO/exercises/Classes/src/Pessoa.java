
public class Pessoa {
	
	// Atributos.
	String nome;
	int idade;
	double peso;
	int cpf;
	
	// Construtor.
	public Pessoa(String nome, int idade, double peso, int cpf) {
		
		this.nome = nome;
		this.idade = idade;
		this.peso = peso;
		this.cpf = cpf;
		
	}
	
	// Gets e Sets.
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public int getIdade() {
		return idade;
	}
	public void setIdade(int idade) {
		this.idade = idade;
	}
	public double getPeso() {
		return peso;
	}
	public void setPeso(double peso) {
		this.peso = peso;
	}
	public int getCpf() {
		return cpf;
	}
	public void setCpf(int cpf) {
		this.cpf = cpf;
	}
	
	// Métodos.
	public void dormir() {
		System.out.println(nome+" dormiu.");
	}
	public void acordar() {
		System.out.println(nome+" acordou");
	}
	public void falar() {
		System.out.println(nome+" disse algo.");
	}
	public void ouvir() {
		System.out.println(nome+" está ouvindo.");
	}
}