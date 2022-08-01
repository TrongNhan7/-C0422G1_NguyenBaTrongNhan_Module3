<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container bg-light h-100">
    <div style="text-align: center">
        <h1>User Management</h1>
        <h2>
            <a class="btn btn-primary" href="/users?action=users" role="button">List All Users</a>
        </h2>
    </div>
    <div align="center">
        <form method="post" action="/users?action=create">
            <table border="1" cellpadding="5">
                <tr>
                    <th>User Name:</th>
                    <td>
                        <input type="text" name="name" id="name" size="45" required/>
                    </td>
                </tr>
                <tr>
                    <th>User Email:</th>
                    <td>
                        <input type="email" name="email" id="email" size="45" required/>
                    </td>
                </tr>
                <tr>
                    <th>Country:</th>
                    <td>
                        <input type="text" name="country" id="country" size="15" required/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" value="Save"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script src="js/bootstrap.min.js"></script>
</body>
</html>