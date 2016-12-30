<%-- 
    Document   : customerDisplay
    Created on : Dec 29, 2016, 9:27:37 PM
    Author     : Nyame Tease
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body ng-app="customers" ng-controller="customerController">
        <h1>Hello World!</h1>
        <button ng-click="charger()">Show customers</button>
        <table border="1">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="c in Customers">
                    <td>{{c.id}}</td>
                    <td>{{c.firstname}}</td>
                </tr>
            </tbody>
        </table>
    </body>
    <script src="${pageContext.request.contextPath}/assets/js/angular/angular.min.js "></script> 
    
    <script type="text/javascript">
        var app=angular.module("customers",[]);
        app.controller("customerController",function($scope,$http){
            $scope.Customers=[];
            $scope.charger=function(){
                $http.get("/customer")
                        .success(function(data){
                            $scope.Customers=data;
                        });
            }
            
        });
     </script>
</html>
