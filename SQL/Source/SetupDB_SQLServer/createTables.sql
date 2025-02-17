-- SQLite
--select * from employee;

-- ADD Contraints & FKS

CREATE TABLE employee (
employeeId INTEGER PRIMARY KEY,
firstName varchar(50),
lastName varchar(50),
title varchar(50),
startDate datetime,
managerId int
);

CREATE TABLE customer (
customerId INTEGER IDENTITY(1,1) PRIMARY KEY,
firstName varchar(50),
lastName varchar(50),
address varchar(150),
city varchar(100),
zipcode varchar(15),
email varchar(255)
);

CREATE TABLE model (
modelId INTEGER IDENTITY(1,1) PRIMARY KEY,
model varchar(100),
EngineType varchar(25) -- petrol, diesel, electric
);

CREATE TABLE inventory (
inventoryId INTEGER IDENTITY(1,1) PRIMARY KEY,
modelId int,
colour varchar(50),
year varchar(4),
isAvailable bit
);

CREATE TABLE sales (
salesId INTEGER IDENTITY(1,1) PRIMARY KEY,
inventoryId int,
customerId int,
employeeId int,
salesAmount decimal(6,2),
soldDate datetime
);