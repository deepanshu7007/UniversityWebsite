<%-- 
    Document   : Conference
    Created on : 13 May, 2023, 4:04:14 PM
    Author     : Deepanshu
--%>

<%@page import="com.uni.web.entities.userdetail.Conference"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.uni.web.dao.ConferenceDao"%>
<%@page import="com.uni.web.helper.ConnectionProvider"%>
<%@page import="com.uni.web.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% ConferenceDao cd = new ConferenceDao(ConnectionProvider.getConnection());
User cu = (User)session.getAttribute("currentUser");
ArrayList<Conference> listOfConference = cd.getConference(cu.getUserName());
%>
<form id="conference_form" action="ConferenceServlet" method="POST" enctype="multipart/form-data">
    <div class="modal-body">
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
                            id="conference_user"
                            name="conference_user"
                            <%User u =  (User)session.getAttribute("currentUser"); %>
                            value="<%=u.getUserName()%>"
                            style="display:none";
                            />
                        <input
                            type="text"
                            class="form-control"
                            id="conference_id"
                            name="conference_id"
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
                            id="conference_name"
                            name="conference_name"
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
                            value="online"
                            id="conference_mode"
                            name="conference_mode"
                            checked
                            /> ONLINE
                        <input
                            type="radio"
                            value="offline"
                            id="conference_mode"
                            name="conference_mode"
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
                            id="conference_location"
                            name="conference_location"
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
                            name="conference_date"
                            value="2023-11-25"
                            class="form-control"
                            id="conference_date"
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
                            name="conference_topic"
                            id="conference_topic"
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
                            name="conference_organiser"
                            id="conference_organiser"
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
                            id="conference_abstract"
                            name="conference_abstract"
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
                            id="conference_poster"
                            name="conference_poster"
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
                            id="conference_certificate"
                            name="conference_certificate"

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
                            id="conference_others"
                            name="conference_others"
                            />

                    </div>
                </div>
            </div>
            <input type="submit" class="btn btn-primary" value="submit"/>
            ADD
        </div>
        <div class="mb-3">
            <table class="table table-bordered" id="conference_table">
                    <%for(Conference conference:listOfConference){%>
                    <tr>
                    <td><%=conference.getConferenceAlias() %> </td>
                    <td><%=conference.getConferenceName() %></td>
                    <td><%=conference.getConferenceTopic() %></td>
                    <td><%=conference.getConferenceDate() %></td>
                    <td><button type="button" class="btn btn-danger" onclick="deleteConference(this,'<%=conference.getConferenceUID() %>','<%=conference.getConferenceAlias() %>')">DELETE</button></td>
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
            />
    </div>
</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script>
    let conferenceHeading = ["ID", "NAME", "TOPIC", "DATE", "ACTION"];
    let conferenceClassName = ["conference_id", "conference_name", "conference_topic", "conference_date"];

    let conferenceTable = $("#conference_table");
    let conferenceTableRow = [];

function deleteConference(currentRow,uid,conferenceAlias)
{
    $(currentRow).closest("tr").remove();
    $.ajax({
        url: "ConferenceDeleteServlet",
        method: 'POST',
        data: {key1:uid,key2:conferenceAlias},
        success: function (data, textStatus, jqXHR) {
            alert("DATA SUCCESSFULLY DELETED");
        },
        error: function (error) {
            console.log("SOMETHING WENT WRONG");
        }
    });
    
}
    function initConference() {
        let thead = $("<thead>"); // Create the <thead> element
        let headerRow = $("<tr>"); // Create the <tr> element for header row
        $(conferenceTable).append(thead);
        $(thead).append(headerRow); // Append the <tr> element to the <thead> element
        for (let x of conferenceHeading) {
            $(headerRow).append($("<th>").text(x)); // Append the <th> elements to the header row
        }
    }
    $("#conference_form").on("submit", function (event) {
        event.preventDefault();
        if ($('#conference_id').val() == "" && $('#conference_name').val() == "")
        {
            alert("enter valid values");
        } else {
            var $rowData = $("#conference_form").serializeArray();
            var jsonObject = {};
            $.each($rowData, function (index, field) {
                jsonObject[field.name] = field.value;
            });
            conferenceTableRow.push(jsonObject);
            trow = $("<tr>");
            for (let x of conferenceClassName) {
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
            var $deleteButton = $('<button type = "button" class="btn btn-danger">').text("Delete");
            let formData = new FormData(this);
            formSubmitData(formData,"ConferenceServlet");
            $deleteButton.val(jsonObject['conference_id']);
            $uid = (jsonObject['conference_user'])
            $deleteButton.click(function (event) {
        event.preventDefault();        
        val = ($deleteButton.val());
               
                 $.ajax({
        url: "ConferenceDeleteServlet",
        method: 'POST',
        data: {key1:$uid,key2:val},
        success: function (data, textStatus, jqXHR) {
            alert("DATA SUCCESSFULLY DELETED");
        },
        error: function (error) {
            console.log("SOMETHING WENT WRONG");
        }
    });
                var index = $(this).closest("tr").index();
                conferenceTableRow.splice(index - 1, 1);
                $(this).closest("tr").remove();
            });
            $actionsCell.append($deleteButton);
            trow.append($actionsCell);
            $(conferenceTable).append(trow);
            $('#conference_form')[0].reset();
        }
    });

</script>

