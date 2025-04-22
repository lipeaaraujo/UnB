import java.util.ArrayList;
import java.util.Date;

public class Tarefa {
	
	// Atributos
	private double prioridade;
	private String nome;
	private Date dataLimite;
	private double percenConcluido;
	private String detalhamento;
	private ArrayList<Item> listaItens;
	
	public Tarefa(double prioridade, String nome, 
				  Date dataLimite, String detalhamento) {
		this.prioridade = prioridade;
		this.nome = nome;
		this.dataLimite = dataLimite;
		this.detalhamento = detalhamento;
		listaItens = new ArrayList<Item>();
	}

	// Getters e setters
	public ArrayList<Item> getListaItens() {
		return listaItens;
	}

	public void setListaItens(ArrayList<Item> listaItens) {
		this.listaItens = listaItens;
	}

	public Date getDataLimite() {
		return dataLimite;
	}

	public void setDataLimite(Date dataLimite) {
		this.dataLimite = dataLimite;
	}

	public double getPercenConcluido() {
		return percenConcluido;
	}

	public void setPercenConcluido(double percenConcluido) {
		this.percenConcluido = percenConcluido;
	}

	public void setPrioridade(double prioridade) {
		this.prioridade = prioridade;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setDetalhamento(String detalhamento) {
		this.detalhamento = detalhamento;
	}
	
	public void addItem(Item item) {
		listaItens.add(item);
	}
	
	public void concluirItem(Item item, Date data, ArrayList<Tarefa> lista) {
		item.setDataExecucao(data);
		double percentual = item.getPercentual();
		percenConcluido += percentual;
		
		if (percenConcluido >= 100) {
			concluirTarefa(lista);
		}
	}
	
	private void concluirTarefa(ArrayList<Tarefa> lista) {
		lista.add(this);
	}
	
}
