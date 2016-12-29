<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"rel="stylesheet"
	type="text/css"></link>
<title>Savoy Microfinance | Access Denied</title>

</head>
<body class="security-app">
	<div class="details">
	<center><h2>Access denied to this page</h2></center>
	</div>
	<div class="container">		
		<div class="alert-danger">
			<h3>You do not have permission to access this page!</h3>	
		</div>
		<center><form action="/logout" method="post">
			<input type="submit" class="btn btn-danger" value="Sign in as different user" /> <input
				type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>		</center>
	</div>	
</body>
</html>