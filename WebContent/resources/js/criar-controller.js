var financeiroApp = angular.module("financeiroApp", []);

financeiroApp.controller("financeiroController", function($scope, $http, $location){
	$scope.descricao = null;
	$scope.data = null;
	$scope.valor = null;
	$scope.tipo = null;
	
	$scope.salvar = function(){
		var financeiro = new Object;
		financeiro.descricao = $scope.descricao.toUpperCase();
		financeiro.data = $scope.data;
		financeiro.valor = $scope.valor;
		financeiro.tipo = $scope.tipo;
		console.log($scope.data);
		
		$http.post("financeiro", financeiro).then(function(resposta){
			console.log(resposta);
		}, function(error){
			console.log(error);
		});
	}
});