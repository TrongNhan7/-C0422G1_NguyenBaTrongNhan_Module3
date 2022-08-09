<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap520/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap5.min.css"/>
</head>
<body class="bg-secondary">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid ">
        <div class="collapse navbar-collapse mt-2" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll " style="--bs-scroll-height: 100px;">
                <li class="nav-item">
                    <a class="btn btn-primary" href="/index.jsp" role="button">Home</a>
                </li>
                <li class="nav-item ms-3">
                    <a class="btn btn-primary" href="/customer" role="button">Customer</a>
                </li>
                <li class="nav-item ms-3">
                    <a class="btn btn-primary" href="/employee" role="button">Employee</a>
                </li>
                <li class="nav-item ms-3">
                    <a class="btn btn-primary" href="/contract" role="button">Contract</a>
                </li>
                <li class="nav-item ms-3">
                    <a class="btn btn-primary" href="/facility?action=create" role="button">Add new Facility</a>
                </li>
                <li class="nav-item ms-3">
                    <a class="btn btn-primary" href="/facility" role="button">Back to list</a>
                </li>
            </ul>
            <form class="d-flex" action="/facility?action=findByName" method="post">
                <input class="form-control me-2" type="search" name="name" placeholder="Tìm kiếm theo tên"
                       aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<div style="text-align: center">
    <h1 class="text-white">Facility</h1>
</div>
<c:if test="${mess!=null}">
    <p class="text-danger" align="center" style="font-size: 50px">${mess}</p>
</c:if>
<table class="table table-striped table-bordered table table-dark table-striped" id="tableFacility">
    <thead>
    <tr>
        <th>ID</th>
        <th>Service Type</th>
        <th>Name</th>
        <th>Area</th>
        <th>Cost</th>
        <th>Max people</th>
        <th>Rent Type ID</th>
        <th>Standard room</th>
        <th>Convenience</th>
        <th>Pool Area</th>
        <th>Number of floors</th>
        <th>Facility Free</th>
        <th style="text-align: center">Actions</th>
        <th style="text-align: center">Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="facility" items="${facilityList}">
        <tr>
            <td>${facility.id}</td>
            <td>
                <c:forEach var="facilityTypes" items="${facilityTypes}">
                    <c:if test="${facilityTypes.facilityTypeId==facility.serviceTypeId}">
                        ${facilityTypes.facilityTypeName}
                    </c:if>
                </c:forEach>
            </td>
            <td>${facility.nameService}</td>
            <td>${facility.area}</td>
            <td>${facility.cost}</td>
            <td>${facility.maxPeople}</td>
            <td>
                <c:forEach var="rentType" items="${rentTypeServices}">
                    <c:if test="${rentType.rentTypeId==facility.rentTypeId}">
                        ${rentType.rentTypeName}
                    </c:if>
                </c:forEach>
            </td>
            <td>${facility.standardRoom}</td>
            <td>${facility.descriptionOtherConvenience}</td>
            <td>${facility.areaPool}</td>
            <td>${facility.numberOfFloors}</td>
            <td>${facility.serviceFree}</td>
            <td style="text-align: center">
                <a href="/facility?action=edit&id=${facility.id}">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                         class="bi bi-pencil-square" viewBox="0 0 16 16">
                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                        <path fill-rule="evenodd"
                              d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                    </svg>
                </a>
            </td>
            <td style="text-align: center">
                <button onclick="showInfoDelete('${facility.id}','${facility.nameService}')" type="button"
                        class="btn btn-primary"
                        data-bs-toggle="modal" data-bs-target="#delete">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/facility?action=deleteFacility" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" id="deleteId" name="idFacility">
                    <span>Bạn có muốn xóa Facility: </span><span id="deleteName"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-secondary">Delete</button>
                </div>
            </div>
        </form>
    </div>
</div>


<%--                <c:choose>--%>
<%--                    <c:when test="${facility.serviceTypeId == 1}">--%>
<%--                        <td><c:out value="${facility.standardRoom}"/></td>--%>
<%--                        <td><c:out value=" ${facility.descriptionOtherConvenience}"/></td>--%>
<%--                        <td><c:out value=" ${facility.areaPool}"/></td>--%>
<%--                        <td><c:out value=" ${facility.numberOfFloors}"/></td>--%>
<%--                        <td> X</td>--%>
<%--                    </c:when>--%>
<%--                    <c:when test="${facility.serviceTypeId == 2}">--%>
<%--                        <td><c:out value="${facility.standardRoom}"/></td>--%>
<%--                        <td><c:out value="${facility.descriptionOtherConvenience}"/></td>--%>
<%--                        <td> X</td>--%>
<%--                        <td><c:out value="${facility.numberOfFloors}"/></td>--%>
<%--                        <td> X</td>--%>
<%--                    </c:when>--%>
<%--                    <c:when test="${facility.serviceTypeId == 3}">--%>
<%--                        <td> X</td>--%>
<%--                        <td> X</td>--%>
<%--                        <td> X</td>--%>
<%--                        <td> X</td>--%>
<%--                        <td><c:out value=" ${facility.facilityFree}"/></td>--%>
<%--                    </c:when>--%>
<%--                </c:choose>--%>
<script src="js/bootstrap.min.js"></script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableFacility').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
<script>
    function showInfoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
</body>
</html>