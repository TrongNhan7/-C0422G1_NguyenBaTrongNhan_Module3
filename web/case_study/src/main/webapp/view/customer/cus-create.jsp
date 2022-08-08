<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
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


</div>
<c:if test="${mess!=null}">
    <p class="text-danger" align="center" style="font-size: 50px">${mess}</p>
</c:if>
<div class="container-fluid ">
    <div class="row">
        <div class="col-lg-3">
            <img src="img\4056083.jpg" class="w-100 " style="height: 300px">
            <img src="img\biet-thu.jpg" class="w-100 mt-3" style="height: 300px">
        </div>
        <div class="col-lg-6">
            <h1>Create Customer</h1>
            <form action="/customer?action=create" method="post">
                <table>
                    <div class="col-md-12">
                        <label for="name" class="form-label">Name Customer</label>
                        <input type="text" class="form-control" id="name" name="nameCustomer" required>
                        <div style="color: red">
                            ${name}
                        </div>
                    </div>
                    <div class="col-md-12">
                        <label for="birthday" class="form-label">Birthday</label>
                        <input type="date" class="form-control" id="birthday" name="birthday" required>
                    </div>

                    <div class="col-md-12">
                        <label for="idCard" class="form-label">Id Card </label>
                        <input type="text" class="form-control" id="idCard" name="idCard" required>
                        <div style="color: red">
                            ${Cmnd}
                        </div>
                    </div>
                    <div class="col-md-12">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="number" class="form-control" id="phone" name="phone" required>
                        <div style="color: red">
                            ${phone}
                        </div>
                    </div>
                    <div class="col-md-12">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                        <div style="color: red">
                            ${phone}
                        </div>
                    </div>

                    <div class="col-md-12 ">
                        <label for="address" class="form-label">Address</label>
                        <input type="text" class="form-control" id="address" name="address" required>
                    </div>

                    <div class="col-md-12">
                        <label for="gender" class="form-label">Gender</label>
                        <select name="gender" id="gender" >
                            <option value="0">Nữ</option>
                            <option value="1">Nam</option>
                        </select>
                    </div>
                    <div class="col-md-12 ">
                        <label for="customerTypeId" class="form-label">CustomerTypeId</label>
                        <select name="customerTypeId" id="customerTypeId">
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
        <div class="col-lg-3">
            <img src="img\4056083.jpg" class="w-100 " style="height: 300px">
            <img src="img\biet-thu.jpg" class="w-100 mt-3" style="height: 300px">
        </div>
    </div>
</div>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
