package negocio;

public class Professor extends Pessoa {
	private double valorHoraAula;
	
	public Professor(String n, double v, Telefone t) {
		nome = n;
		valorHoraAula = v;
		numTel = t;
	}
	
		public String toString() {
		return "Nome d@ professor@: " + nome + ", valor da hora/aula: R$" + valorHoraAula;
	}



	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getValorHoraAula() {
		return valorHoraAula;
	}

	public void setValorHoraAula(double valorHoraAula) {
		this.valorHoraAula = valorHoraAula;
	}

	public Telefone getTel() {
		return numTel;
	}

	public void setTel(Telefone tel) {
		this.numTel = tel;
	}

	
}
