drop database if exists ss3_baitap_qlbh;

create database ss3_baitap_qlbh;
use quan_ly_ban_hang;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng `Order`--
SELECT 
    oID,oDate,oTotalPrice
FROM
    `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách --
SELECT 
    C.cName, P.pName
FROM
   customer C
        INNER JOIN
    `order` O ON C.cID = O.cID
        INNER JOIN
    orderDetail OD ON O.oID = OD.oID_detail
        INNER JOIN
    Product P ON OD.pID_detail = P.pID;
    
    
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào --   
SELECT 
    C.cName
FROM
    customer C
        LEFT JOIN
   `order` O ON C.cID = O.cID
WHERE
    O.oDate IS NULL;
    
    
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn --
SELECT 
    O.oID, O.oDate, SUM(odQTY * pPrice)
FROM
    `order` O
        JOIN
   orderDetail OD ON O.oID = OD.oID_detail
        INNER JOIN
    Product P ON OD.pID_detail = P.pID
GROUP BY oID;



