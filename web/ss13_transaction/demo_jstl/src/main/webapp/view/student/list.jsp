<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 7/28/2022
  Time: 10:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--thư viện jstl--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
<h1> Trang danh sách</h1>
<a href="/student?action=add">Thêm mới sinh viên</a>
<a href="/student?action=transaction">Call Transaction</a>
<c:if test="${mess!=null}">
    <p class="text-danger">${mess}</p>
</c:if>
<table class="table table-dark">
    <tr>
        <th>STT</th>
        <th>id</th>
        <th>name</th>
        <th>birthday</th>
        <th>gender</th>
        <th>point</th>
        <th>Rank</th>
        <th>email</th>
        <th>account</th>
        <th>class Name</th>
        <th>Delete</th>
    </tr>
    <c:forEach var="student" items="${studentList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${student.getId()}</td>
            <td>${student.getName()}</td>
            <td>${student.getBirthday()}</td>

            <c:if test="${student.isGender()}">
                <td>Nam</td>
            </c:if>
            <c:if test="${!student.isGender()}">
                <td>Nữ</td>
            </c:if>

            <td>${student.getPoint()}</td>

                <%--              them cột xếp loại--%>
            <c:choose>
                <c:when test="${student.getPoint()>=8}">
                    <td>Giỏi</td>
                </c:when>
                <c:when test="${student.getPoint()>=7}">
                    <td>Khá</td>
                </c:when>
                <c:when test="${student.getPoint()>=5}">
                    <td>Trung bình</td>
                </c:when>
                <c:otherwise>
                    <td>Quá yếu</td>
                </c:otherwise>
            </c:choose>
            <td>${student.getEmail()}</td>
            <td>${student.getAccount()}</td>
            <c:forEach var="cls" items="${classList}">
                <c:if test="${cls.id==student.getClassId()}">
                    <td>${cls.name}</td>
                </c:if>
            </c:forEach>
            <td>
                <button onclick="showInfoDelete('${student.id}','${student.name}')" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
</table>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/student?action=delete" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="text" name="deleteId" id="deleteId">
                    <span>Bạn có muốn xóa học viên: </span><span id="deleteName"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    function showInfoDelete(id,name) {
        document.getElementById("deleteId").value= id;
        document.getElementById("deleteName").innerText=name;

    }
</script>
</body>
</html>
