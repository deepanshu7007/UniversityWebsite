<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign-up</title>
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="js/bootstrap.bundle.min.js"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
	<script>
                $(document).ready(function ()
                {
                    console.log("loaded...........");

                    $('#regform').on('submit', function (event)
                    {
                        event.preventDefault();
                       $("submitBtn").hide();
		       $("#loader").show();
                        let form = new FormData(this);
                        $.ajax({
                        url:"RegisterServlet",
                                type:'post',
                                data:form,
                                success: function(data, textStatus, jqXHR)
                                {
                                console.log("successfully submitted");
				$("submitBtn").show();
		       $("#loader").hide();
		       if(data.trim() === 'Successful')
		       {
		       swal("User successfully registered,Now redirecting to next page").then((value) =>{
			window.location="LoginPage.jsp"       
		       });
	       }else
	       {
		       swal(data);
	       }
                                },
                        error:function(jqXHR, textStatus, errorThrown)
                        {
                        console.log(jqXHR);
			$("submitBtn").show();
		       $("#loader").hide();
			swal("Error","Something went wrong", "error");
                        }, processData:false,
                                contentType:false
                        });



                    });



                });




	</script>
    </head>
    <body>
	<%@include file="NormalNavbar.jsp" %>
	<form id="regform" action="RegisterServlet" method="POST">
	    <div class="container border border-3 shadow-lg">
		<div class="col-md-4  offset-md-4">
		    <div class="card" style="width: 30rem;">
                        <img src="css/1.png" class="mx-auto d-block rounded-circle mt-sm-1 img-fluid"  style="width:500px;height:600px;" alt="Rounded Image">
                        <div class="card-body ">
                            <h5 class="card-title text-sm-center m-0">Register here</h5>
                        </div>
                        <ul class="list-group list-group-item border-0 align-items-center">
                            <li class="list-group-item">
                                <div class="input-group mb-0">
                                    <input type="text" class="form-control" placeholder="first-name *" required aria-label="Username" name="firstName">
                                    <input type="text" class="form-control" placeholder="last-name *" required aria-label="Server" name="lastName">
				</div>
                            </li>
                            <li class="list-group-item">


				<input type="text" class="form-control mb-3" placeholder="E-mail*" name="eMail" required aria-label="Username">
				<input type="text" class="form-control mb-3" placeholder="UID*" required aria-label="Server" name="uId">
				<input type="password" class="form-control mb-3" placeholder="Password*" required aria-label="Server" name="passWord">				<input type="password" class="form-control mb-3" placeholder="Confirm-Password" aria-label="Server">

                            </li>
                            <li class="list-group-item">
				<label class="form-check-label" for="exampleRadios1">
				    Date of Birth:
				</label>
                                <input type="date" class="form-control mb-2" id="exampleFormControlInput1" placeholder="" name="dateOfBirth">
				<input class="form-check-input" type="radio"  id="" value="Scholar" checked name="role">
				<label class="form-check-label" for="exampleRadios1">
				    Scholar
				</label>
				<input class="form-check-input" type="radio" id="" name="role" value="Faculty">
				<label class="form-check-label" name="role" for="exampleRadios1">
				    Faculty
				</label>
                            </li>
                            <li class="list-group-item">
                                <textarea type="text" class="form-control" style="height:5rem" id="exampleFormControlInput1" placeholder="About" name="about"></textarea>
                            </li>
			    
                        </ul>
			<div  id="loader"style="display:none;"class="container text-center spinner-border fa-spin"></div>
			
                        <ul class="card-body m-sm-0">
                            <input id = "submitBtn"type="submit" class="btn btn-primary m-sm-0 " value="Save">
                        </ul>
                    </div>

		</div>
	    </div>
	</form>
	<%@include file="Footer.jsp" %>
    </body>

</html>
