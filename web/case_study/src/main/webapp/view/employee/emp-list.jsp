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
                    <button type="button" class="btn btn-primary"
                            data-bs-toggle="modal" data-bs-target="#addNewEmployee">
                        Add New Employee
                    </button>
                </li>
            </ul>
            <form class="d-flex" action="/employee?action=findByCountry" method="post">
                <input class="form-control me-2" type="search" name="country" placeholder="Tìm kiếm"
                       aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<div style="text-align: center">
    <h1 class="text-white">Employee</h1>
</div>

<div class="container ">
    <table class="table table-dark table-striped">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>date_of_birth</th>
            <th>Id Card</th>
            <th>Phone</th>
            <th>Email</th>
            <th>Salary</th>
            <th>Education Degree Id</th>
            <th>Position Id</th>
            <th>Division</th>
            <th colspan="2" style="text-align: center">Actions</th>
        </tr>
        <%--        <c:forEach var="employee" items="${employeeList}">--%>
        <tr>
            <td><c:out value="${employee.id}"/>ádasd</td>
            <td><c:out value="${employee.nameEmployee}"/></td>
            <td><c:out value="${employee.date_of_birth}"/></td>
            <td><c:out value="${employee.idCard}"/></td>
            <td><c:out value="${employee.phone}"/></td>
            <td><c:out value="${employee.email}"/></td>
            <td><c:out value="${employee.salary}"/></td>
            <td><c:out value="${employee.educationDegreeId}"/></td>
            <td><c:out value="${employee.positionId}"/></td>
            <td><c:out value="${employee.division}"/></td>

            <td style="text-align: center">
                <button onclick="showInfoEdit('${employee.id}','${employee.nameEmployee}',
                        '${employee.date_of_birth}','${employee.idCard}','${employee.phone}'
                        ,'${employee.email}','${employee.salary}','${employee.educationDegreeId}',
                        '${employee.positionId}','${employee.division}')" type="button"
                        class="btn btn-primary"
                        data-bs-toggle="modal" data-bs-target="#editEmployee">
                    Edit
                </button>
            </td>
            <td style="text-align: center">
                <button onclick="showInfoDelete('${employee.id}','${employee.nameEmployee}')" type="button"
                        class="btn btn-primary"
                        data-bs-toggle="modal" data-bs-target="#delete">
                    Delete
                </button>
            </td>
        </tr>
        <%--        </c:forEach>--%>
    </table>

</div>

<!-- Modal delete -->
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

<!-- Modal -->
<div class="modal fade" id="addNewEmployee" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/employee?action=createEmployee" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel3">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12">
                        <label for="name" class="form-label">Name Employee</label>
                        <input type="text" class="form-control" id="name" name="nameEmployee" required>
                    </div>
                    <div class="col-md-12">
                        <label for="birthday" class="form-label">Birthday</label>
                        <input type="date" class="form-control" id="birthday" name="date_of_birth" required>
                    </div>

                    <div class="col-md-12">
                        <label for="idCard" class="form-label">Id Card </label>
                        <input type="text" class="form-control" id="idCard" name="idCard" required>
                    </div>
                    <div class="col-md-12">
                        <label for="phone" class="form-label">Phone</label>
                        <input type="number" class="form-control" id="phone" name="phone" required>
                    </div>
                    <div class="col-md-12">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="col-md-12">
                        <label for="salary" class="form-label">Email</label>
                        <input type="number" class="form-control" id="salary" name="salary" required>
                    </div>
                    <div class="col-md-12 ">
                        <label for="education" class="form-label">Education Degree Id</label>
                        <select name="education" id="education">
                            <option value="1">Trung cấp</option>
                            <option value="2">Cao đẳng</option>
                            <option value="3">Đại học</option>
                            <option value="4">Sau Đại học</option>
                        </select>
                    </div>
                    <div class="col-md-12 ">
                        <label for="position" class="form-label">Position</label>
                        <select name="position" id="position">
                            <option value="1">Lễ tân</option>
                            <option value="2">Phục vụ</option>
                            <option value="3">Chuyên viên</option>
                            <option value="4">Giám sát</option>
                            <option value="5">Quản lý</option>
                            <option value="6">Giám đốc</option>
                        </select>
                    </div>
                    <div class="col-md-12 ">
                        <label for="division" class="form-label">Division</label>
                        <select name="division" id="division">
                            <option value="1">Sale-Marketing</option>
                            <option value="2">Hành chính</option>
                            <option value="3">Phục vụ</option>
                            <option value="4">Quản lý</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>

            </div>
        </form>
    </div>
