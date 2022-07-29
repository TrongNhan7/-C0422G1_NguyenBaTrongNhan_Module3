<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/29/2022
  Time: 8:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<table border="1">
    <tr>
        <th>STT</th>
        <th>id</th>
        <th>nameProduct</th>
        <th>priceProduct</th>
        <th>descriptionProduct</th>
        <th>manufactory</th>

    </tr>
    <c:forEach var="product" items="${productList}" >
        <tr>
            <td>${product.id}</td>
            <td>${product.nameProduct}</td>
            <td>${product.priceProduct}</td>
            <td>${product.descriptionProduct}</td>
            <td>${product.manufactory}</td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
