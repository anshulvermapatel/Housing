<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
          integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <!-- Custom CSS -->
    <link href="<c:url value="/resources/css/main.css"/>" rel="stylesheet">
</head>
<body>


<div class="container">

    <!-- header -->
    <jsp:include page="header.jsp"></jsp:include>
    <!-- header -->

    <h2>List of applied houses:</h2>
    <c:forEach var="application" items="${applications}">
        <br>
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">Student ID: ${application.studentid}, Time: ${application.time}</h4>
                <p class="card-text">House ID: ${application.houseid} <br>
                    Email: ${application.email} <br>
                    Message: ${application.message}</p>
                <a href="/delete_application?applicationId=${application.id}" onclick="return confirm('Delete this application?')">delete</a>
            </div>
        </div>
        <br>
    </c:forEach>

    <!-- footer -->
    <jsp:include page="footer.jsp"></jsp:include>
    <!-- footer -->

</div>
<!-- /container -->


<!-- Optional JavaScript -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
        integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
        integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
        crossorigin="anonymous"></script>
</body>
</html>