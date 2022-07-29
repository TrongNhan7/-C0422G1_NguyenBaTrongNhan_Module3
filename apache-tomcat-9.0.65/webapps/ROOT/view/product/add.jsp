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
<a href="/product">Quay lại trang list</a>
<c:if test="${mess!=null}">
    <p>${mess}</p>
</c:if>

<form action="/product?action=add" method="post">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="text" name="id" placeholder="nhâp id"></td>
        </tr>
        <tr>
            <td>Tên sản phẩm</td>
            <td><input type="text" name="nameProduct" placeholder="nhâp tên sản phẩm"></td>
        </tr>
        <tr>
            <td>Giá sản phẩm</td>
            <td><input type="text" name="priceProduct" placeholder="nhâp giá sản phẩm"></td>
        </tr>
        <tr>
            <td>Mô tả sản phẩm</td>
            <td><input type="text" name="descriptionProduct" placeholder="nhâp mô tả sản phẩm"></td>
        </tr>
        <tr>
            <td>Nhà sản xuất</td>
            <td><input type="text" name="manufactory" placeholder="nhâp nhà sản xuất"></td>
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
