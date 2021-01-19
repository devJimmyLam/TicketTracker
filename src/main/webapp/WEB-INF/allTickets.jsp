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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>TicketTracker</title>
</head>
<body>
	<nav
		class="navbar navbar-dark bg-dark navbar-expand-sm justify-content-between">
		<a class="navbar-brand text-primary" href="#"><h1>TicketTracker</h1></a>
		<div class="navbar">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link text-primary"
					href="/logout">Logout (<c:out value="${user.firstName}" />)
				</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<div class="row justify-content-between mt-5"
			style="margin-bottom: -5em">
			<a class="btn btn-success my-2 my-sm-0" href="/tickets/new"
				type="btn">New Ticket</a>
			<form class="form-inline my-2 my-lg-0" action="/tickets/search"
				method="POST">
				<input class="form-control mr-sm-2" type="text" name="searchString"
					placeholder="Search Status" aria-label="Search Status">
				<button class="btn btn-info my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<div class="row">
			<div class="col">
				<div class="row">
					<table id="created-table"
						class="table table-striped table-bordered ">
						<thead class="thead-dark">
							<th>Created Tickets:</th>
							<th>Ticket#:</th>
							<th>Assigned To:</th>
							<th>Severity:</th>
							<th>Status:</th>
							<th>Actions:</th>
						</thead>
						<tbody>
							<c:forEach items="${tickets}" var="ticket">
								<tr>
									<c:if test="${ticket.userIsCreator(user)}">
										<td><a href="/tickets/${ticket.id}">${ticket.name}</a></td>
										<td>${ticket.id}</td>
										<td>${ticket.assignee.firstName}
											${ticket.assignee.lastName}</td>
										<td>${ticket.severityType}</td>
										<td>${ticket.status}</td>
										<td><a class="btn btn-outline-primary btn-sm"
											href="/tickets/${ticket.id}/edit">Edit</a>
											<form action="/tickets/${ticket.id}/delete" method="post">
												<button class="btn btn-outline-danger btn-sm" type="submit">Delete</button>
											</form>
									</c:if>

									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row" style="margin-top: -5em">
			<div class="col">
				<div class="row">
					<table id="assigned-table"
						class="table table-striped table-bordered ">
						<thead class="thead-dark">
							<th>Assigned Tickets:</th>
							<th>Ticket#:</th>
							<th>Created By:</th>
							<th>Severity:</th>
							<th>Status:</th>
							<th>Actions:</th>
						</thead>
						<tbody>
							<c:forEach items="${tickets}" var="ticket">
								<tr>
									<c:if test="${ticket.userIsAssignee(user)}">
										<td><a href="/tickets/${ticket.id}">${ticket.name}</a></td>
										<td>${ticket.id}</td>
										<td>${ticket.creator.firstName}
											${ticket.creator.lastName}</td>
										<td>${ticket.severityType}</td>
										<td>${ticket.status}</td>
										<td><a class="btn btn-outline-primary btn-sm"
											href="/tickets/${ticket.id}/edit">Edit</a></td>
									</c:if>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>