
<%@page import="com.uni.web.entities.BasicDetails"%>

<%@page import="com.uni.web.entities.Supervisor"%>
<%@page import="com.uni.web.entities.Exam"%>
<%@page import="com.uni.web.entities.Degree"%>
<%@page import="com.uni.web.dao.UpdateBasicDao"%>
<%@page import="com.uni.web.entities.userdetail.Publication"%>
<%@page import="com.uni.web.dao.PublicationDao"%>
<%-- 
    Document   : ProfilePage
    Created on : 19 Apr, 2023, 6:54:18 AM
    Author     : Deepanshu
--%>
<%@page import="com.uni.web.helper.ConnectionProvider"%>
<%@page import="com.uni.web.entities.User"%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <link
            href="css/bootstrap.min.css"
            rel="stylesheet"
            >
        <script src="https://code.jquery.com/jquery-3.6.4.js"></script>

        <title>ProfilePage</title>
    </head>
    <body>
        <%@include file="NormalNavbar.jsp" %>
        <% ConnectionProvider cp = new ConnectionProvider();
                String url = cp.getConnectionUrl();
                String password = cp.getPassword();
                String user = cp.getUser();
                String driver = cp.getDriverName();
                String database = cp.getDatabase();
                User activeuser = (User) session.getAttribute("currentUser");
                UpdateBasicDao basicDao = new UpdateBasicDao(ConnectionProvider.getConnection());
                ArrayList<Degree> listOfDegree = basicDao.getListOfDegree(activeuser.getUserName());
                ArrayList<Exam> listOfExam = basicDao.getListOfExam(activeuser.getUserName());
                ArrayList<Supervisor> listOfSupervisor = basicDao.getListOfSupervisor(activeuser.getUserName());
                BasicDetails bd = basicDao.GetBasicProfile(activeuser.getUserName());
        %>
        <div class="container-fluid">
            <nav>
                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                    <button class="nav-link active" id="nav-basicdetails-tab" data-bs-toggle="tab" data-bs-target="#nav-basicdetails" type="button" role="tab" aria-controls="nav-details" aria-selected="false" >Basic Details</button>
                    <button class="nav-link " id="nav-publication-tab" data-bs-toggle="tab" data-bs-target="#nav-publication" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Publication</button>
                    <button class="nav-link" id="nav-patents-tab" data-bs-toggle="tab" data-bs-target="#nav-patents" type="button" role="tab" aria-controls="nav-disabled" aria-selected="false" >Patents</button>
                    <button class="nav-link" id="nav-conference-tab" data-bs-toggle="tab" data-bs-target="#nav-conference" type="button" role="tab" aria-controls="nav-disabled" aria-selected="false" >Conference</button>
                    <button class="nav-link" id="nav-workshop-tab" data-bs-toggle="tab" data-bs-target="#nav-workshop" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Workshop</button>
                    <button class="nav-link" id="nav-fdp-tab" data-bs-toggle="tab" data-bs-target="#nav-fdp" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">F.D.P</button>
                    <button class="nav-link" id="workdetail-tab" data-bs-toggle="tab" data-bs-target="#workdetail" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Workdetail</button>

                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade " id="nav-publication" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                    <div class="col anyClass ">
                        <%@include file="Test/Publications.jsp" %>
                    </div>
                </div>
                <div class="tab-pane fade" id="nav-fdp" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">
                    <div class="col anyClass ">
                        <%@include file="Test/Fdp.jsp" %>

                    </div></div>
                <div class="tab-pane fade" id="nav-workshop" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0"><div class="col anyClass ">
                        <%@include file="Test/Workshop.jsp" %>

                    </div></div>
                <div class="tab-pane fade" id="nav-conference" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0"><div class="col anyClass ">
                        <%@include file="Test/Conference.jsp" %>
                    </div>
                </div>
                <div class="tab-pane fade active show" id="nav-basicdetails" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0">
                    <div class="col">
                        <div class="row">
                            <h4 class="display-5">Enter Scholars Details</h4>
                            <hr>

                            <form id="basicDetailsForm"  id="basicDetailsForm" action="BasicDetailServlet" method="post">
                                <div class="col border border-2">
                                    <div class="row g-3">
                                        <div class="col-sm-8">
                                            <label for="firstName" class="form-label"
                                                   >Supervisor-name
                                            </label>

                                            <select
                                                class="form-select"
                                                name="SuperVisor"
                                                id="SuperVisor"
                                                >



                                                <option value="none" selected disabled hidden>

                                                    Select Supervisor

                                                </option>
                                                <%for (Supervisor supervisor : listOfSupervisor) {%>
                                                <%System.out.println(supervisor.isActive());%>
                                                <option value="<%=supervisor.getSUP_ID()%>" <% if (supervisor.isActive()) {%> selected <%}%>><%=supervisor.getFirstName()+"    "+supervisor.getLastName() %></option>
                                                <%}%>
                                            </select>
                                            <div class="invalid-feedback">Supervisor name is required</div>
                                        </div>
                                        <div class="col-sm-4">
                                            <label for="lastName" class="form-label"
                                                   >Select Co-supervisor
                                            </label>
                                            <!-- Button trigger modal -->
                                            <button
                                                type="button"
                                                class="btn btn-primary"
                                                data-bs-toggle="modal"
                                                data-bs-target="#coSupervisorModal"
                                                >
                                                Co-Supervisor
                                            </button>
                                            <!-- Modal -->
                                            <div
                                                class="modal fade"
                                                id="coSupervisorModal"
                                                tabindex="-1"
                                                aria-labelledby="exampleModalLabel"
                                                aria-hidden="true"
                                                >
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="exampleModalLabel">
                                                                Enter Details for Co-Supervisor
                                                            </h5>
                                                            <button
                                                                type="button"
                                                                class="btn-close"
                                                                data-bs-dismiss="modal"
                                                                aria-label="Close"
                                                                ></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="container">
                                                                <div class="row">
                                                                    <div class="col">
                                                                        <div class="mb-3">
                                                                            <label
                                                                                for="exampleInputEmail1"
                                                                                class="form-label"
                                                                                >Name
                                                                            </label>
                                                                            <input
                                                                                type="text"
                                                                                name="FIRST_NAME"
                                                                                class="form-control"
                                                                                id="nameCoSuper"
                                                                                aria-describedby="emailHelp"
                                                                                value="<%=bd.getCosupervisor()%>"
                                                                                />
                                                                            <div class="mb-3">
                                                                                <label
                                                                                    for="exampleInputEmail1"
                                                                                    class="form-label"
                                                                                    >Phone No.
                                                                                </label>
                                                                                <input
                                                                                    type="text"
                                                                                    name="CONTACT"
                                                                                    class="form-control"
                                                                                    id="phoneCoSuper"
                                                                                    aria-describedby="emailHelp"
                                                                                    />
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col">
                                                                        <div class="mb-3">
                                                                            <label
                                                                                for="exampleInputEmail1"
                                                                                class="form-label"
                                                                                >Affiliation
                                                                            </label>
                                                                            <input
                                                                                type="text"
                                                                                class="form-control"
                                                                                name="AFFILIATION"
                                                                                id="affiliationCoSuper"
                                                                                aria-describedby="emailHelp"
                                                                                />
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button
                                                                type="button"
                                                                class="btn btn-secondary"
                                                                data-bs-dismiss="modal"
                                                                >
                                                                Close
                                                            </button>
                                                            <button type="button" data-bs-dismiss="modal" class="btn btn-primary">
                                                                Save changes
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="firstName" class="form-label">P.G. Degree</label>
                                            <select
                                                class="form-select"
                                                id="firstName"
                                                name="Degree"
                                                id="Degree"
                                                >
                                                <option value="<na>" selected disabled hidden>
                                                    Select an Option
                                                </option>
                                                <%for (Degree degree : listOfDegree) {%>
                                                <option value="<%=degree.getDegreeId()%>" <% if (degree.getActive()) {%> selected <%}%>><%=degree.getDegreeName()%></option>
                                                <%}%>
                                            </select>
                                            <div class="invalid-feedback">Supervisor name is required</div>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="lastName" class="form-label"
                                                   >Registration Date
                                            </label>
                                            <input
                                                type="date"
                                                class="form-control"
                                                id="lastName"
                                                placeholder=""
                                                <% if (bd.getReg_date() == null) { %> value=""<%} else {%>value=<%=bd.getReg_date()%> <% }%>
                                                required=""
                                                name="REG_DATE"
                                                />
                                            <div class="invalid-feedback">Valid last name is required.</div>
                                        </div>
                                        <div class="col-sm-6">
                                            <label for="firstName" class="form-label">Exam Quaified</label>
                                            <div
                                                class="btn-group"
                                                role="group"
                                                aria-label="Basic checkbox toggle button group"
                                                >

                                                
                                                <input
                                                    type="checkbox"
                                                    class="btn-check"
                                                    id="N.E.T."
                                                    name="EXAM_QUALIFIED"
                                                    value="N.E.T."
                                                    <%if(bd.isNet()){%>checked<%}%>
                                                    autocomplete="off"
                                                    />
                                                <label class="btn btn-outline-primary" for="N.E.T."
                                                       >N.E.T.
                                                </label>
                                                    
                                                     <input
                                                    type="checkbox"
                                                    class="btn-check"
                                                    id="S.E.T."
                                                    name="EXAM_QUALIFIED"
                                                    value="S.E.T."
                                                    <%if(bd.isSet()){%>checked<%}%>
                                                    autocomplete="off"
                                                    />
                                                <label class="btn btn-outline-primary" for="S.E.T."
                                                       >S.E.T.
                                                </label>
                                              
                                                     <input
                                                    type="checkbox"
                                                    class="btn-check"
                                                    id="G.A.T.E."
                                                    name="EXAM_QUALIFIED"
                                                    value="G.A.T.E."
