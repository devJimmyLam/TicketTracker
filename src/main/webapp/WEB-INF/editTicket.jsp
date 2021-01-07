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
    <form class="form-inline my-2 my-lg-0" action="/ticket/search" method="GET">
      <input class="form-control mr-sm-2" type="search" placeholder="Ticket#" aria-label="Ticket#">
      <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
	<div class="container">
            <div class="row">
                <div class="col-6">
                    <div class="row my-2">
                        <h1>Edit Issue</h1>
                    </div>
                    <form:form action="/tickets/${ticket.id}/update" method="post" modelAttribute="ticket">
	                    <div class="row my-2">
	                    		<div class="col-6">Issue Name:</div>
	                       		 <form:input path="name" class="col-6" type="text" value="${name}"/>
	                    </div>
	                    <div class="row my-2">
	                        <div class="col-6">Status</div>
	                        	<form:select path="status" class="col-3" type="text">
	                        	<c:forEach items="${status}" var="status">
	                        		<option value="${status}"><c:out value="${status}"/></option>
	                        	</c:forEach>
	                            </form:select>
	                    </div>
	                    <div class="row my-2">
	                        <div class="col-6">Severity Type</div>
	                        	<form:select path="severityType" class="col-3" type="text">
	                        	<c:forEach items="${severityType}" var="severityType">
	                        		<option value="${severityType}"><c:out value="${severityType}"/></option>
	                        	</c:forEach>
	                            </form:select>
	                    </div>
	                  	<div class="row my-2">
	                        <div class="col-6">Due Date:</div>
	                        	<form:input path="dueDate" type="date" class="col-6"  value="${dueDate}"/>
	                    </div>
	                    
						<div class="row my-2">
	                        <div class="col-6">Assignee:</div>                        	
	                        	<form:select path="assignee" class="col-3" >
	                        		<c:forEach items="${assignees}" var="assignee">
	                        		<form:option value="${assignee}"><c:out value ="${assignee.firstName} ${assignee.lastName}"/></form:option>
	                        		</c:forEach>
	                        	</form:select>
	                    </div>
	                    
						<div class="row my-2">
	                        <div class="col-6">Description:</div>
	                        	<form:input path="description" type="text" class="col-6"  value="${description}"/>
	                        	<form:errors class="text-danger" path="description"/>
	                    </div>
	                    
						<div class="row my-2 justify-content-end">
	                        <button type="submit" class="btn btn-success">Update</button>
	                    </div>
	                    <div class="col">
	                    	<div class="row my-2 justify-content-end">
            					<a class="btn btn-warning my-2 my-sm-0" href="/tickets" type="btn">Cancel</a>
	           	 			</div>
            			</div>
	                    
                    </form:form>
                </div>
            </div>
        </div>
</body>
</html>