</div>

<!-- Edit -->
<div class="modal fade" id="editEmployee" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/employee?action=editEmployee" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel4">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="col-md-12">
                        <label for="nameEdit" class="form-label">Name Employee</label>
                        <input type="text" class="form-control" id="nameEdit" name="nameEmployee" required>
                    </div>
                    <div class="col-md-12">
                        <label for="birthdayEdit" class="form-label">Birthday</label>
                        <input type="date" class="form-control" id="birthdayEdit" name="date_of_birth" required>
                    </div>

                    <div class="col-md-12">
                        <label for="idCardEdit" class="form-label">Id Card </label>
                        <input type="text" class="form-control" id="idCardEdit" name="idCard" required>
                    </div>
                    <div class="col-md-12">
                        <label for="phoneEdit" class="form-label">Phone</label>
                        <input type="number" class="form-control" id="phoneEdit" name="phone" required>
                    </div>
                    <div class="col-md-12">
                        <label for="emailEdit" class="form-label">Email</label>
                        <input type="email" class="form-control" id="emailEdit" name="email" required>
                    </div>
                    <div class="col-md-12">
                        <label for="slaryEdit" class="form-label">Email</label>
                        <input type="number" class="form-control" id="slaryEdit" name="salary" required>
                    </div>
                    <div class="col-md-12 ">
                        <label for="educationEdit" class="form-label">Education Degree Id</label>
                        <select name="education" id="educationEdit">
                            <option value="1">Trung cấp</option>
                            <option value="2">Cao đẳng</option>
                            <option value="3">Đại học</option>
                            <option value="4">Sau Đại học</option>
                        </select>
                    </div>
                    <div class="col-md-12 ">
                        <label for="positionEdit" class="form-label">Position</label>
                        <select name="position" id="positionEdit">
                            <option value="1">Lễ tân</option>
                            <option value="2">Phục vụ</option>
                            <option value="3">Chuyên viên</option>
                            <option value="4">Giám sát</option>
                            <option value="5">Quản lý</option>
                            <option value="6">Giám đốc</option>
                        </select>
                    </div>
                    <div class="col-md-12 ">
                        <label for="divisionEdit" class="form-label">Division</label>
                        <select name="division" id="divisionEdit">
                            <option value="1">Sale-Marketing</option>
                            <option value="2">Hành chính</option>
                            <option value="3">Phục vụ</option>
                            <option value="4">Quản lý</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary">Save changes</button>
                </div>

            </div>
        </form>
    </div>
</div>
<script src="js/bootstrap.min.js"></script>
<script>
    function showInfoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }
    function showInfoEdit(id,nameEmployee,date_of_birth,idCard,phone,email,
                          salary,educationDegreeId,positionId,division) {
        document.getElementById("deleteId").value = id;
        document.getElementById("nameEdit").value = nameEmployee;
        document.getElementById("birthdayEdit").value = date_of_birth;
        document.getElementById("idCardEdit").value = idCard;
        document.getElementById("phoneEdit").value = phone;
        document.getElementById("emailEdit").value = email;
        document.getElementById("salaryEdit").value = salary;
        document.getElementById("educationEdit").value = educationDegreeId;
        document.getElementById("positionEdit").value = positionId;
        document.getElementById("divisionEdit").value = division;
    }
</script>
</body>
</html>

