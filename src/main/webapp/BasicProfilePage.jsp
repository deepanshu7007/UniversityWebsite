

<%@page import="com.uni.web.dao.FdpDao"%>
<%@page import="com.uni.web.dao.WorkshopDao"%>
<%@page import="com.uni.web.dao.ConferenceDao"%>
<%@page import="com.uni.web.dao.UserDao"%>
<%@page import="com.uni.web.entities.Supervisor"%>
<%@page import="com.uni.web.entities.Exam"%>
<%@page import="com.uni.web.entities.Degree"%>
<%@page import="com.uni.web.dao.UpdateBasicDao"%>
<%@page import="com.uni.web.dao.PatentDao"%>
<%@page import="com.uni.web.entities.userdetail.Patent"%>
<%@page import="com.uni.web.entities.userdetail.Publication"%>
<%@page import="com.uni.web.dao.PublicationDao"%>
<%@page import="com.uni.web.helper.ConnectionProvider"%>


<%@page import="com.uni.web.entities.userdetail.FDP"%>
<%@page import="com.uni.web.entities.userdetail.Workshop"%>
<%@page import="com.uni.web.entities.userdetail.Conference"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.uni.web.entities.BasicDetails"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="js/bootstrap.bundle.min.js"></script>
        <title>JSP Page</title>
        <style>
            .anyClass {
                height:500px;
                overflow-y: scroll;
            }
        </style>
        <style>
            .no-select {
                -webkit-user-select: none; /* Safari */
                -moz-user-select: none; /* Firefox */
                -ms-user-select: none; /* IE 10+ */
                user-select: none;
            }
        </style>

        <script src="https://code.jquery.com/jquery-3.6.4.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function ()
            {
                console.log("loaded...........");

                $('#profileform').on('submit', function (event)
                {
                    event.preventDefault();
//                       $("submitBtn").hide();
//		       $("#loader").show();
                    let form = new FormData(this);
                    $.ajax({
                        url: "UpdateProfileServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR)
                        {
                            console.log("successfully submitted");


                            if (data.trim() === 'Successful')
                            {
                                swal("User successfully updated");
                            } else
                            {

                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {
                            console.log(jqXHR);
                            swal("Error", "Something went wrong", "error");
                        }, processData: false,
                        contentType: false
                    });



                });

                $('#imageform').on('submit', function (event)
                {
                    event.preventDefault();
                    let form = new FormData(this);
                    $.ajax({
                        url: "ImageServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR)
                        {
                            console.log("successfully submitted");


                            if (data.trim() === 'Successful')
                            {
                                swal("User successfully updated");
                            } else
                            {

                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown)
                        {
                            console.log(jqXHR);
                            swal("Error", "Something went wrong", "error");
                        }, processData: false,
                        contentType: false
                    });



                });


            });
            $('#imageInput').change(function () {
                var file = this.files[0];
                var image = new Image();

                image.onload = function () {
                    var expectedWidth = 400; // Change this to the desired width
                    var expectedHeight = 300; // Change this to the desired height

                    if (image.naturalWidth === expectedWidth && image.naturalHeight === expectedHeight) {
                        // Image dimensions are valid, now check the file type
                        var allowedTypes = ['image/jpeg', 'image/png', 'image/gif']; // Allowed file types
                        if (allowedTypes.includes(file.type)) {
                            console.log('Image dimensions and file type are valid.');
                            // Perform further actions if the dimensions and file type are valid
                        } else {
                            console.log('Invalid file type. Please select a valid image file.');
                            // Display an error message or take appropriate action
                        }
                    } else {
                        console.log('Image dimensions are invalid.');
                        // Display an error message or take appropriate action
                    }
                };

                image.src = URL.createObjectURL(file);
            });



        </script>
    </head>

    <body>
        <%@include file="NormalNavbar.jsp" %>
        <%		User userSession = null;
            try {
                userSession = (User) session.getAttribute("currentUser");
            } catch (Exception exp) {
                exp.printStackTrace();
            }
            String uid = request.getParameter("q");
            UserDao ubd = new UserDao(ConnectionProvider.getConnection());
            User activeUser = ubd.getActiveUser(uid);
        %><%
            if (activeUser == null) {
                activeUser = userSession;
            }
            BasicDetails bd = new UpdateBasicDao(ConnectionProvider.getConnection()).GetBasicProfile(uid);
            ConferenceDao conferencedao = new ConferenceDao(ConnectionProvider.getConnection());
            WorkshopDao workshopdao = new WorkshopDao(ConnectionProvider.getConnection());
            FdpDao fdpdao = new FdpDao(ConnectionProvider.getConnection());
            ArrayList<Conference> listOfConference = conferencedao.getConference(uid);
            ArrayList<Workshop> listOfWorkshop = workshopdao.getWorkshop(uid);
            ArrayList<FDP> listOfFdp = fdpdao.getFdp(uid);
            ArrayList<Publication> listOfPublication = new PublicationDao(ConnectionProvider.getConnection()).getPublication(uid);
            ArrayList<Patent> listOfPatent = new PatentDao(ConnectionProvider.getConnection()).getPatent(uid);
        %>

        <h1 class="display-6 mb-3 ms-5"><%=activeUser.getRole()%> Details</h1>
        <div class="container mt-3">
            <div class="row">
                <div class="col">


                    <form id="profileform" action="UpdateProfileServlet" method="POST" enctype="multipart/form-data">
                        <div class="container-fluid">
                            <div class="row ">
                                <div class="col">
                                    <div class="card" style="width: 30rem;">
                                        <input type="text" style="display:none" value="<%=activeUser.getUserName()%>"  name="previousUname">
                                        <img
                                            src="images/<%=activeUser.getProfilePic()%>"
                                            class="mx-auto d-block rounded-circle mt-sm-1 img-fluid"
                                            alt="Rounded Image"
                                            width="200"
                                            height="200"
                                            >
                                        <div class="card-body ">
                                            <h5 class="card-title text-sm-center m-0">Profile</h5>
                                        </div>
                                        <ul class="list-group list-group-item border-0 align-items-center">
                                            <li class="list-group-item">
                                                <div class="input-group mb-0">
                                                    <input name="firstName" type="text" class="form-control" placeholder="first-name" aria-label="Username" value="<%= activeUser.getFirstName()%>">
                                                    <input type="text" name="lastName"class="form-control" placeholder="last-name" aria-label="Server" value="<%= activeUser.getLastName()%>">
                                                </div>
                                            </li>
                                            <li class="list-group-item">

                                                <div class="input-group mb-0">
                                                    <input type="text" class="form-control" placeholder="E-mail" name="eMail"aria-label="Username" value="<%= activeUser.getEmail()%>">
                                                    <input type="text" class="form-control" placeholder="UID" aria-label="Server" name="uId" value="<%=activeUser.getUserName()%>">
                                                </div>
                                            </li>
                                            <li class="list-group-item">
                                                <input
                                                    type="date"
                                                    class="form-control"
                                                    value = "<%=activeUser.getDateOfBirth()%>"
                                                    name="dateOfBirth"
                                                    >
                                            </li>
                                            <li class="list-group-item">
                                                <textarea
                                                    type="text"
                                                    class="form-control"
                                                    style="height:5rem"
                                                    placeholder="About"
                                                    name="about"
                                                    ><%=activeUser.getAbout()%></textarea>
                                            </li>


                                        </ul>
                                        <% 	if (userSession != null && activeUser.getUserName().equals(userSession.getUserName())) {%>
                                        <input type="submit" class="btn btn-primary m-sm-0 " value="Save info">
                                        </form><!-- comment -->
                                        <form id="imageform" action="ImageServlet" method="post" enctype="multipart/form-data">
                                            <ul class="card-body m-sm-0">
                                                <li class="list-group-item">
                                                    <input
                                                        type="file"
                                                        class=""
                                                        style="height:2rem"
                                                        name="image"
                                                        value="<%=activeUser.getProfilePic()%>"/>
                                                    <%System.out.println("Hello world this is" + activeUser.getProfilePic());%>
                                                </li>
                                                <input type="submit" class="btn btn-primary m-sm-0 " value="Save image">
                                            </ul>
                                            <%}%>
                                    </div>
                                </div>
                                </form>






                                <div class="col anyClass">
                                    <table class="table table-hover table-bordered scrollspy-example-2" tabindex="0">
                                        <thead class="table-primary">
                                            <tr>
                                                <th scope="col">Details</th>
                                                <th colspan="2" scope="col"></th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td colspan="2">Supervisor</td>
                                                <th scope="row"><%= bd.getSupervisor()%></th>

                                            </tr>
                                            <tr>
                                                <td colspan="2">Co-Supervisor</td>
                                                <th scope="row"><%= bd.getCosupervisor()%></th>

                                            </tr>
                                            <tr>
                                                <td colspan="2">Registration Date</td>
                                                <th scope="row"><%= bd.getReg_date()%></th>

                                            </tr>
                                            <tr>
                                                <td colspan="2">Thesis</td>
                                                <th scope="row"><%= bd.getThesisTitle()%></th>

                                            </tr>
                                            <tr>
                                                <td colspan="2">Ph.D. Presentation Date</td>
                                                <th scope="row"><%= bd.getPrePresentation()%></th>

                                            </tr>
                                            <tr>
                                                <td colspan="2">Ph.D. Awarded</td>
                                                <th scope="row"><%= bd.getPhdAwarded()%></th>

                                            </tr>
                                            <tr>
                                                <td colspan="2">Google scholar</td>
                                                <th scope="row"><a href="<%= bd.getLink()%>">click here</a></th>

                                            </tr>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                </div>
            </div>
            <div class="row no-select">
                <div class="container-fluid">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">

                            <button class="nav-link active" id="nav-publication-tab" data-bs-toggle="tab" data-bs-target="#nav-publication" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Publication</button>
                            <button class="nav-link" id="nav-patents-tab" data-bs-toggle="tab" data-bs-target="#nav-patents" type="button" role="tab" aria-controls="nav-patent" aria-selected="false" >Patents</button>
                            <button class="nav-link" id="nav-conference-tab" data-bs-toggle="tab" data-bs-target="#nav-conference" type="button" role="tab" aria-controls="nav-conference" aria-selected="false" >Conference</button>
                            <button class="nav-link" id="nav-workshop-tab" data-bs-toggle="tab" data-bs-target="#nav-workshop" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Workshop</button>
                            <button class="nav-link" id="nav-fdp-tab" data-bs-toggle="tab" data-bs-target="#nav-fdp" type="button" role="tab" aria-controls="nav-fdp" aria-selected="false">F.D.P</button>
                            <button class="nav-link" id="nav-workdetail-tab" data-bs-toggle="tab" data-bs-target="#workdetail" type="button" role="tab" aria-controls="nav-workdetail" aria-selected="false">workdetail</button>

                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">
                        <div class="tab-pane fade active show" id="nav-publication" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                            <div class="col anyClass ">
                                <div class="modal-body">
                                    <table class="table" id="sciTable" name="sciTable">
                                        <thead>
                                            <tr>
                                                <th scope="col">DOI number</th>
                                                <th scope="col">Paper name</th>
                                                <th scope="col">Author</th>
                                                <th scope="col">Citation</th>
                                                <th scope="col">Indexing</th>

                                            </tr>
                                        </thead>
                                        <tbody>

                                            <%
                                                for (Publication publication : listOfPublication) {
                                            %>
                                            <tr>
                                                <td><%= publication.getDoiNumber()%></td>
                                                <td> <%= publication.getTitle()%></td>
                                                <td><%= publication.getAuthorName()%></td>
                                                <td><%= publication.getCitation()%></td>
                                                <td><%if (publication.isESI()) {%>ESI<%}%>
                                                    <%if (publication.isSCI()) { %>SCI <%}%>
                                                    <%if (publication.isScopus()) {%>SCOPUS<%}%>
                                                    <%if (publication.isPeerpaper()) {%>PEERPAPER<%}%>
                                                    <%if (publication.isOther()) {%>OTHER<%}%></td>
                                            </tr>
                                            <%
                                                }
                                            %>

                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane fade" id="nav-patents" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                            <div class="col anyClass ">
                                <div class="modal-body">
                                    <table class="table" id="patentTable" name="patentTable">
                                        <thead>
                                            <tr>
                                                <th scope="col">PATENT ID</th>
                                                <th scope="col">PATENT TITLE</th>
                                                <th scope="col">DATE OF GRANT</th>
                                                <th scope="col">DATE OF PUBLICATION</th>
                                                <th scope="col">AUTHOR</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (Patent patent : listOfPatent) {%>
                                            <tr>
                                                <td><%=patent.getPatentId()%></td>
                                                <td><%=patent.getPatentTitle()%></td>
                                                <td><%=patent.getGrandDate()%></td>
                                                <td><%=patent.getPublishDate()%></td>
                                                <td><%=patent.getAuthorName()%></td>
                                            </tr>

                                            <%} %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane fade " id="nav-conference" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                            <div class="col anyClass ">
                                <div class="modal-body">
                                    <table class="table" id="sciTable" name="sciTable">
                                        <thead>
                                            <tr>
                                                <th scope="col">Conference Code</th>
                                                <th scope="col">Conference Name</th>
                                                <th scope="col">Conference Location</th>
                                                <th scope="col">Conference Date</th>
                                                <th scope="col">Conference Others</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (Conference conference : listOfConference) {%>
                                            <tr>
                                                <td><%= conference.getConferenceAlias()%></td>
                                                <td><%= conference.getConferenceName()%></td>
                                                <td><%= conference.getConferenceLocation()%></td>
                                                <td><%= conference.getConferenceDate()%></td>
                                                <td><%= conference.getConferenceOther()%></td>
                                            </tr>

                                            <%} %>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane fade " id="nav-workshop" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                            <div class="col anyClass ">
                                <div class="modal-body">
                                    <table class="table" id="sciTable" name="sciTable">
                                        <thead>
                                            <tr>
                                                <th scope="col">WORKSHOP_ID</th>
                                                <th scope="col">WORKSHOP_NAME</th>
                                                <th scope="col">WORKSHOP_TOPIC</th>
                                                <th scope="col">WORKSHOP_ORGANISER</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (Workshop workshop : listOfWorkshop) {%>
                                            <tr>
                                                <td><%= workshop.getWorkshopAlias()%></td>
                                                <td><%= workshop.getWorkshopName()%></td>
                                                <td><%= workshop.getWorkshopTopic()%></td>
                                                <td><%= workshop.getWorkshopOrganiser()%></td>
                                                <td><button class="btn btn-primary" value="view">VIEW</button></td>
                                            </tr>
                                            <%} %>


                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>

                        <div class="tab-pane fade " id="nav-fdp" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                            <div class="col anyClass ">
                                <div class="modal-body">
                                    <table class="table" id="sciTable" name="sciTable">
                                        <thead>
                                            <tr>
                                                <th scope="col">FDP-CODE</th>
                                                <th scope="col">FDP-NAME</th>
                                                <th scope="col">FDP-THEME</th>
                                                <th scope="col">FDP-OUTCOME</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% for (FDP fdp : listOfFdp) {%>
                                            <tr>
                                                <td><%=fdp.getFdpAlias()%></td>
                                                <td><%=fdp.getFdpName()%></td>
                                                <td><%=fdp.getFdpTheme()%></td>
                                                <td><%=fdp.getFdpOutcome()%></td>
                                                <td><button class="btn btn-primary" value="view">VIEW</button></td>

                                            </tr>
                                            <%}%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                        <div class="tab-pane fade " id="workdetail" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                            <div class="col anyClass ">
                                <div class="modal-body">
                                    <div class="embed-responsive embed-responsive-16by9 no-select">
                                        <iframe class="embed-responsive-item " src="workdetail/<%=bd.getWorkdetail()%>" frameborder="0" width="100%" height="500"></iframe>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="Footer.jsp" %>
    </body>

</html>
