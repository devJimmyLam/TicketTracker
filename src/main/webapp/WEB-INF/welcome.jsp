<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- only use isErrorPage to render edit.jsp on a PUT requesst.     -->
<%@ page isErrorPage="true" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "form" uri = "http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


  <link rel="stylesheet" type="text/css" href="css/style.css" />
<!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>TicketTracker</title>
</head>
<body>
	<nav id="navbar-bg"class="navbar navbar-expand-sm navbar-light">
  	<div class="collapse navbar-collapse" id="navbarSupportedContent">
    	<ul class="navbar-nav mr-auto">

    	</ul>
    	<form class="form-inline my-2 my-lg-0" action="/login" method="POST">
    		<div class="form-inline my-2 my-lg-0 text-danger">
    			<c:out value="${errors}"/>
    		</div>
      		<input class="form-control mr-sm-2" name="email" type="email" placeholder="Email" aria-label="Email"/>
			<input class="form-control mr-sm-2" name="password" type="password"  placeholder="Password" aria-label="Password"/>
      		<button class="btn btn-success my-2 my-sm-0" type="submit">Login</button>
    	</form>
  	</div>
	</nav>
	<div class="container justify-content-center">
	<div id="register"class=" justify-content-end rounded m-60 ">
			<div class="card-body">
 			 	<div class="form-group justify-content-center row">
   	 				<div class="col-sm-6">
         				<h1 class="text-primary">Welcome to TicketTracker</h1>					
    				</div>
 			 	</div>
				<form:form action="/registration" method="POST" modelAttribute="user">
  					<div class="form-group justify-content-end row">
    					<label class="col-sm-2 col-form-label ">First Name:</label>
    					<div class="col-sm-6">
      						<form:input path="firstName"  type="text"/>
      						<form:errors path="firstName" class="text-danger"/>
    					</div>
  					</div>
  					<div class="form-group justify-content-end row">
    					<label class="col-sm-2 col-form-label ">Last Name:</label>
    					<div class="col-sm-6">
      						<form:input path="lastName" type="text"/>
      						<form:errors path="lastName" class="text-danger"/>
    					</div>
  					</div>
  					<div class="form-group justify-content-end  row">
    					<label class="col-sm-2 col-form-label ">Email:</label>
    					<div class="col-sm-6">
      						<form:input path="email"  type="text"/>
      						<form:errors path="email" class="text-danger"/>
    					</div>
  					</div>
  					<div class="form-group justify-content-end  row">
   						<label for="inputPassword" class="col-sm-2 col-form-label ">Password:</label>
   	 					<div class="col-sm-6">
      						<form:input path="password" type="password"/>
      						<form:errors path="password" class="text-danger"/>
    					</div>
 			 		</div>
					<div class="form-group  justify-content-end row">
   						<label for="inputPassword" class="col-sm-2 col-form-label ">Confirm Password:</label>
   	 					<div class="col-sm-6">
      						<form:input path="passwordConfirmation" type="password"/>
      						<form:errors path="passwordConfirmation" class="text-danger"/>					
    					</div>
 			 		</div>
 			 		<div class="form-group justify-content-end row">
   	 					<div class="col-sm-6">
         					<button id="register-btn" type="submit" class="btn btn-primary">Register</button>   					
    					</div>
 			 		</div>
				</form:form>
			</div>
	</div>
	
</body>
</html>