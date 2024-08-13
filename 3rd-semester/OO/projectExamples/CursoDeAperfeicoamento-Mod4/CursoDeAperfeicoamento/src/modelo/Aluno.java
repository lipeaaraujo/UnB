package modelo;

import java.util.*;

public class Aluno extends Pessoa { 
	private Date dataNasc;
	private String endereco;
	
	public Aluno(){
		super();
	}
	
	//Sobrecarga
	public Aluno(String n, String e, Date dt, int CPF, int id, Telefone tel) {
		nome = n;
		endereco = e;
		dataNasc = dt;
		this.CPF = CPF;
		this.numID = id;
		this.numTel = tel;
	}
	
	
	public Aluno(String n, String e, int id, int CPF, Telefone tel) {
		nome = n;
		endereco = e;
		this.CPF = CPF;
		this.numID = id;
		this.numTel = tel;
	}

	public String toString() {	
		return "Nome do aluno: " + nome;
	}



	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getNumID() {
		return numID;
	}

	public void setNumID(int numID) {
		this.numID = numID;
	}

	public int getCPF() {
		return CPF;
	}

	public void setCPF(int cPF) {
		CPF = cPF;
	}

	public Date getDataNasc() {
		return dataNasc;
	}

	public void setDataNasc(Date dataNasc) {
		this.dataNasc = dataNasc;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public Telefone getNumTel() {
		return numTel;
	}

	public void setNumTel(Telefone numTel) {
		this.numTel = numTel;
	}
}
