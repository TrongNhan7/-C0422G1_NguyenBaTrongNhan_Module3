<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View product</title>
</head>
<body>
<h1>Product details</h1>
<p>
    <a href="/customers">Back to product list</a>
</p>
<table>
    <tr>
        <td>Name Product:</td>
        <td>${product.nameProduct}</td>
    </tr>
    <tr>
        <td>Price Product:</td>
        <td>${product.priceProduct}</td>
    </tr>
    <tr>
        <td>Product description:</td>
        <td>${product.descriptionProduct}</td>
    </tr>
    <tr>
        <td>Manufactory:</td>
        <td>${product.manufactory}</td>
    </tr>
</table>
</body>
</html>
