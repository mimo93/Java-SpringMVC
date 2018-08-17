package br.com.parreira.springmvc.dominios;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class Album {
	
	@NotNull(message = "O nome � obrigat�rio")
	@NotEmpty(message = "O nome � obrigat�rio")
	@Size(min = 4, max = 10, message = "O nome do �lbum deve conter entre 4 e 10 caracteres")
	private String nome;
	
	@NotNull(message = "O ano de lan�amento � obrigat�rio")
	@Min(value = 1990, message = "O ano de lan�amento deve ser a partir de 1990")
	@Max(value = 2030, message = "O ano de lan�amento deve ser at� 2030")
	private int anoLancamento;

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getAnoLancamento() {
		return anoLancamento;
	}

	public void setAnoLancamento(int anoLancamento) {
		this.anoLancamento = anoLancamento;
	}
	
}
