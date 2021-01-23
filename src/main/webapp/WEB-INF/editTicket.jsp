<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- only use isErrorPage to render edit.jsp on a PUT requesst.     -->
<%@ page isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>TicketTracker</title>
</head>
<body style="background: #d3d3d3;">
	<nav class="navbar navbar-expand-lg" style="background: #1c1e21;">
		<a class="navbar-brand text-primary" href="#"><h3>TicketTracker</h3></a>
		<form class="form-inline my-2 my-lg-0" action="/tickets/search"
			method="POST">
			<input class="form-group input-sm mr-sm-2" type="text"
				name="searchString" placeholder="Status" aria-label="Status">
			<button class="btn btn-outline-info btn-sm my-2 my-sm-0"
				type="submit">Search</button>
		</form>
		<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a class="nav-link text-success"
				href="/tickets/new"><b>New Ticket</b></a></li>
			<li class="nav-item"><a class="nav-link disable" href="#"><span
					class="text-light">|</span></a></li>
			<li class="nav-item"><a class="nav-link text-light"
				href="/tickets">Dashboard</a></li>
			<li class="nav-item"><a class="nav-link disable" href="#"><span
					class="text-white">|</span></a></li>
			<li class="nav-item"><a class="nav-link text-light"
				href="/logout">Logout (<c:out value="${user.firstName}" />)
			</a></li>
		</ul>
	</nav>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<div class="row my-2">
					<h1>Edit Issue: ${ticket.id}</h1>
				</div>
				<form:form action="/tickets/${ticket.id}/update" method="post"
					modelAttribute="ticket">
					<div class="row my-2">
						<div class="col-6">Issue Name:</div>
						<form:input path="name" class="col-6" type="text"
							value="${ticket.name}" />

					</div>
					<div class="row my-2">
						<div class="col-6">Status</div>
						<form:select path="status" class="col-6" type="text">
							<c:forEach items="${statuses}" var="status">
								<option value="${status}"
									<c:if test="${ticket.status.equals(status)}">selected</c:if>><c:out
										value="${status}" /></option>
							</c:forEach>
						</form:select>
					</div>
					<div class="row my-2">
						<div class="col-6">Severity Type</div>
						<form:select path="severityType" class="col-6">
							<c:forEach items="${severityTypes}" var="severityType">
								<option value="${severityType}"
									<c:if test="${ticket.severityType.equals(severityType)}">selected</c:if>><c:out
										value="${severityType}" /></option>
							</c:forEach>
						</form:select>
					</div>
					<div class="row my-2">
						<div class="col-6">Due Date:</div>
						<form:input path="dueDate" type="date" class="col-6"
							value="${ticket.dueDate}" />
					</div>

					<div class="row my-2">
						<div class="col-6">Assignee:</div>
						<form:select path="assignee" class="col-6">
							<c:forEach items="${assignees}" var="assignee">
								<form:option value="${assignee}">
									<c:out value="${assignee.firstName} ${assignee.lastName}" />
								</form:option>
							</c:forEach>
						</form:select>
					</div>

					<div class="row my-2">
						<div class="col-6">Description:</div>
						<form:textarea path="description" type="text" row="6"
							class="form-group" value="${description}" />
						<form:errors class="text-danger" path="description" />
					</div>

					<div class="d-flex justify-content-start">
						<button type="submit" class="btn btn-success btn-sm mr-2">Update</button>
						<a class="btn btn-warning btn-sm mr-sm-2 my-sm-0" href="/tickets"
							type="btn">Cancel</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>