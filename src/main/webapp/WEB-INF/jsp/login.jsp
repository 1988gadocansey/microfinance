<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 
<link href='${pageContext.request.contextPath}/logins/css/materialize.css' type="text/css" rel="stylesheet" media="screen,projection">
  <link href='${pageContext.request.contextPath}/logins/css/style.css' type="text/css" rel="stylesheet" media="screen,projection">
    <!-- Custome CSS-->    
    <link href="${pageContext.request.contextPath}/logins/css/custom-style.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="${pageContext.request.contextPath}/logins/css/page-center.css" type="text/css" rel="stylesheet" media="screen,projection">

  <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
  <link href="${pageContext.request.contextPath}/logins/css/prism.css" type="text/css" rel="stylesheet" media="screen,projection">
  <link href="${pageContext.request.contextPath}/logins/js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet" media="screen,projection">
<title>Login | Savoy Microfinance</title>
</head>
<body class="blue-grey">
  <!-- Start Page Loading -->
  <div id="loader-wrapper">
      <div id="loader"></div>        
      <div class="loader-section section-left"></div>
      <div class="loader-section section-right"></div>
  </div>
  <!-- End Page Loading -->
  <div>
   <!-- if there are login errors, show them here -->
		<c:if test="${param.error ne null}">

                <div class="uk-form-row">
                    <div class="alert alert-danger" style="background-color: red;color: white">
                       
                          <ul>
                             <li>Invalid username and password</li>
                      </ul>
                </div>
              </div>
           </c:if>
  </div>
  <div class="row">
          <div class="input-field col s12 center">
              <img src="${pageContext.request.contextPath}/logins/images/logo.png" alt="" class="" style="width:121px;height:auto">
            <p class="center login-form-text" style='color:white'>MICROFINANCE MANAGEMENT SYSTEM - BANKING</p>
          </div>
        </div>
 </div>
  <div id="login-page" class="row">
    <div class="col s12 z-depth-4 card-panel">
       <form action="/login" method="post">
            
             <div>&nbsp;</div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-social-person-outline prefix"></i>
            <input id="username" type="email" required=""    name="email">
            <label for="username" class="center-align">Staff ID</label>
          </div>
        </div>
        <div class="row margin">
          <div class="input-field col s12">
            <i class="mdi-action-lock-outline prefix"></i>
            <input id="password" type="password" required="" name="password">
            <label for="password">Password</label>
          </div>
        </div>
        <div class="row">          
          <div class="input-field col s12 m12 l12  login-text">
              <input type="checkbox" id="remember-me" />
              <label for="remember-me">Remember me</label>
          </div>
        </div>
        <div class="row">
          <div class="input-field col s12">
              <table>
                  <tr>
                      <Td><button type="submit" class="btn waves-effect waves-light col s12">Login</button></Td>
                      <td><a href=''/>Forgot password??</a></td>
             
                  </tr>
              </table>
          </div>
        </div>
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      </form>
    </div>
     <div class="row"><%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy"); %>
 
            <center><small style="font-size: 11px">&copy <%= df.format(new java.util.Date()) %>  Savoy Microfinance</small></center>         
        </div>
  </div>


</body>
 <!-- jQuery Library -->
  <script type="text/javascript" src="${pageContext.request.contextPath}/logins/js/jquery-1.11.2.min.js"></script>
   
  <!--materialize js-->
   
  <script type="text/javascript" src="${pageContext.request.contextPath}/logins/js/materialize.js"></script>
  
  <!--prism-->
  <script type="text/javascript" src="${pageContext.request.contextPath}/logins/js/prism.js"></script>
  <!--scrollbar-->
  <script type="text/javascript" src="${pageContext.request.contextPath}/logins/js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>

  <!--plugins.js - Some Specific JS codes for Plugin Settings-->
  <script type="text/javascript" src="${pageContext.request.contextPath}/logins/js/plugins.js"></script>
</html>