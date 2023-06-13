<%-- 
    Document   : BasicDetails
    Created on : 13 May, 2023, 3:50:17 PM
    Author     : Deepanshu
--%>

<%@page import="com.uni.web.entities.userdetail.Publication"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.uni.web.entities.User"%>
<%@page import="com.uni.web.dao.PublicationDao"%>
<%@page import="com.uni.web.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<%
        User pubu = (User) session.getAttribute("currentUser");
        PublicationDao pd = new PublicationDao(ConnectionProvider.getConnection());
        ArrayList<Publication> listOfPublication = pd.getPublication(pubu.getUserName());
%>
<div class="modal-body">
    <form id="publication_form" action="PublicationServlet" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <div class="container mb-3">
                <div class="row row-cols-4">
                    <div class="col-11">
                        <input
                            type="text"
                            class="form-control"
                            id="publication_UID"
                            name="publication_UID"
                            style="display:none"
                            />
                        <label
                            for="recipient-name"
                            class="col-form-label"
                            >Enter Paper Name:
                        </label>
                        <input
                            type="text"
                            class="form-control"
                            id="publication_name"
                            name="publication_name"
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
                            id="publication_author_UID"
                            name="publication_author_UID"
                            />
                        <label for="input-text">AUTHOR NAME</label>
                        <input type="text"
                               class="form-control"
                               id="author_NAME"
                               name="author_NAME"
                               rows="3"
                               >
                        <label for="input-text">CO-AUTHOR 3 UID</label>
                        <input type="text"
                               class="form-control"
                               id="publication_coauthor3_UID"
                               name="publication_coauthor3_UID"
                               rows="3"
                               >
                        <label for="input-text">CO-AUTHOR 3 NAME</label>
                        <input type="text"
                               class="form-control"
                               id="publication_coauthor3_NAME"
                               name="publication_coauthor3_NAME"
                               rows="3"
                               >

                        <label for="input-text">CO-AUTHOR 4 UID</label>
                        <input type="text"
                               class="form-control"
                               id="publication_coauthor4_UID"
                               name="publication_coauthor4_UID"
                               rows="3"
                               ><!-- comment -->
                        <label for="input-text">CO-AUTHOR 4 NAME</label>
                        <input type="text"
                               class="form-control"
                               id="publication_coauthor4_NAME"
                               name="publication_coauthor4_NAME"
                               rows="3"
                               >
                    </div>
                    <div class="col-5">
                        <div class="form-group ">
                            <label for="input-text">CO-AUTHOR1 UID</label>
                            <input type="text"
                                   class="form-control"
                                   id="publication_coauthor1_UID"
                                   name="publication_coauthor1_UID"
                                   rows="3"
                                   >
                            <label for="input-text">CO-AUTHOR 1 NAME</label>
                            <input type="text"
                                   class="form-control"
                                   id="publication_coauthor1_NAME"
                                   name="publication_coauthor1_NAME"
                                   rows="3"
                                   >

                            <label for="input-text">CO-AUTHOR 2 UID</label>
                            <input type="text"
                                   class="form-control"
                                   id="publication_coauthor2_UID"
                                   name="publication_coauthor2_UID"
                                   rows="3"
                                   ><!-- comment -->
                            <label for="input-text">CO-AUTHOR 2 NAME</label>
                            <input type="text"
                                   class="form-control"
                                   id="publication_coauthor2_NAME"
                                   name="publication_coauthor2_NAME"
                                   rows="3"
                                   >


                            <label for="input-text">CO-AUTHOR 5 UID</label>
                            <input type="text"
                                   class="form-control"
                                   id="publication_coauthor5_UID"
                                   name="publication_coauthor5_UID"
                                   rows="3"
                                   >
                            <label for="input-text">CO-AUTHOR 5 NAME</label>
                            <input type="text"
                                   class="form-control"
                                   id="publication_coauthor5_NAME"
                                   name="publication_coauthor5_NAME"
                                   rows="3"
                                   >
                        </div>
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
                            name="publication_journal"
                            class="form-control"
                            id="publication_journal"
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
                            id="publication_volume"
                            name="publication_volume"
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
                            id="publication_year"
                            name="publication_year"
                            REQUIRED
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
                            id="publication_doi"
                            name="publication_doi"
                            REQUIRED
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
                            id="publication_impact"
                            name="publication_impact"
                            REQUIRED
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
                            id="publication_link"
                            name="publication_link"
                            />
                    </div>
                    <div class="col-3">
                        <label
                            for="recipient-name"
                            class="col-form-label"
                            >No. of Citation
                        </label>
                        <input
                            type="text"
                            class="form-control"
                            id="publication_citation"
                            name="publication_citation"
                            required
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
                                name="indexing"
                                value="esi"
                                autocomplete="off"
                                />
                            <label class="btn btn-outline-primary" for="esi"
                                   >E.S.I.
                            </label>
                            <input
                                type="checkbox"
                                class="btn-check"
                                id="others"
                                value="others"
                                name="indexing"
                                autocomplete="off"
                                />
                            <label class="btn btn-outline-primary" for="others"
                                   >Others
                            </label>
                            <input
                                type="checkbox"
                                class="btn-check"
                                id="peerpaper"
                                name="indexing"
                                value="peerpaper"
                                autocomplete="off"
                                />
                            <label class="btn btn-outline-primary" for="peerpaper"
                                   >Peer Paper
                            </label>
                            <input
                                type="checkbox"
                                class="btn-check"
                                id="scopus"
                                name="indexing"
                                value="scopus"
                                autocomplete="off"
                                />
                            <label class="btn btn-outline-primary" for="scopus"
                                   >SCOPUS
                            </label>
                            <input
                                type="checkbox"
                                class="btn-check"
                                id="sci"
                                name="indexing"
                                value="sci"
                                autocomplete="off"
                                />
                            <label class="btn btn-outline-primary" for="sci"
                                   >S.C.I.
                            </label>
                        </div>

                    </div>
                </div>
            </div>
            <input
                type="submit"

                class="form-control btn btn-primary"
                name="publication_add_btn"
                id="publication_add_btn"
                />
            

        </div>
        <div class="mb-3">
            <table class="table table-bordered" id="publication_table" >
                <%for (Publication publication : listOfPublication) {%>
                <tr>
                    <td><%=publication.getDoiNumber()%></td>
                    <td><%=publication.getTitle()%></td>
                    <td><%=publication.getJournalName()%></td>
                    <td><%if (publication.isESI()) {%>ESI<%}%>
                        <%if (publication.isSCI()) { %>SCI <%}%>
                        <%if (publication.isScopus()) {%>SCOPUS<%}%>
                        <%if (publication.isPeerpaper()) {%>PEERPAPER<%}%>
                        <%if (publication.isOther()) {%>OTHER<%}%></td>
                    <td><button type="button" class="btn btn-danger" onclick="deletePublication(this, '<%=publication.getDoiNumber()%>', '<%=pubu.getUserName()%>')">DELETE</td>

                </tr>
                <%}%>
            </table>
        </div>

