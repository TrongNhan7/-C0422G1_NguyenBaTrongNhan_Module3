<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body class="bg-secondary">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid ">
        <div class="collapse navbar-collapse mt-2" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll " style="--bs-scroll-height: 100px;">
                <li class="nav-item">
                    <a class="btn btn-primary" href="/users" role="button">Home</a>
                </li>
                <li class="nav-item ms-3">
                    <a class="btn btn-primary" href="/users?action=create" role="button">Add New User</a>
                </li>
                <li class="nav-item ms-3">
                    <a class="btn btn-primary" href="/users?action=create-user-transaction" role="button">Add New User
                        Transaction</a>
                </li>
                <li class="nav-item ms-3">
                    <form action="/users?action=selectUserSortName" method="post">

                        <button type="submit" class="btn btn-primary">Sort</button>
                    </form>
                </li>
            </ul>
            <form class="d-flex" action="/users?action=findByCountry" method="post">
                <input class="form-control me-2" type="search" name="country" placeholder="Tìm kiếm theo country"
                       aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<div style="text-align: center">
    <h1>User Management</h1>
</div>

<div class="container ">
    <table class="table table-dark table-striped">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Country</th>
            <th colspan="2" style="text-align: center">Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td style="text-align: center">
                    <a href="/users?action=edit-SP&id=${user.id}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                             class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                            <path fill-rule="evenodd"
                                  d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                        </svg>
                    </a>
                </td>
                <td style="text-align: center">
                    <button onclick="showInfoDelete('${user.id}','${user.name}')" type="button" class="btn btn-primary"
                            data-bs-toggle="modal" data-bs-target="#delete">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>

    <div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="/users?action=delete-by-SP" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="text"  id="deleteid" name="id">
                        <span>Bạn có muốn xóa user: </span><span id="deleteName"></span>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-secondary">Delete</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

</div>
<script src="js/bootstrap.min.js"></script>
<script>
    function showInfoDelete(id, name) {
        document.getElementById("deleteid").value = id;
        document.getElementById("deleteName").innerText = name;
        // document.getElementById("delete1").innerHTML ='<a href="/users?action=delete-by-SP&id='+id+'">Delete</a>'
    }
</script>
</body>
</html>