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
<title>Anonymous Feedback - Give Feedback</title>
</head>
<body>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ page import="bean.Faculty"%>
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
        <li class="nav-item active mr-3"><a class="nav-link"
          href="studentLogin.jsp"
        >Log Out</a></li>
      </ul>
    </div>
  </nav>
  <div class="m-3">
    <%
    	Object success = request.getAttribute("success");
    	Object error = request.getAttribute("error");
    	if (error != null) {
    %>
    <div class="alert alert-danger alert-dismissible fade show"
      role="alert"
    >
      <%=error%>
      <button type="button" class="close" data-dismiss="alert"
        aria-label="Close"
      >
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <%
    	error = null;
    	} else if (success != null) {
    %>
    <div class="alert alert-success alert-dismissible fade show"
      role="alert"
    >
      <%=success%>
      <button type="button" class="close" data-dismiss="alert"
        aria-label="Close"
      >
        <span aria-hidden="true">&times;</span>
      </button>
    </div>
    <%
    	success = null;
    	}
    %>
  </div>
  <div class="m-5">
    <h1 class="text-center text-uppercase display-4">Give Feedback</h1>
    <form class="form" action="SubmitFeedback" method="post">
      <div class="form-group my-4">
        <select class="form-control" id="facultyDropdown" name="faculty"
          required
        >
          <c:forEach items="${facultyList}" var="faculty">
            <option value="${faculty.getEmail()}">${faculty.getName()}</option>
          </c:forEach>
        </select>
      </div>
      <div class="form-group my-4">
        <textarea class="form-control" id="feedback" name="feedback"
          rows="10" placeholder="Enter your feedback" required
        ></textarea>
      </div>
      <input type="text" class="d-none" name="department"
        value="${department}"
      >
      <button
        class="btn btn-primary btn-md col-lg-2 col-md-3 col-sm-4 col-xs-5 col-5"
        type="submit"
      >Submit Feedback</button>
    </form>
  </div>
</body>
</html>