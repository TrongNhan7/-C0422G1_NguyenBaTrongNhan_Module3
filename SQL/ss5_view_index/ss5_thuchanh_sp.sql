create database  ss5_thuchanh_store_procedure;
use `classicmodels`;

DELIMITER //
CREATE PROCEDURE findAllCustomers()
BEGIN
  SELECT * FROM customers;
END //
DELIMITER ;

call findAllCustomers();


DELIMITER //
DROP PROCEDURE IF EXISTS `findAllCustomers`//

CREATE PROCEDURE findAllCustomers()

BEGIN

SELECT * FROM customers where customerNumber = 175;

END //
DELIMITER ;

call findAllCustomers();