--Insert Data into Target Table Customers
INSERT INTO target_Customers (
  customerId,
  title,
  firstName,
  lastName,
  preferredname,
  fullName,
  streetNumber,
  address,
  city,
  zipcode,
  email
)
SELECT 
  c.customerId,
  null AS title,
  c.firstName,
  c.lastName,
  c.firstName as preferredname, 
  c.firstName || ' ' || c.lastName AS fullName,
  --Example of error fix splitting street number and address:
  --First attempt:-- error with space not splitting street number and street name
  --SUBSTR(c.address, 1, INSTR(c.address, ' ') - 1) AS streetnumber, 

  --Second attempt: if c.address is null then this statement returns 0. We dont want 0 inserted as a number if it is not provide.
  --SUBSTR(LTRIM(c.address), 1, INSTR(LTRIM(c.address), ' ') - 1) AS streetnumber, 
  
  --Third attempt: INSTR is a function in SQLite that finds position of substring
  CASE 
    WHEN INSTR(LTRIM(c.address), ' ') > 0 
    THEN SUBSTR(LTRIM(c.address), 1, INSTR(LTRIM(c.address), ' ') - 1)
    ELSE '',
  END AS streetnumber,
  CASE 
    WHEN INSTR(c.address, ' ') > 0 
    THEN SUBSTR(c.address, INSTR(c.address, ' ') + 1)
    ELSE '' 
  END AS address,
  UPPER(c.city) as city,
  c.zipcode,
  c.email
FROM customer c;

--Further notes:
--is '' right as the value for an empty string or should this be null? Are other places using null or empty string in searches?
--SQLite	INSTR(string, substring)	INSTR('123 Main St', ' ') → 4
--PostgreSQL	POSITION(substring IN string)	POSITION(' ' IN '123 Main St') → 4
--SQL Server	CHARINDEX(substring, string)	CHARINDEX(' ', '123 Main St') → 4
