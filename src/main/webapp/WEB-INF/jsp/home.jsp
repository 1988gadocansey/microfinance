<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 
<link href='${pageContext.request.contextPath}/assets/plugins/uikit/css/uikit.almost-flat.min.css' type="text/css" rel="stylesheet" media="screen,projection">
  <link href='${pageContext.request.contextPath}/assets/css/login_page.min.css' type="text/css" rel="stylesheet" media="screen,projection">
   
   <title>Login | United Workers Cooperative Credit Union</title>
</head>
<body class="login_page">

    <div class="login_page_wrapper">
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
  
 <div class="login_heading">
                    <img src="${pageContext.request.contextPath}/assets/logo.png"class="thumbnail" style="width:182px;height: auto"/>
                </div>
            <center><h4 class="uk-text-primary uk-text-upper uk-text-large">UNITED WORKERS CO OPERATIVE CREDIT UNION</h4></center>
        <div class="md-card" id="login_card">
            <div class="md-card-content large-padding" id="login_form">
               
                <form action="/login" method="Post">
                    <div class="uk-form-row">
                        <label for="login_username">Email</label>
                        <input class="md-input" type="email" required="" id="login_username" name="email"  />
                    
                    </div>
                    <input type="hidden" name="_token" value="{!! csrf_token() !!}">
                    <div class="uk-form-row">
                        <label for="login_password">Password</label>
                        <input class="md-input" type="password" id="login_password" name="password" required=""  />
                    </div>
                    <div class="uk-margin-medium-top">
                        <button type="submit"  class="md-btn md-btn-primary md-btn-block md-btn-large">Login </button>
                    </div>
                    <div class="uk-margin-top">
                         
                        <span class="icheck-inline">
                            <input type="checkbox" name="remember" id="login_page_stay_signed" data-md-icheck />
                            <label for="login_page_stay_signed" class="inline-label">Stay signed in</label>
                        </span>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
                </form>
            </div>
             
             
        </div>
           <div class="row"><%java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy"); %>
 
            <center><small style="font-size: 11px">&copy <%= df.format(new java.util.Date()) %>   Powered by Gadeksystems - 0505284060 | Cape Coast</small></center>         
        </div>
          
           </div>


</body>
 <!-- common functions -->
    <script src="${pageContext.request.contextPath}/assets/js/common.min.js  "></script>
    <!-- altair core functions -->
    <script src="${pageContext.request.contextPath}/assets/js/altair_admin_common.min.js "></script>

    <!-- altair login page functions -->
    <script src="${pageContext.request.contextPath}/assets/js/pages/login.min.js "></script>
 
 
 </html>