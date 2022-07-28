<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/28/2022
  Time: 6:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test="${secondNumber == 0}"><h1>Mẫu không thể là 0</h1></c:if>
<c:if test="${secondNumber != 0}"> <h1>Result : ${firstNumber} ${operator} ${secondNumber} = ${result}</h1></c:if>
</body>
</html>
