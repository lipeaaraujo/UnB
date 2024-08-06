package modelo;

import java.util.*;

public class Curso {
	
	private String nome;
	private Date dtInicio;
	private Date dtTermino;
	private int horaInicio;
	private int horaTermino;
	private int cargaHoraria;
	private String conteudoProg;
	private Professor prof;
	private double valor;
	private Matricula[] alunosMatriculados = new Matricula[40];
	private int numAlunos = 0;
	
	public Curso() {
		super();
	}
	
	public Curso(String n, Date di, Date dt, int hi, int ht, int ch, 
			String cont, Professor p, double val, int total) {
		nome = n;
		dtInicio = di;
		dtTermino = dt;
		horaInicio = hi;
		horaTermino = ht;
		cargaHoraria = ch;
		conteudoProg = cont;
		prof = p;
		valor = val;
		numAlunos = total;
	}

	public Matricula[] getMatriculas() {
		return this.alunosMatriculados;
	}
	
	public void setMatriculas(Matricula[] a) {
		this.alunosMatriculados = a;
	}

	public int getNumAlunos() {
		return numAlunos;
	}

	public void setNumAlunos(int numAlunos) {
		this.numAlunos = numAlunos;
	}


	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Date getDtInicio() {
		return dtInicio;
	}

	public void setDtInicio(Date dtInicio) {
		this.dtInicio = dtInicio;
	}

	public Date getDtTermino() {
		return dtTermino;
	}

	public void setDtTermino(Date dtTermino) {
		this.dtTermino = dtTermino;
	}

	public int getHoraInicio() {
		return horaInicio;
	}

	public void setHoraInicio(int horaInicio) {
		this.horaInicio = horaInicio;
	}

	public int getHoraTermino() {
		return horaTermino;
	}

	public void setHoraTermino(int horaTermino) {
		this.horaTermino = horaTermino;
	}

	public int getCargaHoraria() {
		return cargaHoraria;
	}

	public void setCargaHoraria(int cargaHoraria) {
		this.cargaHoraria = cargaHoraria;
	}

	public String getConteudoProg() {
		return conteudoProg;
	}

	public void setConteudoProg(String conetudoProg) {
		this.conteudoProg = conetudoProg;
	}

	public Professor getProf() {
		return prof;
	}

	public void setProf(Professor prof) {
		this.prof = prof;
	}
	
	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}
	
	public String toString() {
		return "Nome do curso: " + nome + ", valor do Curso:" + valor;
	}
	
	
	//Faz mais sentido na camada de controle
	
	public Aluno getAluno(int i) {
		return alunosMatriculados[i].getAluno();
	}

	public void setAluno(Matricula alunoMat, int i) {
		this.alunosMatriculados[i] = alunoMat;
	}
	
	public String consultarAlunosMatriculados() {
		String saida = "***** Lista de Alunos Matriculados ***** \n" ;
		for(int i = 0; i < numAlunos; i++) {
			System.out.println(i);
			saida = saida + "\n"+ alunosMatriculados[i].getAluno().toString();
		}
		return saida;
	}	
}