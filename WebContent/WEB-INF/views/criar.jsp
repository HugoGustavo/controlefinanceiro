<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html lang="pt-br">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE-edge">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title> Jiva - Controle Financeiro </title>
        <link type="text/css" href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">       
        
        <script type="text/javascript" src="<c:url value="/resources/js/jquery.min.js"/>" ></script>
        <script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>" ></script>
        <script type="text/javascript" src="<c:url value="/resources/js/angular.min.js"/>" ></script>
        <script type="text/javascript" src="<c:url value="/resources/js/criar-controller.js"/>" ></script>
    </head>
    <body ng-app="financeiroApp">
        <nav class="navbar navbar-default" style="background-color: #F09717;">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-left" href="#"> <img src="<c:url value="resources/img/logo-jiva.png"/>" style="max-width: 100px"/> </a>
                </div>
            </div>
        </nav>
        <div id="main" class="container-fluid">
            <div id="bottom" class="row">
                <div class="col-md-12">
                    <ul class="pager">
                        <li class="previous"><a ng-href="index">&lt; Principal </a></li>
                    </ul>
                </div>
            </div>
            <h3 class="page-header"> Adicionar Financeiro </h3>
            <form ng-controller="financeiroController" action="index">
                <div class="row">
                    <div class="form-group col-md-4 required">
                        <label for="descricao"> Descrição </label>
                        <input type="text" class="form-control" id="descricao" ng-model="descricao"/>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4 required">
                        <label for="data"> Data </label>
                        <input type="date" class="form-control" id="data" ng-model="data"/>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4 required">
                        <label for="valor"> Valor </label>
                        <input type="number" step="0.01" class="form-control" id="valor" ng-model="valor"/>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group col-md-4 required">
                        <label for="tipo"> Tipo </label><br/>
                        <select class="form-control" id="tipo" ng-model="tipo" required="required">
                        	<option value="0"> RECEITA </option>
                        	<option value="1"> DESPESA </option>
                        </select>
                    </div>
                </div>
                <hr/>
                <div id="actions" class="row">
                    <div class="col-md-4">
                        <button type="submit" class="btn btn-warning" ng-click="salvar()"> Salvar </button>
                        <a href="index" class="btn btn-default"> Cancelar </a>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>