import java.util.Date;

public class Aluno {
	
	private String nome;
	private int numIdentidade;
	private String cpf;
	private Date dataNascimento;
	private String endereco;
	private String telefones;
	
	public Aluno(String nome, int num, String cpf, 
				 Date data, String end, String telefones) {
		this.nome = nome;
		numIdentidade = num;
		this.cpf = cpf;
		dataNascimento = data;
		endereco = end;
		this.telefones = telefones;
		
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getNumIdentidade() {
		return numIdentidade;
	}

	public void setNumIdentidade(int numIdentidade) {
		this.numIdentidade = numIdentidade;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getTelefones() {
		return telefones;
	}

	public void setTelefones(String telefones) {
		this.telefones = telefones;
	}
	
}
