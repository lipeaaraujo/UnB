
public class Cliente {

	private String nome;
	private String telefone;
	private boolean clienteAntigo;
	
	public Cliente(String nome, String tel) {
		this.nome = nome;
		telefone = tel;
		clienteAntigo = false;
	}
	
	// getters e setters.
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public boolean isClienteAntigo() {
		return clienteAntigo;
	}

	public void setClienteAntigo(boolean clienteAntigo) {
		this.clienteAntigo = clienteAntigo;
	}
	
}
