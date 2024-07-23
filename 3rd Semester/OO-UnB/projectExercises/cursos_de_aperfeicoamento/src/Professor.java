
public class Professor {

	private String nome;
	private double valorAula;
	
	public Professor(String nome, double valor) {
		this.nome = nome;
		valorAula = valor;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getValorAula() {
		return valorAula;
	}

	public void setValorAula(double valorAula) {
		this.valorAula = valorAula;
	}
}
