<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
  src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
></script>
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
></script>
<meta charset="ISO-8859-1">
<title>Anonymous Feedback - View Feedback</title>
</head>
<body>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="index.html">Anonymous Feedback</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse"
      data-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent" aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item active ml-3"><a class="nav-link"
          href="index.html"
        >Home</a></li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active mx-3"><a class="nav-link"
          href="facultyLogin.jsp"
        >Log Out</a></li>
      </ul>
    </div>
  </nav>
  <div class="m-3">
    <%
    	Object name = request.getAttribute("name");
    	if (name != null) {
    %>
    <h1 class="display-4 mb-3">
      Hey, Professor
      <%=name%></h1>
    <%
    	}
    %>
    <hr />
    <div class="card mx-3 mt-4">
      <div class="card-header">Feedbacks</div>
    </div>
  </div>
  <div class="mx-5 mt-3">
    <%
    	String[] feedbacks = (String[]) request.getAttribute("feedbacks");
    	if (feedbacks.length == 0) {
    %>
    <div class="alert alert-danger alert-dismissible fade show"
      role="alert"
    >
      No feedbacks yet.
      <button type="button" class="close" data-dismiss="alert"
        aria-label="Close"
      >
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <%
    	} else {
    %>
    <c:forEach items="${feedbacks}" var="feedback">
      <div class="card my-2">
        <div class="card-body m-3 rounded">
          <p class="card-text">${feedback}</p>
        </div>
      </div>
    </c:forEach>
    <%
    	}
    %>
  </div>
</body>
</html>