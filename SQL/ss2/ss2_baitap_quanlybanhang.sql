drop database if exists quan_ly_ban_hang;

create database if not exists quan_ly_ban_hang;
use quan_ly_ban_hang;

CREATE TABLE customer (
    cID INT,
    cName VARCHAR(45),
    cAge DATE,
    PRIMARY KEY (cID)
);

CREATE TABLE `order` (
    oID INT,
    cID INT,
    oDate DATE,
    oTotalPrice DOUBLE,
    order_cID INT,
    PRIMARY KEY (oID),
    FOREIGN KEY (order_cID)
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