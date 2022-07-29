<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/29/2022
  Time: 7:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang tìm kiếm theo tên</h1>
<a href="/product">Quay lại trang list</a>


<form action="/product?action=findProductByName" method="post">
    <p>Nhập tên sản phẩm cần tìm</p>
    <input type="text" name="nameProduct" placeholder="nhâp tên sản phẩm">
    <br>
    <input type="submit" value="Enter">

</form>
</body>
</html>
