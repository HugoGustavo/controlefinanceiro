package br.com.jiva.controlefinanceiro.model.vo;

import java.util.Calendar;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
public class Financeiro {
	@Transient
	public static final int RECEITA = 0;
	
	@Transient
	public static final int DESPESA = 1;
	
	@Id
	@GeneratedValue
	private Long id;
	private String descricao;

	private Integer tipo;
	
	@Temporal(TemporalType.DATE)
	private Calendar data;
	private Double valor;
	
	public Long getId() {
		return id;
	}
	
	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Integer getTipo() {
		return tipo;
	}

	public void setTipo(Integer tipo) {
		this.tipo = tipo;
	}
	
	public Calendar getData() {
		return data;
	}
	
	public void setData(Calendar data) {
		this.data = data;
	}
	
	public Double getValor() {
		return valor;
	}
	
	public void setValor(Double valor) {
		this.valor = valor;	
	}
	
	
}
