var financeiroApp = angular.module("financeiroApp", []);

financeiroApp.controller("financeiroController", ['$scope', '$http', '$location', function($scope, $http, $location){
	$scope.excluir = function(id){
		$http.delete("../financeiro/" + id).then(function(response){
			
		});
	};
}]);