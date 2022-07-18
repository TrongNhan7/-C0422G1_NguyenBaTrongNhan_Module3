drop database if exists ss3_baitap_sinhvien;

create database ss3_baitap_sinhvien;
use ss3_thuchanh_qlsv;

SELECT 
    *
FROM
    Class;

SELECT 
    *
FROM
    Student
WHERE
    StudentName LIKE 'h%';

SELECT 
    *
FROM
    Class
WHERE
    MONTH(StartDate) = 12;
    
SELECT 
    *
FROM
    `Subject`
WHERE
    Credit BETWEEN 3 AND 5;
    
set sql_safe_updates = 0;
UPDATE Student 
SET 
    ClassId = '2'
WHERE
    StudentName = 'Hung';
set sql_safe_updates = 1;

SELECT 
    S.StudentName, Sub.SubName, M.Mark
FROM
    Student S
        INNER JOIN
    Mark M ON S.StudentId = M.StudentId
        INNER JOIN
    `Subject` Sub ON M.SubId = Sub.SubId
ORDER BY M.Mark DESC , S.StudentName;




