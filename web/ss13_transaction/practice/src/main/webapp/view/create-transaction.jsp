<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<div class="container bg-light h-100 w-50">
    <div class="w-100">
        <form method="post" action="/users?action=create-user-transaction">
        <div align="center">
            <div>
                <h1>User Management</h1>
                <h2>
                    <a class="btn btn-primary" href="/users?action=users" role="button">List All Users</a>
                </h2>
            </div>
                <div>
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
                                <input type="text" name="country" id="country" size="45" required/>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <input type="submit" value="Save"/>
                            </td>
                        </tr>
                    </table>
                </div>
        </div>
        <div class="w-100">
            <div class="list-group" align="center">
                <label class="list-group-item">
                    <input class="form-check-input me-1" name="permision" type="checkbox" value="1">
                    add
                </label>
                <label class="list-group-item">
                    <input class="form-check-input me-1" name="permision" type="checkbox" value="2">
                    edit
                </label>
                <label class="list-group-item">
                    <input class="form-check-input me-1" name="permision" type="checkbox" value="3">
                    delete
                </label>
                <label class="list-group-item">
                    <input class="form-check-input me-1" name="permision" type="checkbox" value="4">
                    view
                </label>
            </div>
        </div>
        </form>
    </div>
</div>
<script src="js/bootstrap.min.js"></script>
</body>
</html>