<%if(bd.isGate()){%>checked<%}%>
                                                    autocomplete="off"
                                                    />
                                                <label class="btn btn-outline-primary" for="G.A.T.E."
                                                       >G.A.T.E.
                                                </label>
                                                     <input
                                                    type="checkbox"
                                                    class="btn-check"
                                                    id="J.R.F."
                                                    name="EXAM_QUALIFIED"
                                                    value="J.R.F."
                                                    <%if(bd.isJrf()){%>checked<%}%>
                                                    autocomplete="off"
                                                    />
                                                <label class="btn btn-outline-primary" for="J.R.F."
                                                       >J.R.F.
                                                </label>
                                                     <input
                                                    type="checkbox"
                                                    class="btn-check"
                                                    id="NA"
                                                    name="EXAM_QUALIFIED"
                                                    value="NA"
                                                    <%if(bd.isNa()){%>checked<%}%>
                                                    autocomplete="off"
                                                    />
                                                <label class="btn btn-outline-primary" for="NA"
                                                       >NA
                                                </label>
                                            </div>


                                            <div class="col-12">
                                                <label class="">Thesis Title</label>
                                                <input
                                                    type="text"
                                                    class="form-control"
                                                    id="thesis"
                                                    placeholder=""
                                                    required=""
                                                    value="<%=bd.getThesisTitle()%>"
                                                    name="ThesisTitle"
                                                    />
                                            </div>
                                            <div class="col-sm-6">
                                                <label for="firstName" class="form-label">S.R.F(if any)</label>
                                                <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="SRF"
                                                    id="srfYes"
                                                    value="Yes"
                                                     <% if (bd.getSrfDate() != null) { %> checked<%}%>
                                                    />
                                                Yes
                                                <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="SRF"
                                                    id="srfNo"
                                                    value="No"
                                                     <% if (bd.getSrfDate() == null) {  %> checked <% } %>
                                                    />
                                                No

                                            </div>

                                            <div class="col-sm-6">
                                                <label
                                                    for="lastName"
                                                    id=""
                                                    class="form-label"
                                                    style="display: none"
                                                    >SRF Date</label
                                                >
                                                <input
                                                    type="date"
                                                    class="form-control"
                                                    id="srfDate"
                                                    placeholder=""
                                                    name="SrfDate"
                                                    
                                                    <% if (bd.getSrfDate() == null) { %> value="" style="display:none"<%} else {%>value=<%=bd.getSrfDate()%> <% }%>

                                                    />
                                                <div class="invalid-feedback">Valid last name is required.</div>
                                            </div>
                                            <div class="col-sm-6">
                                                <label for="firstName" class="form-label"
                                                       >Re-Registration
                                                </label>
                                                <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="reReg"
                                                    id="reRegYes"
                                                    value="Yes"
                                                    <% if(bd.getReRegDate()!=null){%>checked<%}%>
                                                    />
                                                Yes
                                                <input
                                                    class="form-check-input"
                                                    type="radio"
                                                    name="reReg"
                                                    id="reRegNo"
                                                    value="No"
                                                  <% if(bd.getReRegDate()==null){%>checked<%}%>
                                                    />
                                                No
                                            </div>
                                            <div class="col-sm-6">
                                                <label
                                                    for="lastName"
                                                    style="display: none"
                                                    class="form-label"
                                                    id="reRegLabel"
                                                    >Date</label
                                                >
                                                <input
                                                    type="date"
                                                    class="form-control"
                                                    id="reRegDate"
                                                    placeholder=""
                                                    <% if (bd.getReRegDate() == null) { %> value="" style="display:none"<%} else {%>value=<%=bd.getReRegDate()%> <% }%>
                                                    name="RE_REG_DATE"
                                                    
                                                    />
                                                <div class="invalid-feedback">Valid last name is required.</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col border border-2">

                                        <div class="col-12">
                                            <div class="row mt-5 me-5">
                                                <div class="col-3">Pre-Phd Presentation</div>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input
                                                            class="form-check-input"
                                                            type="radio"
                                                            name="prePhd"
                                                            id="prePhdYes"
                                                            value="yes"
                                                            <% if (bd.getPrePresentation() != null) { %> checked <% } %> 
                                                            />
                                                        <label class="form-check-label" for="inlineRadio1"
                                                               >Yes</label
                                                        >
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input
                                                            class="form-check-input"
                                                            type="radio"
                                                            name="prePhd"
                                                            id="prePhdNo"
                                                            value="no"
                                                             <% if (bd.getPrePresentation() == null) { %> checked <% } %>
                                                            />
                                                        <label class="form-check-label" 
                                                               >No</label
                                                        >
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <label class="form-check-label" 
                                                               id="prePhdLabel"
                                                               style="display:none"
                                                               >Date for pre-phd:</label
                                                        >
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input
                                                            class="form-control"
                                                            type="date"
                                                            name="prePhdDate"
                                                            id="prePhdDate"
                                                            <% if (bd.getPrePresentation() == null) { %> value="" style="display:none"<%} else {%>value=<%=bd.getPrePresentation()%> <% }%>
                                                            
                                                            />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-5 me-5">
                                                <div class="col-3">Phd awarded</div>
                                                <div class="col">
                                                    <div class="form-check form-check-inline">
                                                        <input
                                                            class="form-check-input"
                                                            type="radio"
                                                            name="phd"
                                                            id="phdYes"
                                                            value="yes"
                                                            <% if(bd.getPhdAwarded()!=null){%>checked<%}%>
                                                            />
                                                        <label class="form-check-label" for="inlineRadio1"
                                                               >Yes</label
                                                        >
                                                    </div>
                                                    <div class="form-check form-check-inline">
                                                        <input
                                                            class="form-check-input"
                                                            type="radio"
                                                            name="phd"
                                                            id="phdNo"
                                                            value="no"
                                                            <% if(bd.getPhdAwarded()==null){%>checked<%}%>
                                                            />
                                                        <label class="form-check-label" for="inlineRadio2"
                                                               >No</label
                                                        >
                                                    </div>
                                                    <div class="form-check form-check-inline m-0">
                                                        <label class="form-check-label" for="inlineRadio3" id="phdDateLabel" style="display:none"
                                                               >Date PHD. Awarded:</label
                                                        >
                                                    </div>
                                                    <div class="form-check form-check-inline m-0">
                                                        <input
                                                            class="form-control"
                                                            type="date"
                                                            name="phdDate"
                                                            id="phdDate"
                                                            <% if (bd.getPhdAwarded() == null) { %> value="" style="display:none"<%} else {%>value=<%=bd.getPhdAwarded() %> <% }%>
                                                            
                                                            />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-5 me-5">
                                                <div class="col-11">
                                                    <label
                                                        class="form-check-label"
                                                        >Enter Google Scholar Profile Link</label>
                                                </div>
                                                <div class="col-11">
                                                    <input
                                                        type="text"
                                                        class="form-control mb-5"
                                                        name="profilelink"
                                                        id="profilelink"
                                                        value="<%=bd.getLink()%>"
                                                        />
                                                </div>
                                            </div><div class="row">
                                                <div class="col">
                                                    <input
                                                        type="submit"
                                                        class="btn btn-primary w-100"
                                                        value="Save"
                                                        />
                                                </div>
                                                <div class="col">
                                                    <input
                                                        type="reset"
                                                        class="btn btn-primary w-100"
                                                        value="Reset"
                                                        />
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                            </form>
                        </div>
                    </div></div>
            </div>
            <div class="tab-pane fade " id="nav-patents" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0">
                <div class="col anyClass ">
                    <%@include file="Test/Patents.jsp" %>
                </div>
            </div>
            <div class="tab-pane fade " id="workdetail" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0"><div class="col anyClass ">
                    <script src="js/tinymce/tinymce.min.js"></script>
                    <c:set var="workdetail" scope="page" value="<%=bd.getWorkdetail() %>"/>
                    <c:set var="work" value="workdetail/${workdetail}" />
                    <form id="workdetail" action="UpdateWorkDetailServlet" method="post">
                        <textarea id="myTextarea">
                            <jsp:include page="${work}">
                                <jsp:param name="id" value=""/>
                            </jsp:include>
                        </textarea>                            
                        <input type="submit" value="save" class="btn-primary btn">
                    </form>

                    <script>
                        tinymce.init({
                            selector: '#myTextarea',
                            plugins: 'anchor autolink charmap codesample emoticons image link lists media searchreplace table visualblocks wordcount checklist mediaembed casechange export formatpainter pageembed linkchecker a11ychecker tinymcespellchecker permanentpen powerpaste advtable advcode editimage tinycomments tableofcontents footnotes mergetags autocorrect typography inlinecss',
                            toolbar: 'undo redo | blocks fontfamily fontsize | bold italic underline strikethrough | link image media table mergetags | addcomment showcomments | spellcheckdialog a11ycheck typography | align lineheight | checklist numlist bullist indent outdent | emoticons charmap | removeformat',
                            tinycomments_mode: 'embedded',statusbar:false,
                            tinycomments_author: 'Author name',
                            mergetags_list: [
                                {value: 'First.Name', title: 'First Name'},
                                {value: 'Email', title: 'Email'},
                            ]
                        });
                        $("#workdetail").on("submit", function (event)
                        {
                            event.preventDefault();
                            var editor = tinymce.get("myTextarea");
                            var htmlContent = editor.getContent();
                            console.log(htmlContent);
                            $.ajax({
                                url: " UpdateWorkDetailServlet",
                                type: "POST",
                                data: {
                                    content: htmlContent
                                },
                                success: function (response) {
                                    alert("WORK DETAIL SUCCESSFULLY UPDATED")
                                }
                            });
                        });


                    </script>
                </div>
            </div>
        </div>
    </div>
    <%@include file="Footer.jsp" %>
