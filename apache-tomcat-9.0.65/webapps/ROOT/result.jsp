<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/27/2022
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="bootstrap%205\css\bootstrap.css">
    <style>
        body{
            background-image: url("https://i.imgur.com/ovkEwZ9.jpg");
        }
    </style>
</head>
<body>
<div class="container-fluid " >
    <div class="row">
        <div class="col-lg-6 d-flex align-items-center justify-content-center">
            <div class="d-inline p-2 bg-primary text-white text-center "
            style="margin-top: 200px;height: 50px;">Lượng chiếc khấu:${discount_amount}</div>
        </div>
        <div class="col-lg-6 d-flex align-items-center justify-content-center">
            <div class="d-inline p-2 bg-dark text-white text-center "
                 style="margin-top: 200px;height: 50px;" >Giá sau khi chiếc khấu:${discount_price}</div>
        </div>
    </div>
</div>
</body>
</html>
