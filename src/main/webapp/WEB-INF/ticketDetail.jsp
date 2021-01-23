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
		<header class="mt-4">
			<div class="row justify-content-between">
				<h1>
					Ticket# :
					<c:out value="${ticket.id}" />
				</h1>
			</div>
		</header>
		<div class="row justify-content-between">
			<div class="col-6">
				<div class="row my-1">
					<div class="col-3">
						<a class="btn btn-dark btn-sm my-2 my-sm-0"
							href="/tickets/${ticket.id}/edit" type="btn">Edit Ticket</a>
					</div>
				</div>
				<div class="row my-1 p-3">
					<div class="col-3">Issue:</div>
					<div class="col-8">
						<c:out value="${ticket.name}" />
					</div>
				</div>
				<div class="row my-1 p-3">
					<div class="col-3">Status:</div>
					<div class="col-8">
						<c:out value="${ticket.status}" />
					</div>
				</div>
				<div class="p-2"style="border-style: solid; height:280px;">
					<div class="row my-1 p-2">
						<div class="col-3">Severity Type:</div>
						<div class="col-8">
							<c:out value="${ticket.severityType}" />
						</div>
					</div>
					<div class="row my-1 p-2">
						<div class="col-3">Due Date:</div>
						<div class="col-8">
							<c:out value="${ticket.dueDate}" />
						</div>
					</div>
					<div class="row my-1 p-2">
						<div class="col-3">Assignee:</div>
						<div class="col-8">
							<c:out value="${ticket.assignee.firstName}" />
						</div>
					</div>
					<div class="row my-1 p-2">
						<div class="col-3">Description:</div>
						<div class="col-8">
							<c:out value="${ticket.description}" />
						</div>
					</div>
				</div>
			</div>
			<div class="col-5">
				<h3 style="margin-left: -15px">Message Log</h3>
				<div class="row my-2">
					<div style="overflow-y: scroll; height: 300px;"
						class="container border border-dark bg-white">
						<c:forEach items="${ticket.messages}" var="message">
							<p>
								Sent:
								<c:out value="${message.createdAt}" />
							</p>
							<p>
								<c:out
									value="${message.user.firstName} ${message.user.lastName}" />
								:
								<c:out value="${message.message}" />
							</p>
							<p>-----------------------------------</p>
						</c:forEach>
					</div>
				</div>
				<div class="row my-2">Post a Message.</div>
				<form action="/tickets/${ticket.id}/message" method="POST">
					<div class="row my-2">
						<input name="newMessage" class="col-12 border border-dark"
							type="text" />
					</div>
					<div class="row">
						<div class="col" style="margin-left: -15px">
							<button class="btn btn-warning btn-sm">Submit</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>