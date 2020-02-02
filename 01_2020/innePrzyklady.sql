SELECT ABS(-2), AVG(), SUM()



SELECT qty, unitprice, qty * unitprice as sale
FROM Sales.OrderDetails;


SELECT COUNT(*) AS NOROWS, SUM(qty * unitprice) as sale
FROM Sales.OrderDetails;

SELECT PARSE('02/12/2020' AS DATETIME2 USING 'en-GB') AS RESULT

select ISNUMERIC(1)

SELECT productid, unitprice, IIF(unitprice >50, 'wysoka', 'niska')
FROM Production.Products


select contactname + N' (miasto: ' + city + N', region: ' + ISNULL(region, 'BRAK') + N')'
FROM Sales.Customers