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
<title>TicketTracker</title>
</head>
<body>
	<div class="container">
   		<nav class="navbar navbar-light bg-light justify-content-between">
   			<a class="form-inline" href="/tickets">Dashboard</a>
   			<a class="form-inline" href="/logout">Logout<c:out value="${user.firstName}"/></a>
		</nav>
            <div class="row">
                <div class="col-6">
                    <div class="row my-2">
                        <h1>What is Your Issue?</h1>
                    </div>
                    <form:form action="/tickets/add" method="post" modelAttribute="ticket">
	                    <div class="row my-2">
	                        <div class="col-6">Issue Name:</div>
	                        <form:input path="name" type="text" class="col-6"/>
	                        <form:errors class="text-danger" path="name"/>
	                    </div>
	                    <div class="row my-2">
	                        <div class="col-6">Severity Type</div>
	                        <form:input path="severityType" type="text" class="col-6"/>
	                    </div>
	                  	<div class="row my-2">
	                        <div class="col-6">Due Date:</div>
	                        	<form:input path="dueDate" type="text" class="col-6"/>
							<div class="row my-2">
	                    </div>
						<div class="row my-2">
	                        <div class="col-6">Assignee:</div>	                        	
	                        	<form:select path="user" name="user" id="user">
	                        		<c:forEach items="${users}" var="user">
	                        		<form:option value="${user}"><c:out value ="${user.firstName} ${user.lastName}"></c:out></form:option>
	                        		</c:forEach>
	                        	</form:select>
							<div class="row my-2">
	                    </div>
						<div class="row my-2">
	                        <div class="col-6">Description:</div>
	                        	<form:input path="description" type="text" class="col-6"/>
	                        	<form:errors class="text-danger" path="description"/>
							<div class="row my-2">
	                    </div>
						<div class="row my-2">
	                        <div class="col-3">
	                            <button type="submit" class="btn btn-success round-pill">Add Ticket</button>
	                        </div>
	                        <div class="col-3">
	                            <a href="/tickets" type="button" class="btn btn-danger round pill">Cancel</a>
	                        </div>
	                    </div>
                    </form:form>
                </div>
            </div>
        </div>
</body>
</html>