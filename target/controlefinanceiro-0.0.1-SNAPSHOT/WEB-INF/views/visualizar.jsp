<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" contente="IE-edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <title> Jiva - Controle Financeiro </title>
        
        <link type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet"/>       
        <script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>" ></script>
        <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>" ></script>
        <script type="text/javascript" src="<c:url value="/resources/js/angular.min.js"/>" ></script>
        <script type="text/javascript" src="<c:url value="/resources/js/visualizar-controller.js"/>" ></script> 
    </head>
    <body ng-app="financeiroApp">
        <nav class="navbar navbar-default" style="background-color: #F09717;">
                <div class="navbar-header">
                        <a class="navbar-left" href="#"> <img src="<c:url value="/resources/img/logo-jiva.png"/>" style="max-width: 100px"/> </a>
                </div>
            </div>
        </nav>
        <div id="main" class="container-fluid" ng-controller="financeiroController">
            <div class="container-fluid">
            	<div id="bottom" class="row">
                	<div class="col-md-12">
                    	<ul class="pager">
                        	<li class="previous"><a ng-href="../index">&lt; Principal </a></li>
                    	</ul>
                	</div>
            	</div>
            <h3 class="page-header"> Visualizar Financeiro </h3>
            <div class="row">
                <div class="col-md-4">
                    <p><strong> Descrição </strong></p>
                    <p> ${financeiro.descricao} </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <p><strong> Data </strong></p>
                    <p> <fmt:formatDate value="${financeiro.data.time}" pattern="dd/MM/yyyy"/> </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <p><strong> Valor </strong></p>
                    <p> ${financeiro.valor} </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <p><strong> Tipo </strong></p>
                    <p>
                        <c:choose>
                        	<c:when test="${financeiro.tipo == 0}">
                        		<p> RECEITA </p>
                        	</c:when>
                        	<c:when test="${financeiro.tipo == 1}">
                        		<p> DESPESA </p>
                        	</c:when>
                        </c:choose>
                    </p>
                </div>
            </div>
            
            <hr/>
            <div id="actions" class="row">
                <div class="col-md-12">
                    <a ng-href="../editar/${financeiro.id}" class="btn btn-warning"> Editar </a>
                    <a ng-href="../index" class="btn btn-warning" ng-click="excluir(${financeiro.id})"> Excluir </a>
                    <a ng-href="../index" class="btn btn-default"> Fechar </a>
                </div>
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
                    <button type="button" class="btn btn-warning">Sim</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Não</button>
                </div>
            </div>
        </div>
    </div>


</html>