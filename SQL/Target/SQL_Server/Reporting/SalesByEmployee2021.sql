INSERT INTO [2021SalesByEmployee] (
    employeeId,
    firstName,
    lastName,
    T_Sales_21,
    T_DollarSales_21,
    NoSales_Jan_21,
    DollarSales_Jan_21,
    NoSales_Feb_21,
    DollarSales_Feb_21,
    NoSales_Mar_21,
    DollarSales_Mar_21,
    NoSales_Apr_21,
    DollarSales_Apr_21,
    NoSales_May_21,
    DollarSales_May_21,
    NoSales_Jun_21,
    DollarSales_Jun_21,
    NoSales_Jul_21,
    DollarSales_Jul_21,
    NoSales_Aug_21,
    DollarSales_Aug_21,
    NoSales_Sep_21,
    DollarSales_Sep_21,
    NoSales_Oct_21,
    DollarSales_Oct_21,
    NoSales_Nov_21,
    DollarSales_Nov_21,
    NoSales_Dec_21,
    DollarSales_Dec_21
)
SELECT 
    e.employeeId,
    e.firstName,
    e.lastName,
    COUNT(s.soldDate) AS T_Sales_21,
    SUM(s.salesAmount) AS T_DollarSales_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '01' THEN 1 ELSE 0 END) AS NoSales_Jan_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '01' THEN s.salesAmount ELSE 0 END) AS DollarSales_Jan_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '02' THEN 1 ELSE 0 END) AS NoSales_Feb_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '02' THEN s.salesAmount ELSE 0 END) AS DollarSales_Feb_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '03' THEN 1 ELSE 0 END) AS NoSales_Mar_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '03' THEN s.salesAmount ELSE 0 END) AS DollarSales_Mar_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '04' THEN 1 ELSE 0 END) AS NoSales_Apr_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '04' THEN s.salesAmount ELSE 0 END) AS DollarSales_Apr_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '05' THEN 1 ELSE 0 END) AS NoSales_May_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '05' THEN s.salesAmount ELSE 0 END) AS DollarSales_May_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '06' THEN 1 ELSE 0 END) AS NoSales_Jun_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '06' THEN s.salesAmount ELSE 0 END) AS DollarSales_Jun_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '07' THEN 1 ELSE 0 END) AS NoSales_Jul_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '07' THEN s.salesAmount ELSE 0 END) AS DollarSales_Jul_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '08' THEN 1 ELSE 0 END) AS NoSales_Aug_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '08' THEN s.salesAmount ELSE 0 END) AS DollarSales_Aug_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '09' THEN 1 ELSE 0 END) AS NoSales_Sep_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '09' THEN s.salesAmount ELSE 0 END) AS DollarSales_Sep_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '10' THEN 1 ELSE 0 END) AS NoSales_Oct_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '10' THEN s.salesAmount ELSE 0 END) AS DollarSales_Oct_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '11' THEN 1 ELSE 0 END) AS NoSales_Nov_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '11' THEN s.salesAmount ELSE 0 END) AS DollarSales_Nov_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '12' THEN 1 ELSE 0 END) AS NoSales_Dec_21,
    SUM(CASE WHEN FORMAT(s.soldDate, 'MM') = '12' THEN s.salesAmount ELSE 0 END) AS DollarSales_Dec_21
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
