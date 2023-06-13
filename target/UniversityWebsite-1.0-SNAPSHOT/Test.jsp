<%-- 
    Document   : ProfilePage
    Created on : 19 Apr, 2023, 6:54:18 AM
    Author     : Deepanshu
--%>
<%@page import="com.uni.web.entities.User"%>
<%@page errorPage="ErrorPage.jsp"%>

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
	<div class="container-fluid">
	    <nav>
		<div class="nav nav-tabs" id="nav-tab" role="tablist">
		    <button class="nav-link active" id="nav-basicdetails-tab" data-bs-toggle="tab" data-bs-target="#nav-basicdetails" type="button" role="tab" aria-controls="nav-details" aria-selected="false" >Basic Details</button>
		    <button class="nav-link " id="nav-publication-tab" data-bs-toggle="tab" data-bs-target="#nav-publication" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Publication</button>
		    <button class="nav-link" id="nav-patents-tab" data-bs-toggle="tab" data-bs-target="#nav-patents" type="button" role="tab" aria-controls="nav-disabled" aria-selected="false" >Patents</button>
		    <button class="nav-link" id="nav-conference-tab" data-bs-toggle="tab" data-bs-target="#nav-conference" type="button" role="tab" aria-controls="nav-disabled" aria-selected="false" >Conference</button>
		    <button class="nav-link" id="nav-workshop-tab" data-bs-toggle="tab" data-bs-target="#nav-workshop" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Workshop</button>
		    <button class="nav-link" id="nav-fdp-tab" data-bs-toggle="tab" data-bs-target="#nav-fdp" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">F.D.P</button>

		</div>
	    </nav>
	    <div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade " id="nav-publication" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0"><div class="col anyClass ">
			<div class="modal-body">
			   
				<div class="mb-3">
				    <div class="container mb-3">
					<div class="row row-cols-4">
					    <div class="col-11">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >Enter Paper Name:
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="sciPaperName"
						    name="sciPaperName"
						    />
					    </div>
					    <div class="col-5">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >Author:
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    name="sciAuthorName"
						    />
						<input type='submit' class="btn btn-primary" value="validate"/>
					    </div>
					    <div class="col-5">
						<div class="form-group ">
						    <label for="input-text">CO-AUTHOR(specify UID)</label>
						    <input type="text"
							   class="form-control"
							   id="input-text"
							   rows="3"
							   >
						</div>
						<button
						    type="button"
						    class="btn btn-primary"
						    id="convert-btn"
						    >
						    Add
						</button>
						<button
						    type="button"
						    class="btn btn-primary"
						    id="validateBtn"
						    >
						    VALIDATE
						</button>
						<div class="col-6">
						    <div id="capsule-container" ></div>
						</div>
					    </div>
					    <div class="col-8">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >Journal Name:
						</label>
						<input
						    type="text"
						    name="sciJournalName"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >Vol.No.
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    name="sciVolumeNumber"
						    />
					    </div>
					    <div class="col">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >Publication year
						</label>
						<input
						    type="Date"
						    class="form-control"
						    id="recipient-name"
						    name="sciDate"
						    />
					    </div>
					    <div class="col">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >DOI No.
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    name="sciDoiNumber"
						    />
					    </div>
					    <div class="col">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >Impact factor
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    name="sciImpactFactor"
						    />
					    </div>
					    <div class="col-11">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >Link to paper
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    name="sciLinkPaper"
						    />
					    </div>
					    <div class="col-sm-6">
						<label for="firstName" class="form-label">Indexing</label>
						<div
						    class="btn-group"
						    role="group"
						    aria-label="Basic checkbox toggle button group"
						    >
						    <input
							type="checkbox"
							class="btn-check"
							id="esi"
							autocomplete="off"
							/>
						    <label class="btn btn-outline-primary" for="esi"
							   >E.S.I.
						    </label>
						    <input
							type="checkbox"
							class="btn-check"
							id="others"
							autocomplete="off"
							/>
						    <label class="btn btn-outline-primary" for="others"
							   >Others
						    </label>
						    <input
							type="checkbox"
							class="btn-check"
							id="peerpaper"
							autocomplete="off"
							/>
						    <label class="btn btn-outline-primary" for="peerpaper"
							   >Peer Paper
						    </label>
						    <input
							type="checkbox"
							class="btn-check"
							id="scopus"
							autocomplete="off"
							/>
						    <label class="btn btn-outline-primary" for="scopus"
							   >SCOPUS
						    </label>
						    <input
							type="checkbox"
							class="btn-check"
							id="sci"
							autocomplete="off"
							/>
						    <label class="btn btn-outline-primary" for="sci"
							   >S.C.I.
						    </label>
						</div>
						<div class="invalid-feedback">Supervisor name is required</div>
					    </div>
					</div>
				    </div>
				    <button
					type="button"
					id="sciAddButton"
					class="form-control btn btn-primary"
					name="sciAddButton"
					>
					Add
				    </button>
				</div>
				<div class="mb-3">
				    <table class="table" id="sciTable" name="sciTable">
					<thead>
					    <tr>
						<th scope="col">DOI number</th>
						<th scope="col">Paper name</th>
						<th scope="col">Author</th>
						<th scope="col">Indexing</th>
						<th scope="col">Action</th>
					    </tr>
					</thead>
					<tbody></tbody>
				    </table>
				</div>
			   
			</div>
			<div class="modal-footer">
			    <button
				type="button"
				class="btn btn-secondary"
				data-bs-dismiss="modal"
				>
				Reset
			    </button>
			    <button type="button" class="btn btn-primary">
				Save
			    </button>
			</div>
		    </div>
		</div>
		<div class="tab-pane fade" id="nav-fdp" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0"><div class="col anyClass ">
			<div class="modal-body">
			    <form>
				<div class="mb-3">
				    <div class="container mb-3">
					<div class="row row-cols-4">
					    <div class="col-11">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >FDP CODE
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-5">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >FDP NAME
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-5">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >DURATION
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    placeholder="TIME"
						    />
					    </div>
					    <div class="col-8">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >LOCATION
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-8">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >TOPIC
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-8">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >WEBSITE
						</label>
						<input
						    type="TEXT"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-8">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >OUTCOMES
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-8">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >CERTIFICATE
						</label>
						<input
						    type="file"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-11">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >OTHER DETAILS
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					</div>
				    </div>
				    <p class="form-control btn btn-primary">Add</p>
				</div>
				<div class="mb-3">
				    <table class="table">
					<thead>
					    <tr>
						<th scope="col">DOI number</th>
						<th scope="col">Paper name</th>
						<th scope="col">Author</th>
						<th scope="col">Indexing</th>
						<th scope="col">Action</th>

					    </tr>
					</thead>
					<tbody>

					</tbody>
				    </table>
				</div>
			    </form>
			</div>
			<div class="modal-footer">
			    <button
				type="button"
				class="btn btn-secondary"
				data-bs-dismiss="modal"
				>
				Reset
			    </button>
			    <button type="button" class="btn btn-primary">
				Save
			    </button>
			</div>
		    </div></div>
		<div class="tab-pane fade" id="nav-workshop" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0"><div class="col anyClass ">
			<div class="modal-body">

			    <div class="mb-3">
				<div class="container mb-3">
				    <div class="row row-cols-4">
					<form action="">
					    <div class="col-11">

						<label
						    for="recipient-name"
						    class="col-form-label"
						    >WORKSHOP_ID
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					</form>
					<div class="col-5">
					    <label
						for="recipient-name"
						class="col-form-label"
						>NAME
					    </label>
					    <input
						type="text"
						class="form-control"
						id="recipient-name"
						/>
					</div>
					<div class="col-5">
					    <label
						for="recipient-name"
						class="col-form-label"
						>DATE
					    </label>
					    <input
						type="DATE"
						class="form-control"
						id="recipient-name"
						/>
					</div>
					<div class="col-8">
					    <label
						for="recipient-name"
						class="col-form-label"
						>LOCATION
					    </label>
					    <input
						type="text"
						class="form-control"
						id="recipient-name"
						/>
					</div>
					<div class="col-8">
					    <label
						for="recipient-name"
						class="col-form-label"
						>TOPIC
					    </label>
					    <input
						type="text"
						class="form-control"
						id="recipient-name"
						/>
					</div>
					<div class="col">
					    <label
						for="recipient-name"
						class="col-form-label"
						>ORGANISER
					    </label>
					    <input
						type="TEXT"
						class="form-control"
						id="recipient-name"
						/>
					</div>
					<div class="col-4">
					    <label
						for="recipient-name"
						class="col-form-label"
						>SCHEDULE
					    </label>
					    <input
						type="text"
						class="form-control"
						id="recipient-name"
						/>
					</div>
					<div class="col-8">
					    <label
						for="recipient-name"
						class="col-form-label"
						>MATERIAL
					    </label>
					    <input
						type="text"
						class="form-control"
						id="recipient-name"
						/>
					</div>
					<div class="col-11">
					    <label
						for="recipient-name"
						class="col-form-label"
						>WEBSITE
					    </label>
					    <input
						type="text"
						class="form-control"
						id="recipient-name"
						/>
					</div>
				    </div>
				</div>
				<p class="form-control btn btn-primary">Add</p>
			    </div>
			    <div class="mb-3">
				<table class="table">
				    <thead>
					<tr>
					    <th scope="col">DOI number</th>
					    <th scope="col">Paper name</th>
					    <th scope="col">Author</th>
					    <th scope="col">Indexing</th>
					    <th scope="col">Action</th>
					</tr>
				    </thead>
				    <tbody>

				    </tbody>
				</table>
			    </div>

			</div>
			<div class="modal-footer">
			    <input
				type="reset"
				class="btn btn-secondary"
				data-bs-dismiss="modal"
				value="Reset"
				>

			    </button>
			    <button type="button" class="btn btn-primary">
				Save
			    </button>
			</div>

		    </div></div>
		<div class="tab-pane fade" id="nav-conference" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0"><div class="col anyClass ">
			<div class="modal-body">
			    <form>
				<div class="mb-3">
				    <div class="container mb-3">
					<div class="row row-cols-4">
					    <div class="col-11">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >CONFERENCE-ID
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-5">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >NAME
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-5">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >MODE
						</label>
						<input
						    type="radio"

						    id="recipient-name"
						    name="mode"
						    /> ONLINE
						<input
						    type="radio"

						    id="recipient-name"
						    name="mode"
						    />OFFLINE
					    </div>
					    <div class="col-4">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >LOCATION
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-4">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >DATE
						</label>
						<input
						    type="DATE"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-8">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >TOPIC
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-8">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >ORGANISER
						</label>
						<input
						    type="TEXT"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-8">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >ABSTRACT
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-8">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >POSTER_LINK
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-11">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >CERTIFICATE
						</label>
						<input
						    type="FILE"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					    <div class="col-11">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >OTHERS
						</label>
						<input
						    type="TEXT"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>
					</div>
				    </div>
				    <p class="form-control btn btn-primary">Add</p>
				</div>
				<div class="mb-3">
				    <table class="table">
					<thead>
					    <tr>
						<th scope="col">DOI number</th>
						<th scope="col">Paper name</th>
						<th scope="col">Author</th>
						<th scope="col">Indexing</th>
						<th scope="col">Action</th>
					    </tr>
					</thead>
					<tbody>

					</tbody>
				    </table>
				</div>
			    </form>
			</div>
			<div class="modal-footer">
			    <button
				type="button"
				class="btn btn-secondary"
				data-bs-dismiss="modal"
				>
				Reset
			    </button>
			    <button type="button" class="btn btn-primary">
				Save
			    </button>
			</div>
		    </div></div>
		<div class="tab-pane fade active show" id="nav-basicdetails" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0"><div class="col">
			<div class="row">
			    <h4 class="display-5">Enter Scholars Details</h4>
			    <hr>

			    <div class="col border border-2">
				<form id="basicDetailsForm" action="BasicDetailServlet" method="get">
				    <div class="row g-3">
					<div class="col-sm-8">
					    <label for="firstName" class="form-label"
						   >Supervisor-name
					    </label>
					    <select
						class="form-select"
						id="firstName"
						name="SuperVisor"
						id="SuperVisor"
						>
						<option value="none" selected disabled hidden>
						    Select an Option
						</option>
						<option value="palak">Dr. Palak</option>
						<option value="shivalika">M/s. Shivalika</option>
						<option value="jasbir">Sh. Jasbir Singh</option>
						<option value="lalit">Prof. Lalit Sen</option>
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
						<option value="none" selected disabled hidden>
						    Select an Option
						</option>
						<option value="MCA">MCA</option>
						<option value="MTech">MTech</option>
						<option value="M.E.">M.E.</option>
						<option value="Other">Other</option>
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
						value=""
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
						    id="btncheck1"
						    autocomplete="off"
						    name="EXAM_QUALIFIED"
						    />
						<label class="btn btn-outline-primary" for="btncheck1"
						       >NET
						</label>
						<input
						    type="checkbox"
						    class="btn-check"
						    id="btncheck2"
						    autocomplete="off"
						    name="EXAM_QUALIFIED"
						    />
						<label class="btn btn-outline-primary" for="btncheck2"
						       >JRF
						</label>
						<input
						    type="checkbox"
						    name="EXAM_QUALIFIED"
						    class="btn-check"
						    id="btncheck3"
						    autocomplete="off"
						    />
						<label class="btn btn-outline-primary" for="btncheck3"
						       >SET
						</label>
						<input
						    type="checkbox"
						    name="EXAM_QUALIFIED"
						    class="btn-check"
						    id="btncheck4"
						    autocomplete="off"
						    />
						<label class="btn btn-outline-primary" for="btncheck4"
						       >GATE
						</label>
						<input
						    type="checkbox"
						    class="btn-check"
						    id="othersButton"
						    name="EXAM_QUALIFIED"
						    autocomplete="off"
						    />
						<label class="btn btn-outline-primary" for="othersButton"
						       >Others
						</label>
					    </div>
					    <div class="invalid-feedback">Supervisor name is required</div>
					</div>
					<div class="col-sm-6">
					    <label
						for="examName"
						style="display: none"
						id="examNameLabel"
						class="form-label"
						>Exam name</label
					    >
					    <input
						type="text"
						class="form-control"
						id="examName"
						placeholder=""
						value=""
						name="ExamName"
						style="display: none"
						/>
					    <div class="invalid-feedback">Valid last name is required.</div>
					</div>

					<div class="col-12">
					    <label class="">Thesis Title</label>
					    <input
						type="text"
						class="form-control"
						id="thesis"
						placeholder=""
						required=""
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
						/>
					    Yes
					    <input
						class="form-check-input"
						type="radio"
						name="SRF"
						id="srfNo"
						value="No"
						checked
						/>
					    No
					    <input
						class="form-check-input"
						type="radio"
						name="SRF"
						id="srfNa"
						value="na"
						/>
					    N.A.
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
						value=""
						name="SrfDate"
						style="display: none"
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
						/>
					    Yes
					    <input
						class="form-check-input"
						type="radio"
						name="reReg"
						id="reRegNo"
						value="No"
						/>
					    No
					    <input
						class="form-check-input"
						type="radio"
						name="reReg"
						id="reRegNa"
						value="Na"
						/>
					    N.A.
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
						value=""
						name="RE_REG_DATE"
						style="display: none"
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
						    value=""
						    style="display:none"
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
						    value=""
						    style="display:none"
						    />
					    </div>
					</div>
				    </div>
				    <div class="row mt-5 me-5">
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
		<div class="tab-pane fade " id="nav-patents" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0"><div class="col anyClass ">
			<div class="modal-body">
			    <form>
				<div class="mb-3">
				    <div class="container mb-3">
					<div class="row row-cols-4">
					    <div class="col-6">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >Patent-ID
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    name="PATENT_ID"
						    />
					    </div>
					    <div class="col-6">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >PATENT-TITLE
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="recipient-name"
						    name="PATENT_NAME"
						    />
					    </div>
					    <div class="col-6">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >AUTHOR
						</label>
						<input
						    type="text"
						    class="form-control"
						    id="author"
						    name="author"
						    /> 
						<div class="form-group ">
						    <label for="input-text">CO-AUTHOR(specify UID)</label>
						    <input type="text"
							   class="form-control"
							   id="input-text"
							   rows="3"
							   >
						</div>
						<button
						    type="button"
						    class="btn btn-primary"
						    id="convert-btn"
						    >
						    Add
						</button>
						<button
						    type="button"
						    class="btn btn-primary"
						    id="validateBtn"
						    >
						    VALIDATE
						</button>
						<div class="col-6">
						    <div id="capsule-container" ></div>
						</div>
					    </div>
					    <div class="col-6">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >DATE OF PUBLICATION
						</label>
						<input
						    type="DATE"
						    class="form-control"
						    id="recipient-name"
						    name=""
						    />
					    </div>
					    <div class="col-6">
						<label
						    for="recipient-name"
						    class="col-form-label"
						    >DATE OF GRANT
						</label>
						<input
						    type="DATE"
						    class="form-control"
						    id="recipient-name"
						    />
					    </div>

					</div>
					<p class="form-control mt-4 btn btn-primary">Add</p>
				    </div>
				    <div class="mb-3">
					<table class="table">
					    <thead>
						<tr>
						    <th scope="col">ID</th>
						    <th scope="col">PATENT TITLE</th>
						    <th scope="col">AUTHOR</th>
						    <th scope="col">ACTION</th>
						</tr>
					    </thead>
					    <tbody>

					    </tbody>
					</table>
				    </div>
			    </form>
			</div>
			<div class="modal-footer">
			    <button
				type="button"
				class="btn btn-secondary"
				data-bs-dismiss="modal"
				>
				Reset
			    </button>
			    <button type="button" class="btn btn-primary">
				Save
			    </button>
			</div>
		    </div></div>
	    </div>
	</div>
    </div>
    <%@include file="Footer.jsp" %>
