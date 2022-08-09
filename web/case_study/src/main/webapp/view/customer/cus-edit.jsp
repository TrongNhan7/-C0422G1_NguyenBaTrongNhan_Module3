<%@ page import="model.customer.Customer" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-dark">
    <div class="container-fluid ">
        <div class="collapse navbar-collapse mt-2" id="navbarScroll">
            <ul class="navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll " style="--bs-scroll-height: 100px;">
                <li class="nav-item">
                    <a class="btn btn-primary" href="/index.jsp" role="button">Home</a>
                </li>
                <li class="nav-item ms-3">
                    <a class="btn btn-primary" href="/customer" role="button">Back to List</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<c:if test="${mess!=null}">
    <p class="text-danger " align="center" style="font-size: 50px">${mess}</p>
</c:if>
<div class="container bg-light w-50 h-100">
    <h1>Edit Customer</h1>
    <form action="/customer?action=edit" method="post">
        <table>
            <% Customer customer = (Customer) request.getAttribute("customer");%>
            <input type="hidden" name="id" value="<%=customer.getId()%>">
            <input type="hidden" name="status" value="<%=customer.isStatus()%>">

            <div class="col-md-12">
                <span class="text-danger">${name}</span>
                <label for="name" class="form-label">Name Customer</label>
                <input type="text" class="form-control" id="name" name="nameCustomer"
                       value="<c:out value='<%=customer.getNameCustomer()%>'/>" required>
            </div>
            <div class="col-md-12">
                <label for="birthday" class="form-label">Birthday</label>
                <input type="date" class="form-control" id="birthday" name="birthday"
                       value="<c:out value='<%=customer.getBirthday()%>'/>" required>
            </div>

            <div class="col-md-12">
                <span class="text-danger">${cmnd}</span>
                <label for="idCard" class="form-label">Id Card </label>
                <input type="text" class="form-control" id="idCard" name="idCard"
                       value="<c:out value='<%=customer.getIdCard()%>'/>" required>
            </div>
            <div class="col-md-12">
                <span class="text-danger">${phone}</span>
                <label for="phone" class="form-label">Phone</label>
                <input type="number" class="form-control" id="phone" name="phone"
                       value="<c:out value='<%=customer.getPhone()%>'/>" required>
            </div>
            <div class="col-md-12">
                <span class="text-danger">${email}</span>
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email"
                       value="<c:out value='<%=customer.getEmail()%>'/>" required>
            </div>

            <div class="col-md-12 ">
                <label for="address" class="form-label">Address</label>
                <input type="text" class="form-control" id="address" name="address"
                       value="<c:out value='<%=customer.getAddress()%>'/>" required>
            </div>

            <div class="col-md-12">
                <label for="gender" class="form-label">Gender</label>
                <select name="gender" id="gender">
                    <option value="0">Nữ</option>
                    <option value="1">Nam</option>
                </select>
            </div>
            <div class="col-md-12 ">
                <label for="CustomerTypeId" class="form-label">CustomerTypeId</label>
                <select name="customerTypeId" id="CustomerTypeId">
                    <option value="1">Diamond</option>
                    <option value="2">Platium</option>
                    <option value="3">Gold</option>
                    <option value="4">Silver</option>
                    <option value="5">Member</option>
                </select>
            </div>

            <div class="col-12 mt-3" align="center">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>
        </table>
    </form>
</div>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
