import java.sql.Time;

public class Aluguel {
	
	private double valor;
	private Cliente cliente;
	private Time horaInicio;
	private Time horaTermino;
	private Tema tema;
	
	public Aluguel(double valor, Cliente cliente,
				   Time inicio, Time termino, Tema tema) {
		this.valor = valor;
		this.cliente = cliente;
		horaInicio = inicio;
		horaTermino = termino;
		this.tema = tema;
	}

	public double getValor() {
		return valor;
	}

	public void setValor(double valor) {
		this.valor = valor;
	}

	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
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

	public Tema getTema() {
		return tema;
	}

	public void setTema(Tema tema) {
		this.tema = tema;
	}
	
	public double calcularAluguel() {
		if (cliente.isClienteAntigo()) {
			return valor * 0.7;
		} else {
			return valor;
		}
	}
	
	public String toString() {
		return valor + cliente + horaInicio + horaTermino + tema;
	}
	
}