</div>
<div class="modal-footer">
    <input
        type="reset"
        class="btn btn-secondary"
        data-bs-dismiss="modal"
        />

</form>
</div>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="js/OtherPages/FormSubmitData.js"></script>
<script>
                        let publicationHeading = ["DOI", "PAPER-TITLE", "JOURNAL", "INDEXING"];
                        let publicationClassName = ["publication_doi", "publication_name", "publication_journal", "indexing"];

                        let publicationTable = $("#publication_table");
                        let publicationTableRow = [];

                        function deletePublication(currentRow, doi, uid)
                        {

                            event.preventDefault();


                            $.ajax({
                                url: "PublicationDeleteServlet",
                                method: 'POST',
                                data: {key1: uid, key2: doi},
                                success: function (data, textStatus, jqXHR) {
                                    alert("DATA SUCCESSFULLY DELETED");
                                },
                                error: function (error) {
                                    console.log("SOMETHING WENT WRONG");
                                }
                            });

                            $(currentRow).closest("tr").remove();

                        }

                        function initPublication() {
                            let thead = $("<thead>"); // Create the <thead> element
                            let headerRow = $("<tr>"); // Create the <tr> element for header row
                            let uidForUser = "<%=pubu.getUserName()%>";
                            console.log(uidForUser);
                            $(publicationTable).append(thead);
                            $(thead).append(headerRow); // Append the <tr> element to the <thead> element

                            for (let x of publicationHeading) {
                                $(headerRow).append($("<th>").text(x)); // Append the <th> elements to the header row
                            }
                            $("#publication_form").on("submit", function (event) {
                                event.preventDefault();
                                if ($("#publication_coauthor1_UID").val() === uidForUser || $("#publication_coauthor2_UID").val() === uidForUser || $("#publication_coauthor3_UID").val() === uidForUser || $("#publication_coauthor4_UID").val() === uidForUser || $("#publication_coauthor5_UID").val() === uidForUser || $("#publication_author_UID").val() === uidForUser)
                                {
                                    if ($('#publication_doi').val() === "" && $('#publication_name').val() === "")
                                    {
                                        alert("enter valid values");
                                    } else {
                                        var $rowData = $("#publication_form").serializeArray();
                                        var jsonObject = {};
                                        $.each($rowData, function (index, field) {
                                            jsonObject[field.name] = field.value;
                                        });
                                        $("input[type='checkbox']").each(function () {
                                            jsonObject[this.name] = this.checked ? "true" : "false";
                                        });
                                        publicationTableRow.push(jsonObject);
                                        trow = $("<tr>");
                                        for (let x of publicationClassName) {
                                            console.log("x:" + x);
                                            for (let y of $rowData) {
                                                console.log("y:" + y['name'])
                                                if (x === y['name']) {
                                                    let tdata = $("<td>").text(y['value']);
                                                    $(trow).append(tdata);

                                                }
                                            }
                                        }
                                        var serverName = $(this).attr("action");
                                        let publicationForm = new FormData(this);
                                        formSubmitData(publicationForm, serverName);
                                        var $actionsCell = $("<td>");
                                        var $deleteButton = $('<button type="button" class="btn btn-danger">').text("Delete");
                                        $deleteButton.val(jsonObject['publication_doi']);
                                        $uid = (jsonObject['publication_UID'])
                                        $deleteButton.click(function () {
                                            event.preventDefault();
                                            val = ($deleteButton.val());

                                            $.ajax({
                                                url: "PublicationDeleteServlet",
                                                method: 'POST',
                                                data: {key1: $uid, key2: val},
                                                success: function (data, textStatus, jqXHR) {
                                                    alert("DATA SUCCESSFULLY DELETED");
                                                },
                                                error: function (error) {
                                                    console.log("SOMETHING WENT WRONG");
                                                }
                                            });
                                            var index = $(this).closest("tr").index();
                                            publicationTableRow.splice(index - 1, 1);
                                            $(this).closest("tr").remove();
                                        });
                                        $actionsCell.append($deleteButton);
                                        trow.append($actionsCell);
                                        $(publicationTable).append(trow);
                                        $('#publication_form')[0].reset();
                                    }
                                } else {
                                    alert("THERE MUST BE ATLEAST ONE COAUTHOR OR AUTHOR WITH LOGGED IN UID:"+$("#publication_author").val());
                                    
                                }
                            });
                        }



</script>

