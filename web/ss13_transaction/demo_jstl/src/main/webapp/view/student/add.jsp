<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 7/29/2022
  Time: 11:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang thêm mới</h1>
<a href="/student">Quay lại trang list</a>
<c:if test="${mess!=null}">
    <p>${mess}</p>
</c:if>

<form action="/student?action=add" method="post">
    <table>
<%--                <tr>--%>
<%--                    <td>ID</td>--%>
<%--                    <td><input type="text" name="id" placeholder="nhâp id"></td>--%>
<%--                </tr>--%>
        <tr>
            <td>Tên</td>
            <td><input type="text" name="name" placeholder="nhâp tên"></td>
        </tr>
        <tr>
            <td>Giới tính</td>
            <td>
                <input type="radio" name="gender" value="true"> nam
                <input type="radio" name="gender" value="false">nữ
            </td>
        </tr>
        <tr>
            <td>NGày sinh</td>
            <td><input type="date" name="birthday"></td>
        </tr>
        <tr>
            <td>Điểm</td>
            <td>
                <input type="text" name="point" placeholder="nhập điểm">

            </td>
        </tr>
<%--                <tr>--%>
<%--                    <td>Account</td>--%>
<%--                    <td><input type="text" name="account" placeholder="nhập account"></td>--%>
<%--                </tr>--%>
        <tr>
            <td>Class id</td>
            <td>
                <select name="classId">
                    <option value="">Chọn -lơp</option>
                    <c:forEach var="cls" items="${classList}">
                        <option value="${cls.id}"> ${cls.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email" placeholder="nhập email"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button type="submit">Lưu</button>
            </td>
        </tr>
    </table>

</form>
</body>
</html>
