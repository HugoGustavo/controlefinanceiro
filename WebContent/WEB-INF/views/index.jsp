<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
     <meta charset="utf-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" contente="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <title> Jiva - Controle Financeiro </title>       
        
        <link type="text/css" href="<c:url value="resources/css/bootstrap.min.css"/>" rel="stylesheet"/>       
        
        <script type="text/javascript" src="<c:url value="resources/js/jquery.min.js"/>" ></script>
        <script type="text/javascript" src="<c:url value="resources/js/bootstrap.min.js"/>" ></script>
        <script type="text/javascript" src="<c:url value="resources/js/angular.min.js"/>" ></script>
        <script type="text/javascript" src="<c:url value="resources/js/angular-route.min.js"/>" ></script>
        <script type="text/javascript" src="<c:url value="resources/js/chart.min.js"/>" ></script> 
        <script type="text/javascript" src="<c:url value="resources/js/angular-chart.min.js"/>" ></script>
        <script type="text/javascript" src="<c:url value="resources/js/index-controller.js"/>" ></script>
    </head>
    <!-- #F09717 -->
    <body ng-app="financeiroApp">
        <nav class="navbar navbar-default" style="background-color: #F09717;">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-left" href="#"> <img src="<c:url value="resources/img/logo-jiva.png"/>" style="max-width: 100px"/> </a>
                </div>
            </div>
		</nav>
		<div id="top" class="row">
			<div class="col-md-3">
				<h2> Financeiros </h2>
			</div>
			<div class="col-md-6">
				<a ng-href="criar" class="btn btn-warning pull-right h2"> Novo </a>
			</div>
			<div class="col-md-3">
				<h3> Gráfico </h3>
			</div>
		</div>
		<div id="list" class="row" id="main" class="container-fluid" ng-controller="financeiroController" data-ng-init="init()">
			<div class="table-responsive col-md-9">
				<table class="table table-striped" cellspacing="0" cellpadding="0">
					<thread>
						<tr>
							<th> ID </th>
							<th> Descrição </th>
							<th> Tipo </th>
							<th> Data </th>
							<th> Valor </th>
							<th class="actions"> Ações </th>
						</tr>
					</thread>
					<tbody>
						<tr ng-repeat="financeiro in financeiros">
							<td>{{ financeiro.id | number }}</td>
							<td>{{ financeiro.descricao }}</td>
							<td>
								<div ng-if="financeiro.tipo == 0">
									RECEITA
								</div>
								<div ng-if="financeiro.tipo == 1">
									DESPESA
								</div>
							</td>
							<td>{{ financeiro.data | date: 'dd/MM/yyyy' }}</td>
							<td>
								<div ng-if="financeiro.tipo == 0" class="text-success">
									+R$ {{financeiro.valor}}
								</div>
								<div ng-if="financeiro.tipo == 1" class="text-danger">
									-R$ {{financeiro.valor}}
								</div>
							</td>
							<td class="actions">
								<a ng-href="visualizar/{{financeiro.id}}">
									<button class="btn btn-warning btn-xs">
										<span class="glyphicon glyphicon-eye-open"></span>
									</button>
								</a>
								<a ng-href="editar/{{financeiro.id}}">
									<button class="btn btn-warning btn-xs">
										<span class="glyphicon glyphicon-pencil"></span>
									</button>
								</a>
								<button class="btn btn-warning btn-xs" ng-click="excluir(financeiro.id)">
									<span class="glyphicon glyphicon-trash"></span>
								</button>
							</td>                                   
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-md-3">
				<canvas id="doughnut" class="chart chart-doughnut" chart-data="data" chart-labels="labels"></canvas>
			</div>
		</div>		
    </body>
    <div class="modal fade" id="delete-modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel">
		<div class="modal-dialog" role="document">
				<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
								<span aria-hiden="true">&times;</span>
							</button>
							<h4 class="modal-title" id="modalLabel">Excluir Financeiro</h4>
						</div>
												
						<div class="modal-body">
							Deseja realmente excluir este financeiro?
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-warning" data-dismiss="modal" ng-click="excluir()">Sim</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
						</div>
				</div>
		</div>
	</div>    
</html>