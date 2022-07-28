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
</head>
<body>
<h1> Trang danh sách</h1>
<table border="1">
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
        <th>class Id</th>
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
            <td>${student.getClassId()}</td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
