<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
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

<title>Save Ticket</title>
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
      
      
      
      <!--  <c:url var="addUrl" value="/tickets/displayTicketsForm" />
       <a href="${addUrl}" class="nav-link" >New Ticket</a>  -->
        
           <c:choose>
                <c:when test="${mode == 'new'}">
                   <a href="#" class="nav-link" > New Ticket </a>
                </c:when>
                <c:when test="${mode == 'edit'}">
                    <a href="#" class="nav-link" > Edit Ticket </a>
                </c:when>
                <c:when test="${mode == 'view'}">
                   <a href="#" class="nav-link" >  View Ticket </a>
                </c:when>
            </c:choose>
      </li>
      
      <li class="nav-item">
      
     <c:url var="listUrl" value="/tickets/list" />

    	<a href="${listUrl}" class="nav-link">Back to Tickets List</a>
      </li>
   
      
    </ul>

  </div>
</nav>
    <hr>

    <p class="h4 mb-4">Tickets Details</p>

    <c:url var="saveUrl" value="/tickets/save" />

    <form action="${saveUrl}" method="POST">

      <!-- Add hidden form field to handle update -->
      <input type="hidden" name="id" value="${tickets.id}" <c:if test="${mode == 'view'}">readonly</c:if>  />
		
		<p class="font-weight-bold">Title</p>
      <div class="form-inline">
        <input type="text" name="title" value="${tickets.title}"
          class="form-control mb-4 col-4" placeholder="Ticket Title" <c:if test="${mode == 'view'}">readonly</c:if>  />
      </div>

		<p class="font-weight-bold mt-2">Short Description</p>
      <div class="form-inline">
        <textarea name="description"
          class="form-control mb-4 col-4" placeholder="Ticket Description" <c:if test="${mode == 'view'}">readonly</c:if>  >${tickets.description}</textarea>
      </div>
      
      	<p class="font-weight-bold mt-2">Content</p>
      <div class="form-inline">
        <textarea name="content"
          class="form-control mb-4 col-4" placeholder="Ticket Description" <c:if test="${mode == 'view'}">readonly</c:if>  >${tickets.content}</textarea>
      </div>

 	 <div class="form-inline">
        <input type="hidden" name="createdOn" value="${tickets.createdOn != null ? tickets.createdOn : ''}" class="form-control mb-4 col-4" />
      </div>

      
      
       <c:choose>
                <c:when test="${mode == 'new'}">
                   <button type="submit" class="btn btn-primary col-2">Create</button>
                </c:when>
                <c:when test="${mode == 'edit'}">
                    <button type="submit" class="btn btn-primary col-2">Save</button>
                </c:when>
                <c:when test="${mode == 'view'}">
                    
                </c:when>
            </c:choose>

    </form>

    <hr>
    

  </div>
</body>

</html>  