</body>


<script>
    $('#basicDetailsForm').submit(function (e) {
        e.preventDefault(); // prevent the form from submitting normally

        var formData = $(this).serializeArray();
        // send the data to the servlet
        console.log(formData);
        $.ajax({
            type: 'post',
            url: 'BasicDetailServlet',
            data: formData,
            success: function (response) {
                alert("EXECUTED SUCCESSFULLY")
            },
            error: function (xhr, status, error) {
                alert("SOMETHING WENT WRONG")
            }
        });
    });


</script>
<script>
    $(document).ready(function () {
        initConference();
        initFdp();
        initWorkshop();
        initPublication();
        initPatent();
        var toggleState = "hide";

        // When button is clicked, toggle the visibility of the element
        $("#othersButton").click(function () {
            if (toggleState === "show") {
                $("#examName").hide();
                $("#examNameLabel").hide();
                toggleState = "hide";
            } else {
                $("#examName").show();
                $("#examNameLabel").show();
                toggleState = "show";
            }
        });
    });
</script>
<script>
    $('input[type="radio"][name="SRF"]').change(function () {
        if ($(this).val() === "Yes") {
            $("#srfDate").show();
        } else {
            $("#srfDate").hide();
            $("#srfDate").val("");
        }
    });
    $('input[type="radio"][name="reReg"]').change(function () {
        if ($(this).val() === "Yes") {
            $("#reRegDate").show();
        } else {
            $("#reRegDate").hide();
            $("#reRegDate").val("");
        }
    });



    $('input[type="radio"][name="prePhd"]').change(function () {
        if ($(this).val() === "yes") {

            $("#prePhdLabel").show();
            $("#prePhdDate").show();
        } else {
            $("#prePhdLabel").hide();
            $("#prePhdDate").hide();
            $("#prePhdDate").val("");
        }
    });
    $('input[type="radio"][name="phd"]').change(function () {
        if ($(this).val() === "yes") {
            $("#phdDate").show();
            $("#phdDateLabel").show();
        } else {
            $("#phdDate").hide();
            $("#phdDateLabel").hide();
            $("#phdDate").val("");
        }
    });

</script>
<script>
    $(document).ready(function () {
        var $table = $("#sciTable");
        var $tbody = $table.find("tbody");
        var $textField = $("#sciPaperName");
        var $addButton = $("#sciAddButton");

        var rowNumber = 1;

        function addRow(data) {
            var $row = $("<tr>");

            var $numberCell = $("<td>").text("*");
            var $dataCell = $("<td>").text(data);
            var $actionsCell = $("<td>");
            var $deleteButton = $('<button class="btn btn-danger">').text("Delete");

            $deleteButton.click(function () {
                $(this).closest("tr").remove();
            });

            $actionsCell.append($deleteButton);
            $row.append($numberCell, $dataCell, $actionsCell);
            $tbody.append($row);
        }

        $addButton.click(function () {
            var data = $textField.val();
            if (data) {
                addRow(data);
                $textField.val("");
            }
        });
    });



</script>

</html>

