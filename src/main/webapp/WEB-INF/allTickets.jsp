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
<body style="background: #fbf5f3">
		<nav class="navbar navbar-dark bg-dark navbar-expand-sm justify-content-between">
  <a class="navbar-brand text-info" href="#">TicketTracker</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="/logout">Logout,<c:out value="${user.firstName}"/></a>
      </li>
    </ul>
    <a class="btn btn-outline-success my-2 my-sm-0" href="/tickets/new" type="btn">New Ticket</a>
    <form class="form-inline my-2 my-lg-0" action="/ticket/search" method="GET">
      <input class="form-control mr-sm-2" type="search" placeholder="Ticket#" aria-label="Ticket#">
      <button class="btn btn-outline-info my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
	<div class="container">
            <div class="row"> 
                <div class="col">    
                    <div class="row">
                        <table id="d-table" class="table table-striped table-bordered">
                            <thead class="thead-dark">
                                <th>Issues</th>
                                <th>Ticket#</th>
	                            <th>Assignee</th>
								<th>Severity</th>
                            </thead>
                             <tbody>
                            	<c:forEach items="${tickets}" var="ticket">
                    			
                    			<tr>
	                            	<td><a href="/tickets/${ticket.id}">${ticket.name}</a></td>
 	                        		<td>${ticket.number}</td>
									<td>${ticket.assignee.firstName} ${ticket.assignee.lastName}</td>
									<td>${ticket.severityType}</td> 
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