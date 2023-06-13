<%-- 
    Document   : ScholarsViewPage
    Created on : 18 Apr, 2023, 12:22:09 PM
    Author     : Deepanshu
--%>

<%@page import="java.util.List"%>
<%@page import="com.uni.web.helper.ConnectionProvider"%>
<%@page import="com.uni.web.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- Bootstrap CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="js/bootstrap.bundle.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
	<%@include file="NormalNavbar.jsp" %>
	<%		UserDao userdao = new UserDao(ConnectionProvider.getConnection());
		List<User> allUsers = userdao.getAllUsers();
	%>
	<div class="container align-items-md-center text-center display-6">Our-Scholars</div>
	<div class="album py-5 bg-light">
	    <div class="container">

		<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
		    <% for (User user : allUsers) {%>

		    <div class="col">   
			<div class="card shadow-sm">
			   
				<img src="images/<%=user.getProfilePic()%>" class="mx-auto d-block  mt-sm-1 img-thumbnail m" style="width:250px;height:250px;" alt="Rounded Image" width="300" height="100">

				<div class="card-body">
				     <form action="UserDetailServlet" method="post">
				    <strong class="d-inline-block mb-2 text-primary"><%=user.getUserName()%></strong>
				    <input type="text" name="uid" value="<%=user.getUserName()%>" style="display:none"/>
				    <h3 class="mb-0"><%=user.getFirstName() + " " + user.getLastName()%></h3>
				    <p class="card-text"><%=user.getAbout()%></p>
				    <input type="submit" class="btn btn-primary" value="view"/>
				     </form>
				</div>

			</div>
		    </div>
		    <%}%>

		</div>
	    </div>
	</div>
	<%@include file="Footer.jsp" %>
    </body>
</html>

