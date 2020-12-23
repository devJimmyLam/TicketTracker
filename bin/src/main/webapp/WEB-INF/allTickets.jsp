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
		<nav id="navbar-bg"class="navbar navbar-expand-sm navbar-light justify-content-between">
	  		<span class="navbar-text text-primary">
    		<h3>TicketTracker</h3>
  			</span>
  			<a class="form-inline" href="/logout">Logout,<c:out value="${user.firstName}"/></a>
		</nav>
	<div class="container">
						<div class="row">
						<a class="btn btn-success" href="/tickets/new" type="btn">New Ticket</a>
                    </div>
            <div class="row">
                <div class="col">
                    <div class="row">
                        <table id="d-table" class="table table-striped table-bordered">
                            <thead class="thead-dark">
                                <th>Issues</th>
                                <th>Ticket#</th>
	                            <th>Assignee</th>
								<th>Status</th>
                            </thead>
                             <tbody>
                            	<c:forEach items="${tickets}" var="ticket">
                    			
                    			<tr>
	                            	<td><a href="/tickets/${ticket.id}">${ticket.name}</a></td>
 	                        		<td>${ticket.number}</td>
									<td>${ticket.assignee}</td>
									<td>${ticket.status}</td> 
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