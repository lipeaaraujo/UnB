import java.util.ArrayList;

public class Tema {
	
	private ArrayList<String> listaItens;
	private double valorAluguel;
	private String corToalha;
	
	public Tema(double aluguel, String cor) {
		valorAluguel = aluguel;
		corToalha = cor;
	}

	public ArrayList<String> getListaItens() {
		return listaItens;
	}

	public void setListaItens(ArrayList<String> listaItens) {
		this.listaItens = listaItens;
	}

	public double getValorAluguel() {
		return valorAluguel;
	}

	public void setValorAluguel(double valorAluguel) {
		this.valorAluguel = valorAluguel;
	}

	public String getCorToalha() {
		return corToalha;
	}

	public void setCorToalha(String corToalha) {
		this.corToalha = corToalha;
	}
	
	public void addItem(String item) {
		listaItens.add(item);
	}
	
	public void removerItem(String item) {
		listaItens.remove(item);
	}
	
}
