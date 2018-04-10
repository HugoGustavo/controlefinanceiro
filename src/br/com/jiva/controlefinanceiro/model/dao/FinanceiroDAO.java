package br.com.jiva.controlefinanceiro.model.dao;

import java.util.List;

import br.com.jiva.controlefinanceiro.model.vo.Financeiro;

public interface FinanceiroDAO {
	public List<Financeiro> get();
	public Financeiro get(Long id);
	public void atualizar(Financeiro financeiro);
	public void deletar(Long id);
	public void inserir(Financeiro financeiro);

}
