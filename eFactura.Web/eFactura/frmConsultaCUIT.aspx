<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="frmConsultaCUIT.aspx.vb" Inherits="eFactura.Web.frmConsultaCUIT" %>

<%@ Register Assembly="ASF4.WebControls" Namespace="ASF.WebControls" TagPrefix="cc1" %>
<!DOCTYPE html>

<!-- declaro que voy a usar un módulo NG-APP (ng=angular), normalmente se crea un solo módulo por app y por convención se le llama "app"  -->
<html xmlns="http://www.w3.org/1999/xhtml" ng-app="app">
<head runat="server">
    <script src="/Scripts/Lib/angular.min.js"></script> 
    <script src="/Scripts/Lib/angular-resource.min.js"></script>
    
    <title>Untitled Page</title>
    <link href="~/Styles.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        var app = angular.module('app', ['ngResource']); // este es el add reference - ngResource es como el nombre de la DLL, ngResource está inlcuido en angular-resource.min.js
                                                         // se pueden tener multiples apps, pero esto no es una SPA, por lo anto se levanta esto
        
        app.controller("IndexCtrl", ['$scope', '$resource', function ($scope, $resource) {  // definicion del controlador de lapágina ES EL "IMPORT"
            // en rojo se declara en realidad lo que importas y adentro de la función se declara que nombre va a tener
            // en tojo se podría poner $MyResource y puedo inventar el mío
            // el scope siempre se usa y no hace falta decir que se importa porque viene por default en el angular.
            $scope.valor = null; // creacion de variable global a la página 
            $scope.cuit = ""; // creacion de variable global a la página  ej. 30506775244
            $scope.FechaDesdeDeprecada = ""; // PK 05/08
            $scope.ObligadoDeprecado = ""; // PK 05/08
            $scope.consultando = false;

            $scope.consultarAFIP = function () // definicion de una función "consultarAFIP" (se podría sacar afuera en una librería propia)
            {
                 $scope.consultando = true;
                 $resource("/Api/AfipService/" + $scope.cuit).get({},
                    function (data) {
                        console.log(data);
                        $scope.valor = data; 
                        $scope.consultando = false;
                    },
                    function (err) {
                        console.log(err);
                        alert(err);
                        $scope.consultando = false;
                    }); // devuelve el resultado de la consulta al WEB API en la variable .valor
                // $resource es (de hecho) una librería compartida (MA tiene una que se llama bussines services (que se puede poner en un js, 
                // declararla con el tag SCRIPT, declararla que la va a usar el módulo y declararla en cada controlador que la necesite 
            }
        }]);
    </script>
</head>

<!-- declaro que voy a usar un controlador, se puede hacer el body o en cada DIV, vive en el ámbito de una mierda de estas  -->
<body ng-controller="IndexCtrl">
    <!-- todo lo que está en el ambito del controlador va a poder hacer uso de lo que está en el controlador-->
    <form id="form1" runat="server">
        <div class="CMS">
            <cc1:HelperMenu ID="objMenu" runat="server">
            </cc1:HelperMenu>
            <div class="content_wrapper">
                <asp:Panel ID="global_navigation" CssClass="global_navigation" runat="server" />
                <div class="content_area">
                    <asp:Panel ID="side_navigation" CssClass="side_navigation" runat="server" />
                    <div class="action_area" style="background-color: white; padding: 20px">
                        CUIT: &nbsp;
                        
                        <!-- define que el $scope.cuit  está BINDEADO a este control -->
                        <input type="text" placeholder="CUIT" ng-model="cuit" />

                        <!-- defino que hacer click llama a la función consultarAFIP-->
                        <button type="button" ng-click="consultarAFIP()" ng-hide="consultando===true">Consultar AFIP</button>
                        <br />
                        <br />
                        <!-- muestra la variable VALOR del SCOPE -->
                        <!-- lo que está entre {{ }} lo evalúa dinámicamente ANGULAR -->
                        <!-- ng-show evalua dinámicamente una expresión y en tiempo real muestra o no-->
                        
                        <span style="font-weight:bold;">
                        <!-- Antes decía esto, lo cambié Obligado: <span ng-show="valor!==null"> {{valor.Obligado==='S'?"SI":"NO"}}</span> -->
                        Obligado: <span ng-show="valor!==null"> {{valor.Obligado}}</span>
                        <br />
                        <!-- el PIPE es un FILTRO en este caso es para formatear NUMBER con 2 decimales. -->
                        <!-- el filtro se usa para filtrar o formatear -->
                        Monto:  {{valor.MontoDesde | number:2}}
                        </span>
                        <br />
                        <br />
                        <!-- PK 05/08 -->
                        Respuesta Formato Viejo: {{valor.ObligadoDeprecado }}
                        <br />
                        Fecha Desde Formato Viejo: {{valor.FechaDesdeDeprecada }}
                        <br />

                        <h1 ng-show="consultando===true">Consultando AFIP</h1>
                    </div>
                </div>

                <div class="content_area">
                    <div class="action_area" style="background-color: white; padding: 20px">
                        <!-- PK 05/08 -->
                        Algunos ejemplos <br /> <br />
                        CUIT 30500000127 -> FECHA DESDE 01/05/2019 <br />
                        CUIT 30500526935 -> FECHA DESDE 01/06/2019 <br />
                        CUIT 30501086246 -> FECHA DESDE 01/07/2019 <br />
                        CUIT 20130531734 -> FECHA DESDE 01/08/2019 <br />
                        CUIT 20076397644 -> FECHA DESDE 01/09/2019 <br />
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>

</html>
