drop database if exists quan_ly_ban_hang;

create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;

CREATE TABLE customer (
    cID INT,
    cName VARCHAR(45),
    cAge TINYINT,
    PRIMARY KEY (cID)
);

CREATE TABLE `order` (
    oID INT,
    cID INT,
    oDate DATETIME,
    oTotalPrice DOUBLE,
    PRIMARY KEY (oID),
    FOREIGN KEY (cID)
        REFERENCES customer (cID)
);

CREATE TABLE Product (
    pID INT,
    pName VARCHAR(45),
    pPrice DOUBLE,
    PRIMARY KEY (pID)
);

CREATE TABLE orderDetail (
    oID_detail INT,
    pID_detail INT,
    odQTY INT,
    PRIMARY KEY (oID_detail , pID_detail),
    FOREIGN KEY (oID_detail)
        REFERENCES `order` (oID),
    FOREIGN KEY (pID_detail)
        REFERENCES Product (pID)
);

insert into customer(cID,cName,cAge)
values (1,"Minh Quan",10),
	(2,"Ngoc Oanh",20),
	(3,"Hong Ha",50);

insert into `order`(oID,cID,oDate,oTotalPrice)
values (1,1,"2006-03-21",null),
	(2,2,"2006-03-23",null),
	(3,1,"2006-03-16",null);
    
insert into Product( pID, pName,pPrice)
values (1,"May Giat",3),
	(2,"Tu Lanh",5),
	(3,"Dieu Hoa",7),
	(4,"Quat",1),
	(5,"Bep Dien",2);

insert into orderDetail( oID_detail, pID_detail,odQTY)
values (1,1,3),
	(1,3,7),
	(1,4,2),
	(2,1,1),
	(3,1,8),
	(2,5,4),
	(2,3,3);
    


    
