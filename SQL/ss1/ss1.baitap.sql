drop database if exists student_management;

create database student_management;
use student_management;

CREATE TABLE class (
    id_class INT AUTO_INCREMENT,
    name_class VARCHAR(45),
    PRIMARY KEY (id_class)
);

insert into class(name_class)
values("C04"),("C01"),("C02");
SELECT 
    *
FROM
    class;

CREATE TABLE teacher (
    id_teacher INT AUTO_INCREMENT,
    name_teacher VARCHAR(55),
    date_of_birth DATE,
    country VARCHAR(45),
    PRIMARY KEY (id_teacher)
);

insert into teacher(name_teacher,date_of_birth,country)
values ("Trung","1990-09-20","India"),
	("Dũng","1980-09-25","America"),
    ("Hoàng","1995-07-15","Việt Nam");

SELECT 
    *
FROM
    teacher;
alter table teacher
add gender_teacher text;

set sql_safe_updates =0;
UPDATE teacher 
SET 
    gender_teacher = 'Nam'
WHERE
    name_teacher = 'Trung';
set sql_safe_updates =1;

