-- Validate Data on the Target Tables
DROP TABLE IF EXISTS Simpro_Customers_Error_Logs;

CREATE TABLE Simpro_Customers_Error_Logs (
  errorId INTEGER PRIMARY KEY AUTOINCREMENT,
  errorField VARCHAR(255),
  errorMessage VARCHAR(255),
  customerId INTEGER,
  title VARCHAR(5),
  firstName VARCHAR(255),
  lastName VARCHAR(255),
  fullName VARCHAR(510),
  preferredName VARCHAR(255),
  streetNumber VARCHAR(255),
  address VARCHAR(255),
  city VARCHAR(255),
  zipcode VARCHAR(10),
  email VARCHAR(255)
);

-- Insert data into the Simpro_Customers_Error_Logs table
--1) Error with first character of address causing street number to be lost
INSERT INTO Simpro_Customers_Error_Logs (
  customerId,
  errorField,
  errorMessage,
  title,
  firstName,
  lastName,
  preferredname,
  fullName,
  streetnumber,
  address,
  city,
  zipcode,
  email
)
SELECT
  c.customerId,
  'Address1' AS errorField,
  'Street number is null' AS errorMessage,
  null AS title,
  c.firstName,
  c.lastName,
  c.firstName AS preferredname, 
  c.firstName || ' ' || c.lastName AS fullName,
  SUBSTR(c.address, 1, INSTR(c.address, ' ') - 1) AS streetnumber,
  SUBSTR(c.address, INSTR(c.address, ' ') + 1) AS address,
  UPPER(c.city) AS city,
  c.zipcode,
  c.email
FROM customer c
JOIN target_Customers tc on c.customerId=tc.customerId 
WHERE tc.streetNumber IS NULL OR tc.streetNumber = '';

--2) Error with spaces in email address
INSERT INTO Simpro_Customers_Error_Logs (
  customerId,
  errorField,
  errorMessage,
  title,
  firstName,
  lastName,
  preferredname,
  fullName,
  streetnumber,
  address,
  city,
  zipcode,
  email
)
SELECT
  c.customerId,
  'Email1' AS errorField,
  'Space in Email' AS errorMessage,
  null AS title,
  c.firstName,
  c.lastName,
  c.firstName AS preferredname, 
  c.firstName || ' ' || c.lastName AS fullName,
  SUBSTR(c.address, 1, INSTR(c.address, ' ') - 1) AS streetnumber,
  SUBSTR(c.address, INSTR(c.address, ' ') + 1) AS address,
  UPPER(c.city) AS city,
  c.zipcode,
  c.email
FROM customer c
WHERE c.email LIKE ' %' OR c.email LIKE '% ' OR c.email LIKE '% %'  ;
