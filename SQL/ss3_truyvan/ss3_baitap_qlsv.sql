drop database if exists ss3_baitap_sinhvien;

create database ss3_baitap_sinhvien;
use ss3_baitap_sinhvien;

SELECT 
    *
FROM
    ss3_thuchanh_qlsv.Class;

SELECT 
    *
FROM
    ss3_thuchanh_qlsv.Student
WHERE
    StudentName LIKE 'h%';

SELECT 
    *
FROM
   ss3_thuchanh_qlsv.Class
WHERE
    MONTH (StartDate) = 12;
    
SELECT 
    *
FROM
    ss3_thuchanh_qlsv.`Subject`
WHERE
    Credit BETWEEN 3 AND 5;
    
set sql_safe_updates = 0;
UPDATE ss3_thuchanh_qlsv.Student 
SET 
    ClassId = '2'
WHERE
    StudentName = 'Hung';
set sql_safe_updates = 1;

SELECT 
    S.StudentName, Sub.SubName, M.Mark
FROM
    ss3_thuchanh_qlsv.Student S
        INNER JOIN
    ss3_thuchanh_qlsv.Mark M ON S.StudentId = M.StudentId
        INNER JOIN
    ss3_thuchanh_qlsv.`Subject` Sub ON M.SubId = Sub.SubId
ORDER BY M.Mark DESC , S.StudentName;




