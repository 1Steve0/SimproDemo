CREATE TABLE IF NOT EXISTS employee (
employeeId INTEGER PRIMARY KEY,
firstName varchar(50),
lastName varchar(50),
title varchar(50),
startDate TIMESTAMP,
managerId int
);

CREATE TABLE IF NOT EXISTS customer (
customerId BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
firstName varchar(50),
lastName varchar(50),
address varchar(150),
city varchar(100),
zipcode varchar(15),
email varchar(255)
);

CREATE TABLE IF NOT EXISTS model (
modelId BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
model varchar(100),
EngineType varchar(25) -- petrol, diesel, electric
);

CREATE TABLE IF NOT EXISTS inventory (
inventoryId BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
modelId int,
colour varchar(50),
year varchar(4),
isAvailable BOOLEAN
);

CREATE TABLE IF NOT EXISTS sales (
salesId BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
inventoryId int,
customerId int,
employeeId int,
salesAmount decimal(6,2),
soldDate TIMESTAMP
);