<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title> Management Application</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
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
                    <a class="btn btn-primary" href="/customer?action=create" role="button">Add New Customer</a>
                </li>
            </ul>
            <form class="d-flex" action="/users?action=findByCountry" method="post">
                <input class="form-control me-2" type="search" name="country" placeholder="Tìm kiếm"
                       aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<div style="text-align: center">
    <h1 class="text-white">Customer</h1>
</div>

<div class="container ">
    <c:if test="${mess!=null}">
        <p class="text-danger" align="center" style="font-size: 50px">${mess}</p>
    </c:if>
    <table class="table table-dark table-striped">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Birthday</th>
            <th>Gender</th>
            <th>Id Card</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Customer Type Name</th>
            <th>Ardress</th>
            <th>Status</th>
            <th colspan="2" style="text-align: center">Actions</th>
        </tr>
        <c:forEach var="customer" items="${customerList}">
            <tr>
                <td><c:out value="${customer.id}"/></td>
                <td><c:out value="${customer.nameCustomer}"/></td>
                <td><c:out value="${customer.birthday}"/></td>
                <c:choose>
                    <c:when test="${customer.gender == false}">
                        <td>Nữ</td>
                    </c:when>
                    <c:when test="${customer.gender == true}">
                        <td>Nam</td>
                    </c:when>
                </c:choose>
                <td><c:out value="${customer.idCard}"/></td>
                <td><c:out value="${customer.phone}"/></td>
                <td><c:out value="${customer.email}"/></td>
                <c:forEach var="CusType" items="${customerTypeList}">
                    <c:if test="${CusType.idCustomerType==customer.customerTypeId}">
                        <td>${CusType.name}</td>
                    </c:if>
                </c:forEach>
                <td><c:out value="${customer.address}"/></td>

                <c:choose>
                    <c:when test="${customer.status == false}">
                        <td>Tồn tại</td>
                    </c:when>
                    <c:when test="${customer.status == true}">
                        <td>Không tồn tại</td>
                    </c:when>
                </c:choose>

                <td style="text-align: center">
                    <a href="/customer?action=edit&id=${customer.id}">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                             class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                            <path fill-rule="evenodd"
                                  d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                        </svg>
                    </a>
                </td>
                <td style="text-align: center">
                    <button onclick="showInfoDelete('${customer.id}','${customer.nameCustomer}')" type="button"
                            class="btn btn-primary"
                            data-bs-toggle="modal" data-bs-target="#delete">
                        Delete
                    </button>
                </td>
            </tr>
        </c:forEach>
    </table>

    <div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form action="/customer?action=deleteCustomer" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <input type="text" id="deleteId" name="idCustomer">
                        <span>Bạn có muốn xóa Customer: </span><span id="deleteName"></span>
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
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
</body>
</html>
