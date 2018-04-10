import java.util.List;

import br.com.jiva.controlefinanceiro.model.dao.JPAFinanceiroDAO;
import br.com.jiva.controlefinanceiro.model.vo.Financeiro;

public class GeraTabela {
	public static void main(String[] args) {
		JPAFinanceiroDAO dao = new JPAFinanceiroDAO();
		Financeiro financeiro = new Financeiro();
		financeiro.setDescricao("TESTE");
		financeiro.setTipo(Financeiro.DESPESA);
		financeiro.setValor(100.0);
		dao.inserir(financeiro);
		dao = new JPAFinanceiroDAO();
		List<Financeiro> lista = dao.get();
		for (Financeiro f : lista)
			System.out.println(f);
		System.out.println("OK");
	}
}
