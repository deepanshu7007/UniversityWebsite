<%-- 
    Document   : BasicDetails
    Created on : 13 May, 2023, 4:03:54 PM
    Author     : Deepanshu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" >
    </head>
    <body>
<div class="row">
			    <h4 class="display-5">Enter Scholars Details</h4>
			    <hr>

			    <form id="basicDetailsForm" action="BasicDetailServlet" method="post">
				<div class="col border border-2">
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
						    value="NET"
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
						    VALUE="JRF"
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
						    VALUE="SET"
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
						    VALUE="GATE"
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
						    VALUE="OTHERS"
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
						value="2023-05-01"
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
						value="2023-05-01"
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
							value="2023-05-01"
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
							value="2023-05-01"
							style="display:none"
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
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" ></script>
    <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="../js/OtherPages/BasicDetail.js"></script>
</html>
