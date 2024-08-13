package negocio;

import java.util.*;

public class Teste {
	static Aluno a1;
	static Aluno a2;
	static Curso c;
	static Professor p;
	static Telefone t;

	public static void main(String[] args) {
		Matricula aux;
		
		GregorianCalendar d= new GregorianCalendar();
		Date agora = d.getTime();
		
		a1 = new Aluno("A1","Brasilia");
		a2 = new Aluno("A2","Brasilia");
		
		c = new Curso("Orientacao a Objetos", 
				"Como programar orientado a objetos", 1500.00, 0);
		
		t = new Telefone();
		t.setDDD(061);
		t.setNumero(55555555);
		
		p = new Professor("Fabiana", 1500.00, t);
		
		aux = new Matricula(a1, agora, 1500.00, c, "7A");
		aux.matricular();
		
		aux = new Matricula(a2, agora, 1500.00, c, "7A");
		aux.matricular();
		
		System.out.println(c.toString());
		System.out.println(p.toString());
		System.out.println(t.toString());
		System.out.println(c.consultarAlunosMatriculados());
		System.out.println(aux.toString());
	}
	
}
