<%-- 
    Document   : Patents
    Created on : 13 May, 2023, 4:04:02 PM
    Author     : Deepanshu
--%>

<%@page import="com.uni.web.entities.userdetail.Patent"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.uni.web.entities.User"%>
<%@page import="com.uni.web.dao.PatentDao"%>
<%@page import="com.uni.web.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="modal-body">
    <%
            User patu = (User)session.getAttribute("currentUser");
            PatentDao pdao = new PatentDao(ConnectionProvider.getConnection());
            ArrayList<Patent> listOfPatent = pdao.getPatent(patu.getUserName());
    %>
    <form id="patent_form" action="PatentServlet" method="post" enctype="multipart/form-data">
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
                            id="patent_id"
                            name="patent_id"
                            />
                        <input
                            type="text"
                            class="form-control"
                            id="patent_user"
                            name="patent_user"
                            style="display:none"
                            value="<%=patu.getUserName() %>"
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
                            id="patent_name"
                            name="patent_name"

                            />
                    </div>
                    <div class="col-6">
                        <label
                            for="recipient-name"
                            class="col-form-label"
                            >AUTHOR UID
                        </label>
                        <input
                            type="text"
                            class="form-control"
                            id="patent_author_uid"
                            name="patent_author_uid"
                            /> 
                        <label
                            for="recipient-name"
                            class="col-form-label"
                            >AUTHOR NAME
                        </label>
                        <input
                            type="text"
                            class="form-control"
                            id="patent_author_name"
                            name="patent_author_name"
                            /> 
                        <div class="form-group ">
                            <label for="input-text">CO-AUTHOR 1 UID</label>
                            <input type="text"
                                   class="form-control"
                                   id="patent_coauthor1"
                                   name="patent_coauthor1"
                                   rows="3"
                                   >
                            <label for="input-text">CO-AUTHOR 1 NAME</label>
                            <input type="text"
                                   class="form-control"
                                   id="patent_coauthor1"
                                   name="patent_coauthor1"
                                   rows="3"
                                   >
                            <label for="input-text">CO-AUTHOR 2 UID</label>
                            <input type="text"
                                   class="form-control"
                                   id="patent_coauthor2"
                                   name="patent_coauthor2_uid"
                                   rows="3"
                                   >
                            <label for="input-text">CO-AUTHOR 2 NAME</label>
                            <input type="text"
                                   class="form-control"
                                   id="patent_coauthor2"
                                   name="patent_coauthor2_name"
                                   rows="3"
                                   >
                        </div>
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
                            id="patent_publish_date"
                            name="patent_publish_date"
                            required
                            />
                        <label for="input-text">CO-AUTHOR 3 UID</label>
                        <input type="text"
                               class="form-control"
                               id="patent_coauthor3_uid"
                               name="patent_coauthor3_uid"
                               rows="3"
                               >

                        <label for="input-text">CO-AUTHOR 3 NAME</label>
                        <input type="text"
                               class="form-control"
                               id="patent_coauthor3_name"
                               name="patent_coauthor3_name"
                               rows="3"
                               >


                        <label for="input-text">CO-AUTHOR 4 UID</label>
                        <input type="text"
                               class="form-control"
                               id="patent_coauthor4_uid"
                               name="patent_coauthor4_uid"
                               rows="3"
                               ><!-- comment -->
                        <label for="input-text">CO-AUTHOR 4 NAME</label>
                        <input type="text"
                               class="form-control"
                               id="patent_coauthor4_name"
                               name="patent_coauthor4_name"
                               rows="3"
                               >

                        <label for="input-text">CO-AUTHOR 5 UID</label>
                        <input type="text"
                               class="form-control"
                               id="patent_coauthor5_uid"
                               name="patent_coauthor5_uid"
                               rows="3"
                               ><!-- comment -->
                        <label for="input-text">CO-AUTHOR 5 NAME</label>
                        <input type="text"
                               class="form-control"
                               id="patent_coauthor5_name"
                               name="patent_coauthor5_name"
                               rows="3"
                               >
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
                            id="patent_grant_date"
                            name="patent_grant_date"
                            required
                            />
                    </div>

                </div>
                <input type="submit" class="form-control mt-4 btn btn-primary" id="patent_add_btn" value="ADD">
            </div>
            <div class="mb-3">
                <table class="table table-bordered" id="patent_table">
                    <%for(Patent patent:listOfPatent){%>
                        <tr>
                            <td><%=patent.getPatentId() %></td>
                            <td><%=patent.getPatentTitle() %></td>
                            <td><%=patent.getAuthorName() %></td>
                            <td><%=patent.getPublishDate() %></td>
                            <td><%=patent.getGrandDate() %></td>
                            <td><button type="button" class="btn btn-danger" onclick="deletePatent(this,'<%=patu.getUserName() %>','<%=patent.getPatentId() %>')">DELETE</button></td>
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
                value="reset"
                >
        </div>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script src="js/OtherPages/FormSubmitData.js"></script>
<script>
    let patentHeading = ["PATENT_ID", "PATENT_TITLE", "PATENT_AUTHOR", "PUBLICATION_DATE", "GRANT_DATE", "ACTION"];
    let patentClassName = ["patent_id", "patent_name", "patent_author_name", "patent_publish_date", "patent_grant_date"];

    let patentTable = $("#patent_table");
    let patentTableRow = [];
    function deletePatent(currentRow,uid,patentId)
    {
         $(currentRow).closest("tr").remove();
         $.ajax({
                    url: "PatentDeleteServlet",
                    method: 'POST',
                    data: {key1: uid, key2: patentId},
                    success: function (data, textStatus, jqXHR) {
                        alert("DATA SUCCESSFULLY DELETED");
                    },
                    error: function (error) {
                        console.log("SOMETHING WENT WRONG");
                    }
                });
    }
    function initPatent() {
        let thead = $("<thead>"); // Create the <thead> element
        let headerRow = $("<tr>"); // Create the <tr> element for header row
        $(patentTable).append(thead);
        $(thead).append(headerRow); // Append the <tr> element to the <thead> element

        for (let x of patentHeading) {
            $(headerRow).append($("<th>").text(x)); // Append the <th> elements to the header row
        }
        $("#patent_form").on("submit", function (event) {
            event.preventDefault();
            if ($('#patent_id').val() == "" && $('#patent_name').val() == "")
            {
                alert("PLEASE ENTER REQUIRED FIELDS");
            } else {
                var $rowData = $("#patent_form").serializeArray();
                var jsonObject = {};
                $.each($rowData, function (index, field) {
                    jsonObject[field.name] = field.value;
                });
                patentTableRow.push(jsonObject);
                trow = $("<tr>");
                for (let x of patentClassName) {
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
                let patentData = new FormData(this);
                formSubmitData(patentData, serverName);
                var $actionsCell = $("<td>");
                var $deleteButton = $('<button type="button" class="btn btn-danger">').text("Delete");
                $deleteButton.val(jsonObject['patent_id']);
            $uid = (jsonObject['patent_user']);
                $deleteButton.click(function () {
                    val = $deleteButton.val();
                    $.ajax({
                    url: "PatentDeleteServlet",
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
                    patentTableRow.splice(index - 1, 1);
                    $(this).closest("tr").remove();
                });
                $actionsCell.append($deleteButton);
                trow.append($actionsCell);
                $(patentTable).append(trow);
                $('#patent_form')[0].reset();
            }

        });
    };


</script>

