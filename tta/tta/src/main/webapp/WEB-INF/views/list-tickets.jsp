<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>List of Tickets</title>
</head>

<body>

	<div class="container">

		
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">List of Tickets</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      
      <li class="nav-item">
      
      <c:url var="addUrl" value="/tickets/displayTicketsForm" />
      
        <a href="${addUrl}" class="nav-link" href="#">New Ticket</a>
      </li>
   
      
    </ul>

  </div>
</nav>
		
		
		<hr>
		
		<c:url var="searchUrl" value="/tickets/search" />
		<form action="${searchUrl}" class="form-inline">
		
		  <input type="search" name="title" placeholder="Ticket Title"
		    class="form-control-md mb-3" /> 
		  
		
		  <button type="submit" class="btn btn-primary btn-sm mb-3">
		    Search
		  </button>
		</form>  


		<table class="table table-bordered table-striped">
			<thead class="thead-dark">
				<tr>
					<th>#</th>
					<th>Ticket Title</th>
					<th>Ticket Short Description</th>
					<th>Ticket Created on</th>
					<th>Actions</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${tickets}" var="ticketObj">
					<tr>
						<td><c:out value="${ticketObj.id}" /></td>
						<td><c:out value="${ticketObj.title}" /></td>
						<td><c:out value="${ticketObj.description}" /></td>
						<td><c:out value="${ticketObj.createdOn}" /></td>

						<td>
							<!-- Add "update" button/link --> <c:url var="updateUrl"
								value="/tickets/displayTicketForm_Update?ticketId=${ticketObj.id}" />
							<a href="${updateUrl}" class="btn btn-primary btn-sm"> Edit </a> <!-- Add "delete" button/link -->
							<c:url var="deleteUrl"
								value="/tickets/delete?ticketId=${ticketObj.id}" /> <a
							href="${deleteUrl}" class="btn btn-danger btn-sm"
							onclick="if (!(confirm('Are you sure you want to delete this Ticket?'))) return false">
								Delete </a>
								
							<c:url var="viewUrl"
								value="/tickets/displayTicketForm_View?ticketId=${ticketObj.id}" />
							<a href="${viewUrl}" class="btn btn-info btn-sm"> view </a>

						</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>

	</div>

</body>

</html>