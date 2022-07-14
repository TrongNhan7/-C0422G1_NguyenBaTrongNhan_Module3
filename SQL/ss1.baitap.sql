create database student_management;
use student_management;
create table class (
id_class int auto_increment,
name_class varchar(45),
primary key (id_class)
);

insert into class(name_class) values("C04"),("C01"),("C02");
select * from class;

create table teacher (
id_teacher int auto_increment,
name_teacher varchar(55),
date_of_birth date,
country varchar(45),
primary key (id_teacher)
);

insert into teacher(name_teacher,date_of_birth,country) values("Trung","1990-09-20","India"),
("Dũng","1980-09-25","America"),("Hoàng","1995-07-15","Việt Nam");
select * from teacher;
alter table teacher add gender_teacher text;

set sql_safe_updates =0;
update teacher set gender_teacher = "Nam"
where name_teacher = "Trung";
set sql_safe_updates =1;

