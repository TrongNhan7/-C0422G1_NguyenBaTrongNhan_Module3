<%--
  Created by IntelliJ IDEA.
  User: PC
  Date: 8/3/2022
  Time: 7:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${mess!=null}">
    <h1>${mess}</h1>
</c:if>
<form action="/login" method="post">
    <input name="username" placeholder="nhập username">
    <input name="password" placeholder="nhập password">
    <button>Login</button>
</form>

</body>
</html>
