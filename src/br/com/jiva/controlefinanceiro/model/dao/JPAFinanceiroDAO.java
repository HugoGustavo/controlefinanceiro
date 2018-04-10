package br.com.jiva.controlefinanceiro.model.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.jiva.controlefinanceiro.model.vo.Financeiro;

@Repository
@Transactional
public class JPAFinanceiroDAO implements FinanceiroDAO {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<Financeiro> get() {
		return entityManager.createQuery("select f from Financeiro f").getResultList();
	}

	@Override
	public Financeiro get(Long id) {
		return entityManager.find(Financeiro.class, id);
	}

	@Override
	public void atualizar(Financeiro financeiro) {
		entityManager.merge(financeiro);
	}

	@Override
	public void deletar(Long id) {
		Financeiro financeiro = entityManager.find(Financeiro.class, id);
		entityManager.remove(financeiro);	
	}

	@Override
	public void inserir(Financeiro financeiro) {
		entityManager.persist(financeiro);
	}
}
