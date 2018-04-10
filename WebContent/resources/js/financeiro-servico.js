'use strict';

angular.module('financeiroApp').factory('financeiroServico', ['$http', '$q', function($http, $q){
	var REST_SERVICO_URI = 'http://localhost:8080/controlefinanceiro/financeiro/';
	
	var fabrica = {
		getTodosFinanceiros : getTodosFinanceiros,
		inserirFinanceiro : inserirFinanceiro,
		atualizarFinanceiro : atualizarFinanceiro,
		deletarFinanceiro : deletarFinanceiro
	};
	
	return fabrica;
	
	function getTodosFinanceiros(){
		var deferred = $q.defer();
		$http.get(REST_SERVICO_URI).then(
			function(response){
				deferred.resolve(response.data);
			},
			function(errResponse){
				console.log('Erro durante a busca de todos o financeiros');
				deferred.reject(errResponse);
			}
		);
		return deferred.promise;
	}
}]);