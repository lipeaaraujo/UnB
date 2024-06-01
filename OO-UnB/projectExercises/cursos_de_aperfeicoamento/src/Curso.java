import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;

public class Curso {

	private int carga;
	private String conteudo;
	private double valor;
	private Date dataInicio;
	private Date dataTermino;
	private Time horaInicio;
	private Time horaTermino;
	private ArrayList<Matricula> listaMatriculas;
	
	public Curso(int carga, String conteudo, double valor, Date dataInicio, 
				 Date dataTermino, Time horaInicio, Time horaTermino) {
		this.carga = carga;
		this.conteudo = conteudo;
		this.valor = valor;
		this.dataInicio = dataInicio;
		this.dataTermino = dataTermino;
		this.horaInicio = horaInicio;
		this.horaTermino = horaTermino;
		listaMatriculas = new ArrayList<Matricula>();
	}

	public int getCarga() {
		return carga;
	}

	public void setCarga(int carga) {
		this.carga = carga;
	}

	public String getConteudo() {
		return conteudo;
	}

	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public Date getDataInicio() {
		return dataInicio;
	}

	public void setDataInicio(Date dataInicio) {
		this.dataInicio = dataInicio;
	}

	public Date getDataTermino() {
		return dataTermino;
	}

	public void setDataTermino(Date dataTermino) {
		this.dataTermino = dataTermino;
	}

	public Time getHoraInicio() {
		return horaInicio;
	}

	public void setHoraInicio(Time horaInicio) {
		this.horaInicio = horaInicio;
	}

	public Time getHoraTermino() {
		return horaTermino;
	}

	public void setHoraTermino(Time horaTermino) {
		this.horaTermino = horaTermino;
	}

	public ArrayList<Matricula> getListaMatriculas() {
		return listaMatriculas;
	}

	public void setListaMatriculas(ArrayList<Matricula> listaMatriculas) {
		this.listaMatriculas = listaMatriculas;
	}
	
	
	
}
