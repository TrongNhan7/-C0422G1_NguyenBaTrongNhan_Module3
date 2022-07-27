<%--
  Created by IntelliJ IDEA.
  User: This PC
  Date: 7/27/2022
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
    <link rel="stylesheet" href="bootstrap%205\css\bootstrap.css">
  </head>
  <body>
  <h1> Ứng dụng Product Discount Calculator</h1>
  <form action="/discount-percent" method="post">
    <div class="input-group mb-3">
      <span class="input-group-text">Nhập mô tả sản phẩm</span>
      <span class="input-group-text"></span>
      <input type="text"  class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
    </div>

    <div class="input-group mb-3">
      <span class="input-group-text">Giá sản phẩm</span>
      <span class="input-group-text">$</span>
      <input type="number" name="list_price" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
    </div>

    <div class="input-group mb-3">
      <span class="input-group-text">Phần trăm chiếc khấu</span>
      <span class="input-group-text">%</span>
      <input type="number" name="discount_percent" class="form-control" aria-label="Dollar amount (with dot and two decimal places)">
    </div>
    <div class="text-center bg-primary" >
      <button type="submit" class="rounded-3 bg-dark text-white"  style="width: 500px;height: 500px;font-size: 100px">Tính</button>
    </div>
  </form>
  </body>
</html>
