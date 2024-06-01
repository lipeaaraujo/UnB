import java.util.Date;

public class Item {

	private double percentual;
	private String descricao;
	private Date dataExecucao;
	
	public Item(double percentual, String descricao) {
		this.percentual = percentual;
		this.descricao = descricao;
	}

	public double getPercentual() {
		return percentual;
	}

	public void setPercentual(double percentual) {
		this.percentual = percentual;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Date getDataExecucao() {
		return dataExecucao;
	}

	public void setDataExecucao(Date dataExecucao) {
		this.dataExecucao = dataExecucao;
	}
	
}
