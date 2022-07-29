<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 7/28/2022
  Time: 10:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Edit product</title>
</head>
<body>
<h1>Edit product</h1>
<p>
    <c:if test='${message != null}'>
        <span class="message">${message}</span>
    </c:if>
</p>
<p>
    <a href="/product">Back to product list</a>
</p>
<form method="post">
    <fieldset>
        <legend>Product information</legend>
        <table>
            <tr>
                <td>Name: </td>
                <td><input type="text" name="nameProduct" id="nameProduct" value="${product.nameProduct}"></td>
            </tr>
            <tr>
                <td>Price: </td>
                <td><input type="text" name="priceProduct" id="priceProduct" value="${product.priceProduct}"></td>
            </tr>
            <tr>
                <td>Product Description: </td>
                <td><input type="text" name="descriptionProduct" id="descriptionProduct" value="${product.descriptionProduct}"></td>
            </tr>
            <tr>
                <td>Producer: </td>
                <td><input type="text" name="manufactory" id="manufactory" value="${product.manufactory}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Edit product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>