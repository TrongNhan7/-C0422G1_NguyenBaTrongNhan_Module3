<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/28/2022
  Time: 3:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <style>
        div {
            margin: 20px;
        }
    </style>
</head>
<body>
<h1>Simple Calculator</h1>
<form method="post" action="/calculator">
    <fieldset >
        <legend>Calculator</legend>
        <div>
            <span>First operand</span>
            <input type="number" name="firstNumber">
        </div>
        <div>
            <select name="operator">
                <option value="+">Add</option>
                <option value="-">Subtraction</option>
                <option value="*">Multiplication</option>
                <option value="/">Division</option>
            </select>
        </div>
        <div>
            <span>Second operand</span>
            <input type="number" name="secondNumber">
        </div>

        <td><input type="submit" value="Calculate"/></td>
    </fieldset>
</form>
</body>
</html>
