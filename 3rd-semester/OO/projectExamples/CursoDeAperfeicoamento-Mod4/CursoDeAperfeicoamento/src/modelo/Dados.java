package modelo;

import java.util.*;

public class Dados {
	private  Aluno[] alunos = new Aluno[50];
	private int qtdAlunos = 0;
	private Curso [] cursos = new Curso[50];
	private int qtdCursos = 0;
	private Professor[] profs = new Professor[50];
	private int qtdProfs = 0;
	private Telefone[] tels = new Telefone[50];
	private int qtdTels = 0;
	private Matricula[] matr = new Matricula[50];
	private int qtdMatriculados = 0;
	
	
	public void fillWithSomeData() {
		Date d = Calendar.getInstance().getTime();
		for(int i = 0; i < 5; i++) {
			tels[i] = new Telefone((i+1)*100, (i+1)*1000000);
			alunos[i] = new Aluno("Aluno"+i, "Endereco"+i, d, (i+1)*123456, (i+1)*112233, 
					tels[i]);
			profs[i] = new Professor("Professor"+i, (i+1)*1000, (i+1)*654321, 
					(i+1)*332211, tels[i]);
			cursos[i] = new Curso("Curso"+1, d, d, 8, 10, 40, "Orientacao a Objetos", 
					profs[i], (i+1)*400, 0);
			matr[i] = new Matricula(alunos[i], d, (i+1)*400, cursos[0], "Turma A");			
		}
		
		qtdAlunos = 5;
		qtdCursos = 5;
		qtdProfs = 5;
		qtdTels = 5;
		qtdMatriculados = 5;
	}
	
	public Aluno[] getAlunos() {
		return alunos;
	}
	
	public void setAlunos(Aluno[] alunos) {
		this.alunos = alunos;
	}
	
	public void inserirEditarAluno(Aluno a, int pos) {
		this.alunos[pos] = a;
		if(pos == qtdAlunos) qtdAlunos++;
	}
	
	public int getQtdAlunos() {
		return qtdAlunos;
	}
	public void setQtdAlunos(int qtdAlunos) {
		this.qtdAlunos = qtdAlunos;
	}
	public Curso[] getCursos() {
		return cursos;
	}
	public void setCursos(Curso[] cursos) {
		this.cursos = cursos;
	}
	public int getQtdCursos() {
		return qtdCursos;
	}
	public void setQtdCursos(int qtdCursos) {
		this.qtdCursos = qtdCursos;
	}
	
	public Professor[] getProfs() {
		return profs;
	}
	
	public void setProfs(Professor[] profs) {
		this.profs = profs;
	}
	
	public void inserirEditaProf(Professor p, int pos) {
		this.profs[pos] = p;
		if(pos == qtdProfs) qtdProfs++;
	}
	
	
	public int getQtdProfs() {
		return qtdProfs;
	}
	public void setQtdProfs(int qtdProfs) {
		this.qtdProfs = qtdProfs;
	}
	public Telefone[] getTels() {
		return tels;
	}
	public void setTels(Telefone[] tels) {
		this.tels = tels;
	}
	public int getQtdTels() {
		return qtdTels;
	}
	public void setQtdTels(int qtdTels) {
		this.qtdTels = qtdTels;
	}
	public Matricula[] getMatr() {
		return matr;
	}
	public void setMatr(Matricula[] matr) {
		this.matr = matr;
	}
	public int getQtdMatriculados() {
		return qtdMatriculados;
	}
	public void setQtdMatriculados(int qtdMatriculados) {
		this.qtdMatriculados = qtdMatriculados;
	}
	

}
