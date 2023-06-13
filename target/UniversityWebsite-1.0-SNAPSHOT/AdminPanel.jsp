<%-- 
    Document   : AdminPanel
    Created on : 19 Apr, 2023, 10:52:56 AM
    Author     : Deepanshu
--%>

<%@page import="com.uni.web.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

        <title>Hello, world!</title>
    </head>
    <body>

        <div class="container">
            <h1 class="display-5 ms-5">USER OPERATION</h1>
            <table class="table table-dark" id="user-table">
                <thead>
                    <tr>
                        <th scope="col">Serial Number</th>
                        <th scope="col">Name</th>
                        <th scope="col">UID</th>
                        <th scope="col">Action</th>
                        <th scope="col">View</th>
                    </tr>
                </thead>
                <form action="UpdateUsersServlet" method="post" id="userUpdateForm">
                    <tbody>

                        <%
                                List<User> listOfUsers = (ArrayList<User>) request.getAttribute("students");
                                int i = 0;
                                String status;
                                for (User user : listOfUsers) {
                                        out.println("<tr>");
                        %>
                    <td><%= i%></td>
                    <td><%= user.getFirstName() + " " + user.getLastName()%></td>
                    <td><%= user.getUserName()%></td>
                    <td><input name="Action" type="checkbox" <%if (user.isEnabled()) {
                                    status = "checked";
                            } else {
                                    status = "unchecked";
			    }%>
                               <%=status%>></td>
                    <td><input name="View"type="checkbox" <%if (user.isVisible()) {
                                    status = "checked";
                            } else {
                                    status = "unchecked";
			    }%>
                               <%=status%>></td>
                        <%
                                        i += 1;
                                        out.println("</tr>");
				}%>
                    </tbody>
            </table>
            <input class="btn btn-primary" type="submit" >
            <!-- comment --></form>
        </div>

        <!-- Optional JavaScript; choose one of the two! -->

        <!-- Option 1: Bootstrap Bundle with Popper -->

        <!-- Option 2: Separate Popper and Bootstrap JS -->
        <!--
            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        -->
    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            var $table = $('#user-table');
            $('#userUpdateForm').on('submit', function (event)
            {
                var data = [];
                event.preventDefault();
                $table.find('tbody tr').each(function () {
                    var $row = $(this);
                    var rowData = {
                        uid: $row.find('td:nth-child(3)').text(),
                        action: $row.find('td:nth-child(4) input').is(":checked"),
                        viewData: $row.find('td:nth-child(5) input').is(":checked")

                    };
                    data.push(rowData);
                });
                console.log(JSON.stringify(data));
                // Submit the data to the server using AJAX
                $.ajax({
                    url: 'UpdateUserServlet',
                    method: 'POST',
                    data: {jsondata: JSON.stringify(data)},
                    success: function (data, textStatus, jqXHR) {
                        console.log("SUCCESS");
                    },
                    error: function (error) {
                        console.log("Unsuccess");
                    }
                });
            });
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
</html>