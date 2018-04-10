var financeiroApp = angular.module("financeiroApp", ['chart.js']);

financeiroApp.config(['ChartJsProvider', function(ChartJsProvider){
	ChartJsProvider.setOptions({
		chartColors:['#28A745', '#DC3545'],
		responsive:true
	});
}]);

financeiroApp.controller("financeiroController", function($scope, $http, $window){
	$scope.financeiros = [];
	$scope.labels = [];
	$scope.data = [];
	$scope.idFinanceiroExclusao = null;

	$scope.init = function(){
		$http.get("financeiro").then(function(response){
			$scope.financeiros = response.data;

			$scope.colors = ["rgb(40,167,69)", "rgb(220,53,69)"];
			$scope.labels = ["Receitas", "Despesas"];
			$scope.data = [];

			var receitas = 0.0;
			var despesas = 0.0;
			
			angular.forEach($scope.financeiros, function(financeiro, i){
				console.log(financeiro);
				if ( financeiro['tipo'] == 0 ){
					receitas = receitas + financeiro['valor'];
				}
				else despesas = despesas + financeiro['valor'];
			});
			
			$scope.data.push(receitas);
			$scope.data.push(despesas);
		});		
	};

	$scope.visualizar = function(id){
		$window.location.href = 'visualizar';
	}
	
	$scope.excluir = function(id){
		$http.delete("financeiro/" + id).then(function(response){
			$window.location.reload();
		});
	}
});