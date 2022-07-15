drop database if exists ss3_baitap_qlbh;

create database ss3_baitap_qlbh;
use ss3_baitap_qlbh;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng `Order`--
SELECT 
    oID,oDate,oTotalPrice
FROM
    quan_ly_ban_hang.`order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách --
SELECT 
    C.cName, P.pName
FROM
    quan_ly_ban_hang.customer C
        INNER JOIN
    quan_ly_ban_hang.`order` O ON C.cID = O.cID
        INNER JOIN
    quan_ly_ban_hang.orderDetail OD ON O.oID = OD.oID_detail
        INNER JOIN
    quan_ly_ban_hang.Product P ON OD.pID_detail = P.pID;
    
    
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào --   
SELECT 
    C.cName
FROM
    quan_ly_ban_hang.customer C
        LEFT JOIN
    quan_ly_ban_hang.`order` O ON C.cID = O.cID
WHERE
    O.oDate IS NULL;
    
    
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn --
SELECT 
    O.oID, O.oDate, SUM(odQTY * pPrice)
FROM
    quan_ly_ban_hang.`order` O
        JOIN
    quan_ly_ban_hang.orderDetail OD ON O.oID = OD.oID_detail
        INNER JOIN
    quan_ly_ban_hang.Product P ON OD.pID_detail = P.pID
GROUP BY oID;



