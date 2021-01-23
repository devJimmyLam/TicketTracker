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
<body style="background: #d3d3d3">
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
			<li class="nav-item"><a class="nav-link text-light" href="/tickets">Dashboard</a>
			</li>
			<li class="nav-item"><a class="nav-link disable" href="#"><span
					class="text-white">|</span></a></li>
			<li class="nav-item"><a class="nav-link text-light" href="/logout">Logout
					(<c:out value="${user.firstName}" />)
			</a></li>
		</ul>
	</nav>
	<div class="container" style="background: #d3d3d3">
		<div class="row">
			<div class="col-6">
				<div class="row my-2">
					<h1>What is Your Issue?</h1>
				</div>
				<form:form action="/tickets/add" method="post"
					modelAttribute="ticket">
					<div class="row my-2">
						<div class="col-6">Issue Name:</div>
						<form:input path="name" type="text" class="col-6" />
						<form:errors class="text-danger" path="name" />
					</div>

					<div class="row my-2">
						<div class="col-6">Severity Type</div>
						<form:select path="severityType" class="col-3" type="text">
							<c:forEach items="${severityType}" var="severityType">
								<option value="${severityType}"><c:out
										value="${severityType}" /></option>
							</c:forEach>
						</form:select>
					</div>
					<div class="row my-2">
						<div class="col-6">Status</div>
						<form:select path="status" class="col-3" type="text">
							<c:forEach items="${status}" var="status">
								<option value="${status}"><c:out value="${status}" /></option>
							</c:forEach>
						</form:select>
					</div>
					<div class="row my-2">
						<div class="col-6">Due Date:</div>
						<form:input path="dueDate" type="date" class="col-6" />
					</div>

					<div class="row my-2">
						<div class="col-6">Assignee:</div>
						<form:select path="assignee" class="col-3">
							<c:forEach items="${assignees}" var="assignee">
								<form:option value="${assignee}">
									<c:out value="${assignee.firstName} ${assignee.lastName}" />
								</form:option>
							</c:forEach>
						</form:select>
					</div>

					<div class="row my-2">
						<div class="col-6">Description:</div>
						<form:textarea path="description" type="text" row="6" class="form-group" />
						<form:errors class="text-danger" path="description" />
					</div>

					<div class="row my-2 ml-5 justify-content-center">
						<button type="submit" class="btn btn-success ml-5">Add Ticket</button>
					</div>

				</form:form>
			</div>
		</div>
	</div>
</body>
</html>