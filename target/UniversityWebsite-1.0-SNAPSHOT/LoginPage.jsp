<%-- 
    Document   : LoginPage
    Created on : 18 Apr, 2023, 3:19:15 AM
    Author     : Deepanshu
--%>

<%@page import="com.uni.web.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
	<!-- Required meta tags -->
	<style>
	    .divider:after,
.divider:before {
content: "";
flex: 1;
height: 1px;
background: #eee;
}
.h-custom {
height: calc(100% - 73px);
}
@media (max-width: 450px) {
.h-custom {
height: 100%;
}
}

	    </style>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Bootstrap CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="js/bootstrap.bundle.min.js"></script>

	<title>LoginPage</title>
    </head>
    <body>
	<%@include file="NormalNavbar.jsp" %>
	<section class="vh-100 bg-light">
	    <div class="container-fluid h-custom">
		<div class="row d-flex justify-content-center align-items-center h-100">
		    <div class="col-md-9 col-lg-6 col-xl-5">
			<img src="css/JammuUni.jpg"
			     class="img-fluid rounded rounded-3 shadow shadow-lg" alt="Sample image">
		    </div>
		    <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
			<form action="LoginServlet" method="post">
			    <%
			    Message m = (Message) session.getAttribute("msg");
			    if(m!=null){
			    %>
			<div class="alert <%= m.getCssClass() %>" role="alert">
<%= m.getContent() %>
</div>  <%
	session.removeAttribute("msg");
	}

%>  
			    <!-- Email input -->
			    <div class="form-outline mb-4">
				<input type="text"  name="uid" id="form3Example3" class="form-control form-control-lg"
				       placeholder="Enter UID" />
				
			    </div>

			    <!-- Password input -->
			    <div class="form-outline mb-3">
				<input type="password" id="form3Example4" class="form-control form-control-lg"
				       placeholder="Enter password" name="password" />
				
			    </div>

			    <div class="d-flex justify-content-between align-items-center">
				<!-- Checkbox -->
				<div class="form-check mb-0">
				    <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3" />
				    <label class="form-check-label" for="form2Example3">
					Remember me
				    </label>
				</div>
				<a href="#!" class="text-body">Forgot password?</a>
			    </div>

			    <div class="text-center text-lg-start mt-4 pt-2">
				<input type="submit" class="btn btn-primary btn-lg"
					style="padding-left: 2.5rem; padding-right: 2.5rem;">
				<p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="SignupPage.jsp"
												  class="link-danger">Register</a></p>
			    </div>

			</form>
		    </div>
		</div>
	    </div>

	  
	</div>
    </section>

    <%@include file="Footer.jsp" %>
</body>
</html>
