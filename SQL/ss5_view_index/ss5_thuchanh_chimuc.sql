drop database if exists ss5_thuchanh_chimuc_sql;

create database ss5_thuchanh_chimuc_sql;
USE `classicmodels`;

explain select * 
from customers 
where customerName = 'Land of Toys Inc.';

ALTER TABLE customers ADD INDEX idx_customerName(customerName);
EXPLAIN SELECT * FROM customers WHERE customerName = 'Land of Toys Inc.'; 

ALTER TABLE customers ADD INDEX idx_full_nameidx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';

ALTER TABLE customers DROP INDEX idx_full_name;







