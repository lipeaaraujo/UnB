package modelo;

public class Professor extends Pessoa {
	private double valorHoraAula;
	
	public Professor(){
		super();
	}
	
	public Professor(String n, double v, int CPF, int id, Telefone t) {
		this.nome = n;
		valorHoraAula = v;
		this.numTel = t;
		this.CPF = CPF;
		this.numID = id;
				
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
