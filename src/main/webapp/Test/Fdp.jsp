<%-- 
    Document   : Fdp
    Created on : 13 May, 2023, 4:04:25 PM
    Author     : Deepanshu
--%>

<%@page import="com.uni.web.entities.userdetail.FDP"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.uni.web.dao.FdpDao"%>
<%@page import="com.uni.web.helper.ConnectionProvider"%>
<%@page import="com.uni.web.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%User fu = (User) session.getAttribute("currentUser"); %>
<%
        FdpDao fdo = new FdpDao(ConnectionProvider.getConnection());
        ArrayList<FDP> listOfFdp = fdo.getFdp(fu.getUserName());
%>

<form id="fdp_form" action="FdpServlet" enctype="multipart/form-data">
    <div class="modal-body">
        <div class="mb-3">
            <div class="container mb-3">
                <div class="row row-cols-4">
                    <div class="col-11">
                        <label
                            for="recipient-name"
                            class="col-form-label"
                            >FDP ID
                        </label>
                        <input
                            type="text"
                            class="form-control"
                            id="fdp_id"
                            name="fdp_id"
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
                            id="fdp_name"
                            name="fdp_name"
                            />
                        <input
                            type="text"
                            class="form-control"
                            id="fdp_user"
                            name="fdp_user"

                            value ="<%=fu.getUserName()%>"
                            style="display:none"
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
                            id="fdp_duration"
                            name="fdp_duration"

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
                            id="fdp_location"
                            name="fdp_location"
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
                            id="fdp_topic"
                            name="fdp_topic"
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
                            id="fdp_website"
                            name="fdp_website"
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
                            id="fdp_outcome"
                            name="fdp_outcome"
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
                            id="fdp_certificate"
                            name="fdp_certificate"
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
                            id="fdp_other"
                            name="fdp_other"
                            />
                    </div>
                </div>
            </div>
            <input type="submit" value="save" class="btn btn-primary">
        </div>
        <div class="mb-3">
            <table class="table" id="fdp_table">
                <% for (FDP fdp : listOfFdp) {%>
                <tr>
                    <td><%=fdp.getFdpAlias()%></td>
                    <td><%=fdp.getFdpName()%></td>
                    <td><%=fdp.getFdpName()%></td>
                    <td><%=fdp.getFdpLocation()%></td>
                    <td><button type="button" class="btn btn-danger" onclick="removeCurrentRow(this,'<%=fdp.getFdpAlias() %>','<%=fdp.getFdpUid() %>')">DELETE</button></td>
                </tr>
                <%}%>
            </table>
        </div>

    </div>
    <div class="modal-footer">
        <button
            type="reset"
            class="btn btn-secondary"
            data-bs-dismiss="modal"
            >
            Reset
        </button>
    </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" ></script>
<script src="js/OtherPages/FormSubmitData.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js">
        
</script>
<script>
    let fdpHeading = ["ID", "NAME", "TOPIC", "LOCATION", "ACTION"];
    let fdpClassName = ["fdp_id", "fdp_name", "fdp_topic", "fdp_location"];

    let fdpTable = $("#fdp_table");
    let fdpTableRow = [];
function removeCurrentRow(currentRow,x,y)
        {
            console.log(currentRow);
            console.log(x);
            console.log(y);
            $(currentRow).closest("tr").remove();
            $.ajax({
                        url: "FdpDeleteServlet",
                        method: 'POST',
                        data: {key1: y, key2: x},
                        success: function (data, textStatus, jqXHR) {
                            alert("DATA SUCCESSFULLY DELETED");
                        },
                        error: function (error) {
                            console.log("SOMETHING WENT WRONG");
                        }
                    });
        }
    function initFdp() {
        let thead = $("<thead>"); // Create the <thead> element
        let headerRow = $("<tr>"); // Create the <tr> element for header row
        $(fdpTable).append(thead);
        $(thead).append(headerRow); // Append the <tr> element to the <thead> element

        for (let x of fdpHeading) {
            $(headerRow).append($("<th>").text(x)); // Append the <th> elements to the header row
        }
        $("#fdp_form").on("submit", function (event) {
            event.preventDefault();
            var serverName = $(this).attr("action");
            if ($('#fdp_id').val() == "" && $('#fdp_name').val() == "")
            {
                alert("enter valid values");
            } else {
                let formData = new FormData(this);
                formSubmitData(formData, serverName);
                var $rowData = $("#fdp_form").serializeArray();
                var jsonObject = {};
                $.each($rowData, function (index, field) {
                    jsonObject[field.name] = field.value;
                });
                fdpTableRow.push(jsonObject);
                trow = $("<tr>");
                for (let x of fdpClassName) {
                    console.log("x:" + x);
                    for (let y of $rowData) {
                        console.log("y:" + y['name'])
                        if (x === y['name']) {
                            let tdata = $("<td>").text(y['value']);
                            $(trow).append(tdata);

                        }
                    }
                }
                var $actionsCell = $("<td>");
                var $deleteButton = $('<button type="button" class="btn btn-danger">').text("Delete");
                $deleteButton.val(jsonObject['fdp_id']);
                $uid = (jsonObject['fdp_user'])
                $deleteButton.on("click", function (event) {
                    event.preventDefault();
                    val = ($deleteButton.val());
                    console.log("delete button pressed");
                    $.ajax({
                        url: "FdpDeleteServlet",
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
                    workshopTableRow.splice(index - 1, 1);
                    $(this).closest("tr").remove();
                });
                $actionsCell.append($deleteButton);
                trow.append($actionsCell);
                $(fdpTable).append(trow);
                $('#fdp_form')[0].reset();
            }
        });
    }

</script>



