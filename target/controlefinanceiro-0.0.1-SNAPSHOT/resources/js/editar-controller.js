var financeiroApp = angular.module("financeiroApp", []);

financeiroApp.controller("financeiroController", ['$scope', '$http', '$location', '$filter', function($scope, $http, $location, $filter){
    $scope.id = null;
	$scope.descricao = null;
    $scope.data = new Date();
    $scope.valor = null;
    $scope.tipo = null;
    $scope.tipos = [
        { nome: 'RECEITA', valor: 0 },
        { nome: 'DESPESA', valor: 1}
    ]
    
    $scope.Date = function(){
		$scope.data = new Date();
	};
	
	$scope.salvar = function(){
		var financeiro = new Object;
		financeiro.id = $scope.id;
		financeiro.descricao = $scope.descricao.toUpperCase();
		financeiro.data = $scope.data;
		financeiro.valor = $scope.valor;
		financeiro.tipo = $scope.tipo;
		
		$http.put("../financeiro/" + financeiro.id, financeiro).then(function(resposta){
			
		}, function(error){
			
		});
	}
}]);