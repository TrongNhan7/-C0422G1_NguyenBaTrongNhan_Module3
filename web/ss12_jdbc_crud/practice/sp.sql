drop database if exists procedure_ss13;
create database procedure_ss13;
use demo;

DELIMITER $$
CREATE PROCEDURE get_user_by_id(IN user_id INT)
BEGIN
    SELECT users.`name`, users.email, users.country
    FROM users
    where users.id = user_id;
    END$$
DELIMITER ;
call get_user_by_id(6);

DELIMITER $$
CREATE PROCEDURE insert_user(
IN user_name varchar(50),
IN user_email varchar(50),
IN user_country varchar(50)
)
BEGIN
    INSERT INTO users(name, email, country) VALUES(user_name, user_email, user_country);
END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE get_list_users()
BEGIN
    SELECT *
    FROM users;
    END$$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE edit_user(in id_edit int,in name_edit varchar(55), in email_edit varchar(55), in country_edit varchar(55))
BEGIN
    update users
    set `name` = name_edit,
	email = email_edit,
    country = country_edit
    where id = id_edit;
    END$$
DELIMITER ;
call edit_user(6,"daThu2","dathu@gmail.com","VN");

DELIMITER $$
CREATE PROCEDURE delete_By_SP(in user_id int)
BEGIN
 set sql_safe_updates = 0;
    delete 
    FROM users
    where users.id = user_id;
set sql_safe_updates = 1;
    END$$
DELIMITER ;
call delete_By_SP(6);
select * from users;

