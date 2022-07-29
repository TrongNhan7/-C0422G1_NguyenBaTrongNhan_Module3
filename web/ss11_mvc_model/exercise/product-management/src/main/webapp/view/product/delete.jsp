<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deleting customer</title>
</head>
<body>
<h1>Delete product</h1>
<p>
    <a href="/product">Back to product list</a>
</p>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product information</legend>
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

            <tr>
                <td><input type="submit" value="Delete product"></td>
                <td><a href="/product">Back to product list</a></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
