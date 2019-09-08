<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<title>Anonymous Feedback - Student Login</title>
</head>
<body>
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
          href="facultyLogin.jsp"
        >Faculty Login</a></li>
      </ul>
    </div>
  </nav>
  <div class="m-3">
    <%
    	Object error = request.getAttribute("error");
    	if (error != null) {
    %>
    <div class="alert alert-warning alert-dismissible fade show"
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
    	}
    %>
  </div>
  <div class="container">
    <div class="row">
      <div class="col-sm-10 col-md-8 col-lg-6 col-xs-10 col-10 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body p-4">
            <h5 class="card-title text-center text-uppercase">Student
              Log In</h5>
            <form action="StudentLoginValidate" method="post">
              <div class="form-label-group">
                <label for="inputEmail">Email address</label> <input
                  type="email" id="inputEmail" class="form-control"
                  placeholder="Email address" name="email" required
                  autofocus required
                >
              </div>
              <div class="form-label-group my-3">
                <label for="inputPassword">Password</label> <input
                  type="password" id="inputPassword"
                  class="form-control" placeholder="Password"
                  name="password" required autofocus required
                >
              </div>
              <button
                class="btn btn-lg btn-primary btn-block text-uppercase"
                type="submit"
              >Log in</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>