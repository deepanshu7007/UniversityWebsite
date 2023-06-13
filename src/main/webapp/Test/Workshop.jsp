<%@page import="com.uni.web.entities.userdetail.Workshop"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.uni.web.dao.WorkshopDao"%>
<%@page import="com.uni.web.helper.ConnectionProvider"%>
<%@page import="com.uni.web.entities.User"%>
<form action="WorkshopServlet" method="POST" id="workshop_form" enctype="multipart/form-data">
    <div class="modal-body">

        <div class="mb-3">
            <div class="container mb-3">
                <div class="row row-cols-4">

                    <div class="col-11">

                        <label
                            for="recipient-name"
                            class="col-form-label"
                            >WORKSHOP_ID
                        </label>
                        <input
                            type="text"
                            class="form-control"
                            id="workshop_user"
                            name="workshop_user"
                            <%User wu = (User) session.getAttribute("currentUser");%>
                            value="<%=wu.getUserName()%>"
                            style="display:none";
                            />
                        <input
                            type="text"
                            class="form-control"
                            id="workshop_id"
                            name="workshop_id"

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
                            id="workshop_name"
                            name="workshop_name"
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
                            name="workshop_date"
                            id="workshop_date"
                            required
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
                            id="workshop_location"
                            name="workshop_location"
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
                            name="workshop_topic"
                            id="workshop_topic"
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
                            id="workshop_organiser"
                            name="workshop_organiser"
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
                            id="workshop_schedule"
                            name="workshop_schedule"
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
                            id="workshop_material"
                            name="workshop_material"
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
                            id="workshop_website"
                            name="workshop_website"
                            />
                    </div>
                </div>
            </div>
            <input type="submit" value="save" class="btn btn-primary"/>
        </div>
        <div class="mb-3">
            <table class="table table-bordered" id="workshop_table">
                    <%WorkshopDao wd = new WorkshopDao(ConnectionProvider.getConnection());
                    User wou = (User)session.getAttribute("currentUser");
                    ArrayList<Workshop> listOfWorkshop = wd.getWorkshop(wou.getUserName());
                    %>
                    <%for(Workshop workshop: listOfWorkshop){%>
                        <tr>
                            <td><%=workshop.getWorkshopAlias() %></td>
                            <td><%=workshop.getWorkshopName() %></td>
                            <td><%=workshop.getWorkshopTopic() %></td>
                            <td><%=workshop.getWorkshopOrganiser() %></td>
                            <td><button type="button" class="btn btn-danger" onclick="deleteWorkshop(this,'<%=workshop.getWorkshopAlias() %>','<%=wou.getUserName() %>')">DELETE</button></td>
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
            value="Reset"
            >




    </div>
</form>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"></script>
<script>
    let workshopHeading = ["WORKSHOP_ID", "WORKSHOP_NAME", "WORKSHOP_TOPIC", "WORKSHOP_ORGANISER", "ACTION"];
    let workshopClassName = ["workshop_id", "workshop_name", "workshop_topic", "workshop_organiser"];
    let workshopTableRow = [];
    let workshopTable = $("#workshop_table");

function deleteWorkshop(currentRow,workshopAlias,uid)
{
    console.log("workshop"+uid);
    $(currentRow).closest("tr").remove();
    $.ajax({
                    url: "WorkshopDeleteServlet",
                    method: 'POST',
                    data: {key1: uid, key2: workshopAlias},
                    success: function (data, textStatus, jqXHR) {
                        alert("DATA SUCCESSFULLY DELETED");
                    },
                    error: function (error) {
                        console.log("SOMETHING WENT WRONG");
                    }
                });
}

    function initWorkshop() {
        let thead = $("<thead>"); // Create the <thead> element
        let headerRow = $("<tr>"); // Create the <tr> element for header row
        $(workshopTable).append(thead);
        $(thead).append(headerRow); // Append the <tr> element to the <thead> element

        for (let x of workshopHeading) {
            $(headerRow).append($("<th>").text(x)); // Append the <th> elements to the header row
        }

    }
    $("#workshop_form").on("submit", function (event) {
        event.preventDefault();
        if ($('#workshop_id').val() == "" && $('#workshop_name').val() == "")
        {
            alert("enter valid values");
        } else {
            var $rowData = $("#workshop_form").serializeArray();
            var jsonObject = {};
            $.each($rowData, function (index, field) {
                jsonObject[field.name] = field.value;
            });
            workshopTableRow.push(jsonObject);
            trow = $("<tr>");
            for (let x of workshopClassName) {
                console.log("x:" + x);
                for (let y of $rowData) {
                    console.log("y:" + y['value'])
                    if (x === y['name']) {
                        let tdata = $("<td>").text(y['value']);
                        $(trow).append(tdata);

                    }
                }
            }
            var $actionsCell = $("<td>");
            var $deleteButton = $('<button class="btn btn-danger">').text("Delete");
            let workshopData = new FormData(this);
            formSubmitData(workshopData, "WorkshopServlet");
            $deleteButton.val(jsonObject['workshop_id']);
            $uid = (jsonObject['workshop_user'])
            $deleteButton.click(function (event) {
                event.preventDefault();
                val = ($deleteButton.val());

                $.ajax({
                    url: "WorkshopDeleteServlet",
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
            $(workshopTable).append(trow);
            $('#workshop_form')[0].reset();
        }
    });

</script>

