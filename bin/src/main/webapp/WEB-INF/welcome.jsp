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
	<div class="container justify-content-center">
	<nav id="navbar-bg"class="navbar navbar-expand-sm navbar-light">
	  	<span class="navbar-text text-primary display-4">
    		TicketTracker
  		</span>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  		</button>
  	<div class="collapse navbar-collapse" id="navbarSupportedContent">
    	<ul class="navbar-nav mr-auto">
<!--       		<li class="nav-item active">
        		<a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      		</li> -->
    	</ul>
    	<form class="form-inline my-2 my-lg-0" action="/login" method="POST">
    		<div class="form-inline my-2 my-lg-0 text-danger">
    			<c:out value="${errors}"/>
    		</div>

      		<input class="form-control mr-sm-2" name="email" type="email" placeholder="Email" aria-label="Email"/>
			<input class="form-control mr-sm-2" name="password" type="password"  placeholder="Password" aria-label="Password"/>
      		<button class="btn btn-primary my-2 my-sm-0 rounded-pill" type="submit">Login</button>
    	</form>
  	</div>
	</nav>

		<div id="register"class="card justify-content-center border border-primary rounded m-30 ">
			<div class="card-body">
			<form:form action="/registration" method="POST" modelAttribute="user">
  				<div class="form-group row">
    				<label class="col-sm-2 col-form-label text-white">First Name:</label>
    				<div class="col-sm-6">
      					<form:input path="firstName" class="form-control" type="text"/>
      					<form:errors path="firstName" class="text-danger"/>
    				</div>
  				</div>
  				<div class="form-group row">
    				<label class="col-sm-2 col-form-label text-white">Last Name:</label>
    				<div class="col-sm-6">
      					<form:input path="lastName" class="form-control" type="text"/>
      					<form:errors path="lastName" class="text-danger"/>
    				</div>
  				</div>
  				<div class="form-group row">
    				<label class="col-sm-2 col-form-label text-white">Email:</label>
    				<div class="col-sm-6">
      					<form:input path="email" class="form-control" type="text"/>
      					<form:errors path="email" class="text-danger"/>
    				</div>
  				</div>
  				<div class="form-group row">
   					<label for="inputPassword" class="col-sm-2 col-form-label text-white">Password:</label>
   	 				<div class="col-sm-6">
      					<form:input path="password" class="form-control" type="password"/>
      					<form:errors path="password" class="text-danger"/>
    				</div>
 			 	</div>
				<div class="form-group row">
   					<label for="inputPassword" class="col-sm-2 col-form-label text-white">Password Confirm:</label>
   	 				<div class="col-sm-6">
      					<form:input path="passwordConfirmation" class="form-control" type="password"/>
      					<form:errors path="passwordConfirmation" class="text-danger"/>					
    				</div>
 			 	</div>
 			 	<div class="form-group row">
   	 				<div class="col-sm-6">
         				<button id="register-btn" type="submit" class="btn btn-success rounded-pill form-control">Register</button>   					
    				</div>
 			 	</div>
			</form:form>
			</div>
		</div>
	</div>
</body>
</html>