<%-- 
    Document   : HomePage
    Created on : 18 Apr, 2023, 12:20:28 AM
    Author     : Deepanshu
--%>

<%@page import="com.uni.web.dao.UserDao"%>
<%@page import="com.uni.web.helper.ConnectionProvider"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
        UserDao users = new UserDao(ConnectionProvider.getConnection());
        List<User> userList = users.getAllUsers();
%>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.4/font/bootstrap-icons.css">

        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" >
        <style>

            .my-custom-scrollbar {
                position: relative;
                height: 400px;
                overflow: auto;
            }

            .table-wrapper-scroll-y {
                display: block;
            }
            h1, h2, h3, h4, h5, h6 {
                font-family: "Playfair Display", Georgia, "Times New Roman", serif/*rtl:Amiri, Georgia, "Times New Roman", serif*/;
            }


        </style>
        <title>Home Page</title>
    </head>
    <body>
        <%@include file="NormalNavbar.jsp" %>
        <main>
            <div class="p-5 mb-1 bg-light bg- bg-opacity-10">
                <div class="col-auto d-none d-lg-block float-end">
                    <img src="css/1.png" class=" img-fluid" alt="Rounded Image" >

                </div>
                <div class="col-6 mx-5">

                    <h1 class="display-6">Department of Computer Science &amp; IT</h1>
                    <p class="lead my-3">

                        The Department of Computer Science & IT Started in the University of Jammu with the initation of Diploma Course in computer science and applications in the year, 1987. The department started 3 years MCA (Six Semester) Course from the year, 1995. The MCA course is standardized and is representing 30 courses, five practical courses and one real life project be undertaken by the VIth Semester students in the reputed industries / institutions.


                    </p>

                    <button class="btn bg-primary text-light" type="submit"><i class="bi bi-box-arrow-in-left"></i>  LOGIN</button>
                    <button class="btn bg-primary text-light " type="submit"><span class="bi bi-person-fill-add "></span>  REGISTER</button>

                </div>
            </div>
            <div class="container align-items-md-center text-center display-6">Scholars</div>
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <% for (User user : userList) {%>
                    <div class="carousel-item " data-bs-interval="2000">
                        <div class="container ">
                            <div class="col-8 ms-5">
                                <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                    <div class="col p-4 d-flex flex-column position-static ms-5">
                                        <form action="UserDetailServlet" method="post">
                                            <strong class="d-inline-block mb-2 text-primary"><%=user.getUserName()%></strong>
                                            <input type="text" name="uid"value="<%=user.getUserName()%>" style="display:none">
                                            <h3 class="mb-0"><%=user.getFirstName() + " " + user.getLastName()%></h3>

                                            <p class="card-text mb-auto"><%=user.getAbout()%></p>
                                            <input type="submit" class="btn btn-primary" value="View-More">
                                        </form>
                                    </div>
                                    <div class="col-auto d-none d-lg-block">
                                        <img src="images/<%=user.getProfilePic()%>" class="mx-auto d-block  mt-sm-1 img-thumbnail m" style="width:250px;height:250px;" alt="Rounded Image" width="300" height="100">
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <%}%>

                    <div class="carousel-item active" data-bs-interval="2000">
                        <div class="container">
                            <div class="row mb-2">
                                <div class="col-md-6">
                                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                                        <div class="col p-4 d-flex flex-column position-static">
                                            <strong class="d-inline-block mb-2 text-primary">World</strong>
                                            <h3 class="mb-0">Featured post</h3>
                                            <div class="mb-1 text-muted">Nov 12</div>
                                            <p class="card-text mb-auto">This is a wider card with supporting text below as a natural lead-in to additional content.</p>
                                            <a href="#" class="stretched-link">Continue reading</a>
                                        </div>
                                        <div class="col-auto d-none d-lg-block">
                                            <svg class="bd-placeholder-img" width="200" height="250" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"></rect><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>

                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon btn-danger" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                    <span class="carousel-control-next-icon btn-danger" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>






        </main>
        <%@include file="Footer.jsp" %>
    </body>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/OtherPages/BasicDetail.js"></script>

</html>
