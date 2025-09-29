<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TestAngular.aspx.vb" Inherits="eFactura.Web.TestAngular" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" ng-app="app">
<head >
    <style type="text/css">
        input.ng-invalid {background-color:red}
    </style>
    <script src="Scripts/Lib/angular.min.js"></script>
    <title></title>

    <script type="text/javascript">
        var app = angular.module('app', []);

        app.controller("IndexCtrl", ['$scope', function ($scope) {
            $scope.action = "Viewving";
            $scope.valor = null;
        }]);

        app.directive("crudRequired", function ($compile) {
            return {
                priority: 1001, // compiles first
                terminal: true, // prevent lower priority directives to compile after it
                link: function (scope, element, attrs) {

                    element.removeAttr('crud-required'); // necessary to avoid infinite compile loop
                    element.attr('ng-required', 'true');
                    element.attr('ng-disabled', 'action!=="Editing" && action!=="Adding"');
                    $compile(element)(scope);
                }
            };
        })

    </script>
</head>
<body ng-controller="IndexCtrl">
    <form id="form1" runat="server">
    <div>
        <h1>{{action}}</h1>

        <button type="button" ng-click ="action='Adding'">Agregar</button>
        <button type="button" ng-click ="action='Editing'">Modificar</button>
        <button type="button" ng-click ="action='Viewing'">Cancelar</button>
        <br />
        <br />
        <input type="text" crud-required ng-model="valor"/>
        <input type="text" ng-disabled="action!=='Adding' && action!=='Editing'" ng-required="true" ng-model="valor"/>

    </div>
    </form>
</body>
</html>
