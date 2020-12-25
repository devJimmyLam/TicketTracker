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
<body style="background: #d3d3d3">
		<nav class="navbar navbar-dark bg-dark navbar-expand-sm justify-content-between">
  <a class="navbar-brand text-info" href="#">TicketTracker</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/tickets">Dashboard</a>
      </li>
      <li class="nav-item">
<a class="nav-link" href="/logout">Logout,<c:out value="${user.firstName}"/></a>
      </li>
    </ul>
    <a class="btn btn-outline-success my-2 my-sm-0" href="/tickets/${ticket.id}/edit" type="btn">Edit Ticket</a>
    <form class="form-inline my-2 my-lg-0" action="/ticket/search" method="GET">
      <input class="form-control mr-sm-2" type="search" placeholder="Ticket#" aria-label="Ticket#">
      <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
 <div class="container">
            <header>
                 <div class="row justify-content-between">
                    <h1>Ticket# :<c:out value="${ticket.number}"/></h1>
                </div>
            </header>
            <div class="row justify-content-between">
                <div class="col-6">
                    <div class="row my-1">
                        <div class="col-3">Issue:</div>
                        <div class="col-8"><c:out value="${ticket.name}"/></div>
                    </div>
                    <div class="row my-1">
                        <div class="col-3">Status:</div>
                        <div class="col-8"><c:out value="${ticket.status}"/></div>
                    </div>
                    <div class="card">
                    	<div class="row my-1">
                      		<div class="col-3">Severity Type:</div>
                        	<div class="col-8"><c:out value="${ticket.severityType}"/></div>
                   		 </div>
                        <div class="row my-1">
                        	<div class="col-3">Due Date:</div>
                        	<div class="col-8"><c:out value="${ticket.dueDate}"/></div>
                    	</div>	
                        <div class="row my-1">
                        	<div class="col-3">Assignee:</div>
							<div class="col-8"><c:out value="${ticket.assignee.firstName}"/></div>
                    	</div>
                        <div class="row my-1">
                        	<div class="col-3">Description:</div>
                        	<div class="col-8"><c:out value="${ticket.description}"/></div>
                    	</div>		
                    </div>
                </div>
                <div class="col-5">
                    <h3>Message Log</h3>
                    <div class="row my-2">
                        <div style="overflow-y: scroll; height: 300px;" class="container border border-dark">
                            <c:forEach items="${ticket.messages}" var="message">
                            	<p>Sent:<c:out value="${message.createdAt}"/></p>
	                            <p><c:out value="${message.user.firstName} ${message.user.lastName}"/> says: <c:out value="${message.message}"/></p>
	                            <p>-----------------------------------</p>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="row my-2">
                        Send:
                    </div>
                    <form action="/tickets/${ticket.id}/message" method="POST"> 
	                    <div class="row my-2">
	                        <input name="newMessage" class="col-12 border border-dark" type="text"/>
	                    </div>
	                    <div class="row">
	                        <div class="col text-right">
	                            <button class="btn btn-warning">Submit</button>
	                        </div>
	                    </div>
                    </form>
                </div>
            </div>
        </div>
</body>
</html>