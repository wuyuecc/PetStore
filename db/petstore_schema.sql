CREATE DATABASE  IF NOT EXISTS  petstore;

use petstore;

CREATE TABLE IF NOT EXISTS account (
    userid varchar(80) not null,
    password varchar(25)  not null,
    name varchar(80) not null,
PRIMARY KEY (userid));

CREATE TABLE IF NOT EXISTS product (
    productid varchar(10) not null,
    category varchar(10) not null,
    cname varchar(80) null,
    ename varchar(80) null,
    image varchar(20) null,
    price decimal(10,2) null,
PRIMARY KEY (productid));

CREATE TABLE IF NOT EXISTS orders (
    orderid bigint not null,
    userid varchar(80) not null,
    orderdate datetime not null,
    status int not null default 0,	
    amount decimal(10,2) not null,
PRIMARY KEY (orderid));

CREATE TABLE IF NOT EXISTS ordersdetail (
    orderid bigint not null,
    productid varchar(10) not null,
    quantity int not null,
    unitcost decimal(10,2) null,
PRIMARY KEY (orderid, productid));