</body>
<script src="js/bootstrap.bundle.min.js"></script>

<script>
                $('#basicDetailsForm').submit(function (e) {
                  e.preventDefault(); // prevent the form from submitting normally
    
    var formData = $(this).serializeArray();
    var data = {};
    
    $.each(formData, function(index, field) {
      data[field.name] = field.value;
    });
    
    // send the data to the servlet
    $.ajax({
      type: 'GET',
      url: 'BasicDetailServlet',
      data: data,
      success: function(response) {
       alert("EXECUTED SUCCESSFULLY")
      },
      error: function(xhr, status, error) {
       alert("SOMETHING WENT WRONG")
      }
    });
                });


</script>
<script>
        $(document).ready(function () {
            // Set initial state to "show"
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
        window.addEventListener("DOMContentLoaded", function () {
            // When the convert button is clicked, generate capsules from the input text
            document
                    .getElementById("convert-btn")
                    .addEventListener("click", function () {
                        var inputText = document.getElementById("input-text").value.trim();
                        if (inputText !== "") {
                            var capsules = inputText.split(",");
                            var capsuleHtml = "";
                            for (var i = 0; i < capsules.length; i++) {
                                capsuleHtml +=
                                        '<span class="badge badge-pill badge-secondary btn btn-primary">' +
                                        capsules[i] +
                                        '       <button type="button" class=" remove-capsule btn btn-danger"></button></span> ';
                            }
                            document
                                    .getElementById("capsule-container")
                                    .insertAdjacentHTML("beforeend", capsuleHtml);
                            document.getElementById("input-text").value = "";
                        }
                    });

            // When a remove button is clicked, remove the corresponding capsule
            document.addEventListener("click", function (event) {
                if (event.target.classList.contains("remove-capsule")) {
                    event.target.parentNode.parentNode.removeChild(
                            event.target.parentNode
                            );
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

