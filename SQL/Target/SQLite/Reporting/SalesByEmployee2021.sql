INSERT INTO 2021SalesByEmployee
SELECT 
    e.employeeId,
    e.firstName,
    e.lastName,
    COUNT(s.soldDate) AS T_Sales_21,
    SUM(s.salesAmount) AS T_DollarSales_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 1 THEN 1 ELSE 0 END) AS NoSales_Jan_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 1 THEN s.salesAmount ELSE 0 END) AS DollarSales_Jan_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 2 THEN 1 ELSE 0 END) AS NoSales_Feb_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 2 THEN s.salesAmount ELSE 0 END) AS DollarSales_Feb_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 3 THEN 1 ELSE 0 END) AS NoSales_Mar_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 3 THEN s.salesAmount ELSE 0 END) AS DollarSales_Mar_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 4 THEN 1 ELSE 0 END) AS NoSales_Apr_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 4 THEN s.salesAmount ELSE 0 END) AS DollarSales_Apr_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 5 THEN 1 ELSE 0 END) AS NoSales_May_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 5 THEN s.salesAmount ELSE 0 END) AS DollarSales_May_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 6 THEN 1 ELSE 0 END) AS NoSales_Jun_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 6 THEN s.salesAmount ELSE 0 END) AS DollarSales_Jun_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 7 THEN 1 ELSE 0 END) AS NoSales_Jul_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 7 THEN s.salesAmount ELSE 0 END) AS DollarSales_Jul_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 8 THEN 1 ELSE 0 END) AS NoSales_Aug_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 8 THEN s.salesAmount ELSE 0 END) AS DollarSales_Aug_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 9 THEN 1 ELSE 0 END) AS NoSales_Sep_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 9 THEN s.salesAmount ELSE 0 END) AS DollarSales_Sep_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 10 THEN 1 ELSE 0 END) AS NoSales_Oct_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 10 THEN s.salesAmount ELSE 0 END) AS DollarSales_Oct_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 11 THEN 1 ELSE 0 END) AS NoSales_Nov_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 11 THEN s.salesAmount ELSE 0 END) AS DollarSales_Nov_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 12 THEN 1 ELSE 0 END) AS NoSales_Dec_21,
    SUM(CASE WHEN MONTH(s.soldDate) = 12 THEN s.salesAmount ELSE 0 END) AS DollarSales_Dec_21
FROM 
    employee e
JOIN 
    sales s 
ON 
    s.employeeId = e.employeeId
WHERE 
    s.soldDate >= '2021-01-01' 
    AND s.soldDate < '2022-01-01'
GROUP BY 
    e.employeeId, e.firstName, e.lastName
ORDER BY 
    DollarSales_Jan_21 DESC;
