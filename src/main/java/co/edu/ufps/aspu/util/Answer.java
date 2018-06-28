package co.edu.ufps.aspu.util;

public class Answer<T> {
	private boolean estado;
	private T valor;
	
	public Answer() {}
	
	public Answer(boolean estado, T valor) {
		super();
		this.estado = estado;
		this.valor = valor;
	}
	public boolean isEstado() {
		return estado;
	}
	public void setEstado(boolean estado) {
		this.estado = estado;
	}
	public T getValor() {
		return valor;
	}
	public void setValor(T valor) {
		this.valor = valor;
	}

	@Override
	public String toString() {
		return "{Answer :{estado:" + estado + ", valor:" + valor + "}}";
	}
	
	
}
