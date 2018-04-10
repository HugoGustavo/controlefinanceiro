package br.com.jiva.controlefinanceiro.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import br.com.jiva.controlefinanceiro.model.dao.FinanceiroDAO;
import br.com.jiva.controlefinanceiro.model.vo.Financeiro;

@Controller
public class FinanceiroController {
	@Autowired
	FinanceiroDAO financeiroDAO;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("index")
	public String toIndex() {
		return "index";
	}
	
	@RequestMapping("criar")
	public String criar() {
		return "criar";
	}
	
	@RequestMapping(value="/financeiro", method=RequestMethod.GET)
	public ResponseEntity<List<Financeiro>> getTodos(){
		List<Financeiro> lista = financeiroDAO.get();
		if ( lista.isEmpty() ) {
			return new ResponseEntity<List<Financeiro>>(HttpStatus.NO_CONTENT);
		}
		return new ResponseEntity<List<Financeiro>>(lista, HttpStatus.OK);
	}
	

	@RequestMapping(value="/financeiro/{id}", method=RequestMethod.GET)
	public ResponseEntity<Financeiro> get(@PathVariable("id") long id){
		Financeiro financeiro = financeiroDAO.get(id);
		if (financeiro == null)
			return new ResponseEntity<Financeiro>(HttpStatus.NOT_FOUND);
		return new ResponseEntity<Financeiro>(financeiro, HttpStatus.OK);
	}
	
	@RequestMapping(value="/visualizar/{id}", method=RequestMethod.GET)
	public ModelAndView visualizar(@PathVariable("id") long id) {
		Financeiro financeiro = financeiroDAO.get(id);
		return new ModelAndView("visualizar", "financeiro", financeiro);
	}
	
	@RequestMapping(value="/editar/{id}", method=RequestMethod.GET)
	public ModelAndView atualizar(@PathVariable("id") long id) {
		Financeiro financeiro = financeiroDAO.get(id);
		return new ModelAndView("editar", "financeiro", financeiro);
	}
	
	@RequestMapping(value="/financeiro", method=RequestMethod.POST)
	public ResponseEntity<Void> inserir(@RequestBody Financeiro financeiro, UriComponentsBuilder ucBuilder){
		System.out.println("Inserindo financeiro: " + financeiro.getDescricao());
		financeiroDAO.inserir(financeiro);
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/financeiro/{id}").buildAndExpand(financeiro.getId()).toUri());
		return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}
	
	@RequestMapping(value="/financeiro/{id}", method=RequestMethod.PUT)
	public ResponseEntity<Financeiro> atualizar(@PathVariable("id") long id, @RequestBody Financeiro financeiro){
		Financeiro financeiroAtual = financeiroDAO.get(id);
		
		if ( financeiroAtual == null) 
			return new ResponseEntity<Financeiro>(HttpStatus.NOT_FOUND);
		
		financeiroAtual.setData(financeiro.getData());
		financeiroAtual.setDescricao(financeiro.getDescricao());
		financeiroAtual.setTipo(financeiro.getTipo());
		financeiroAtual.setValor(financeiro.getValor());
		
		financeiroDAO.atualizar(financeiroAtual);
		return new ResponseEntity<Financeiro>(financeiroAtual, HttpStatus.OK);
	}
	
	@RequestMapping(value="/financeiro/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<Financeiro> deletar(@PathVariable("id") long id){
		Financeiro financeiro = financeiroDAO.get(id);
		if ( financeiro == null )
			return new ResponseEntity<Financeiro>(HttpStatus.NOT_FOUND);
		financeiroDAO.deletar(id);
		return new ResponseEntity<Financeiro>(HttpStatus.NO_CONTENT);
	}

}
