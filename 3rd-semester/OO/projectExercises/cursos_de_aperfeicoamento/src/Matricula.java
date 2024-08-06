import java.util.Date;

public class Matricula {
	
	private Date data;
	private double valorPago;
	private String turma;
	private Aluno aluno;
	
	public Matricula(Date data, double valorPago, String turma, Aluno aluno) {
		this.data = data;
		this.valorPago = valorPago;
		this.turma = turma;
		this.aluno = aluno;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public double getValorPago() {
		return valorPago;
	}

	public void setValorPago(double valorPago) {
		this.valorPago = valorPago;
	}

	public String getTurma() {
		return turma;
	}

	public void setTurma(String turma) {
		this.turma = turma;
	}

	public Aluno getAluno() {
		return aluno;
	}

	public void setAluno(Aluno aluno) {
		this.aluno = aluno;
	}
	
	
	
}
