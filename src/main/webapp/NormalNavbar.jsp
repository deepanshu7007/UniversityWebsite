<%-- 
    Document   : index
    Created on : 17 Apr, 2023, 11:52:11 PM
    Author     : Deepanshu
--%>

<%@page import="com.uni.web.entities.User"%>
<%@page errorPage="ErrorPage.jsp"%>
<%
	User userName = (User) session.getAttribute("currentUser");

//	if(userName == null)
//	{
//		response.sendRedirect("HomePage.jsp");
//	}
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid ">
	<img src="css/1.png" width="30" height="30" alt="">
	<a class="navbar-brand ms-3" href="HomePage.jsp">University of Jammu</a>
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavDropdown">
	    <ul class="navbar-nav ms-auto">
		<li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="HomePage.jsp"><i class="bi bi-house"></i>Home</a>
		</li>
		<li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			Scholars
		    </a>
		    <ul class="dropdown-menu">
			<li><a class="dropdown-item" href="ScholarsViewPage.jsp">View</a></li>

		    </ul>
		</li>
		<li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
			Research
		    </a>
		    <ul class="dropdown-menu">
			<li><a class="dropdown-item" href="AIPage.jsp">AI</a></li>
			<li><a class="dropdown-item" href="MachineLearning.jsp">Machine Learning</a></li>
			<li><a class="dropdown-item" href="DeepLearningPage.jsp">Deep Learning</a></li>
			<li><a class="dropdown-item" href="ComputerVision.jsp">Computer Vision</a></li>
		    </ul>
		</li>
		<li class="nav-item">
		    <a class="nav-link" href="GalleryPage.jsp">Gallery</a>
		</li>

		<li class="nav-item">
		    <a class="nav-link" href="#">About</a>
		</li>
		<%	if (userName != null) {
		%>
		<li class="nav-item dropdown">
                    <a class="btn btn-primary" href="BasicProfilePage.jsp?q=<%=userName.getUserName() %>" role="button"><%= userName.getFirstName() +" "+ userName.getLastName()%></a>
		    
		    <button type="button" class="btn btn-primary btn-sm dropdown-toggle dropdown-toggle-split" data-bs-toggle="dropdown" aria-expanded="false">
			<span class="visually-hidden">All menu</span>
		    </button>
		    <ul class="dropdown-menu" id="dropdown-menu">
			<li><a class="dropdown-item" href="ProfilePage.jsp">Profile</a></li>
			<li><hr class="dropdown-divider"></li>
			<li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
		    </ul>
		</li>

	
		    </div>


		    <%
		    } else {

		    %>
		    <li class="nav-item"><a  class="nav-link" href="LoginPage.jsp">Login</a></li>
		    <li class="nav-item"><a  class="nav-link" href="SignupPage.jsp">Sign-up</a></li>
			<%	}
			%>

	    </ul>
	</div>
    </div>
</nav>