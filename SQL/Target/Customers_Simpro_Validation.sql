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
  SUBSTR(c.address, 1, INSTR(c.address, ' ') - 1) AS streetnumber,
  SUBSTR(c.address, INSTR(c.address, ' ') + 1) AS address,
  UPPER(c.city) as city,
  c.zipcode,
  c.email
FROM customer c;
where 
--c.customerId = 239 AND
	SUBSTR(TRIM(c.address), 1, INSTR(TRIM(c.address), ' ') - 1) IS NULL
   OR SUBSTR(TRIM(c.address), 1, INSTR(TRIM(c.address), ' ') - 1) = '';

