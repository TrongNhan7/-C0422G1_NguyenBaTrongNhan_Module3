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
<a href="/product?action=add">Thêm mới sản phẩm</a>
<form method="post" action="/product?action=findProductByName">
    <p>Nhập tên sản phẩm cần tìm</p>
    <input type="text" name="nameProduct" placeholder="nhâp tên sản phẩm">
    <br>
    <button type="submit">Tìm</button>
</form>

<table border="1">
    <tr>
        <th>STT</th>
        <th>id</th>
        <th>nameProduct</th>
        <th>priceProduct</th>
        <th>descriptionProduct</th>
        <th>manufactory</th>

    </tr>

    <c:forEach var="product" items="${productList}" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.id}</td>
            <td>${product.nameProduct}</td>
            <td>${product.priceProduct}</td>
            <td>${product.descriptionProduct}</td>
            <td>${product.manufactory}</td>
            <td><a href="/product?action=edit&id=${product.id}">edit</a></td>

            <td><a href="/product?action=delete&id=${product.id}">delete</a></td>

            <td><a href="/product?action=getProductById&id=${product.id}">getProduct</a></td>

        </tr>
    </c:forEach>

</table>
<br>

<a href="/product">Quay lại trang chủ</a>

</body>
</html>
