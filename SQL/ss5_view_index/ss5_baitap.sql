drop database if exists ss5_baitap;

create database ss5_baitap;
use ss5_baitap;

-- Bước 2: Tạo bảng Products với các trường dữ liệu sau --

CREATE TABLE products (
    id INT AUTO_INCREMENT,
    productCode INT NOT NULL,
    productName VARCHAR(55) NOT NULL,
    productPrice DOUBLE NOT NULL,
    productAmount DOUBLE NOT NULL,
    productDescription VARCHAR(100),
    productStatus VARCHAR(55),
    PRIMARY KEY (id)
);

-- .Chèn một số dữ liệu mẫu cho bảng Products. --

insert into products(productCode,productName,productPrice,productAmount,productDescription,productStatus)
values (0010,"Bcs",500,5,"hang ngon","tot"),
 (0341,"ABC",1500,4,"vip","cùi"),
 (0696,"NVS",1200,20,"vinh hoi nach","tot"),
 (0210,"HJL",700,6,"Duc cong","ngon"),
 (0017,"Truong",500,5,"im lang","cùi"),
 (0610,"Bcs12",90,15,"hang ngon","tot"),
 (0012,"Bcs32",50000,1,"hang ngon","tot"),
 (1111,"Bcs532",1500,5,"hang ngon","tot"),
 (0011,"Bcs123",50001,3,"hang ngon","tot");
 
 
-- Bước 3 Tao index --

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục) --

CREATE UNIQUE INDEX index_products
	ON products(productCode);
EXPLAIN 
	SELECT *
	FROM products
	WHERE productCode = 10;
DROP INDEX index_products
	ON products;

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice) --

ALTER TABLE  products
	ADD INDEX idx_productName_Price(productName,productPrice);
EXPLAIN SELECT *
	FROM products
	WHERE productName = "Bcs";
ALTER TABLE products
	DROP INDEX idx_productName_Price;
    
-- B4 Tao view --

CREATE VIEW products_view AS
    SELECT 
        productCode, productName, productPrice, productStatus
    FROM
        products;

select * from products_view;

-- Tiến hành sửa đổi view --
CREATE OR REPLACE VIEW products_view AS
    SELECT 
        productCode, productName, productPrice
    FROM
        products
    WHERE
        productName = 'HJL';

-- Tiến hành xoá view --

drop view products_view;

-- b5. Tạo store procedure --

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product--
DELIMITER //

CREATE PROCEDURE findAllProducts()

BEGIN
  SELECT * FROM products;
END //

DELIMITER ;

call findAllProducts();

-- Tạo store procedure thêm một sản phẩm mới--
DELIMITER $$

CREATE PROCEDURE add_products(in productCode INT ,
    productName VARCHAR(55) ,
    productPrice DOUBLE ,
    productAmount DOUBLE ,
    productDescription VARCHAR(100),
    productStatus VARCHAR(55))
begin
	insert into products (productCode,productName, productPrice, 
				productAmount,productDescription,productStatus)
	values (productCode,productName, productPrice, 
			productAmount,productDescription,productStatus);
END $$

DELIMITER ;

call add_products(1233,"has",100,6,"ngon","cùi");

-- Tạo store procedure sửa thông tin sản phẩm theo id
DROP PROCEDURE IF EXISTS edit_product;
DELIMITER $$
CREATE PROCEDURE edit_product(in product_id int,product_code INT ,
    products_name VARCHAR(55) ,
    products_price DOUBLE ,
    products_amount DOUBLE ,
    products_description VARCHAR(100),
    products_status VARCHAR(55)) 
BEGIN 
	SET sql_safe_updates = 0;
	UPDATE products 
SET 
    productCode = product_code,
    productName = products_name,
    productPrice = products_price,
    productAmount = products_amount,
    productDescription = products_description,
    productStatus = products_status
WHERE
    id = product_id;
    SET sql_safe_updates = 1;
END $$
DELIMITER ;


-- gọi--
CALL edit_product(4,145,"ads",150,16,"ngon","cùi");

-- Tạo store procedure xoá sản phẩm theo id --
DELIMITER $$

CREATE PROCEDURE delete_products(in product_id int)
begin
    delete from products
    where id=product_id;
end $$

DELIMITER ;

call delete_products(5);
call findAllProducts();


