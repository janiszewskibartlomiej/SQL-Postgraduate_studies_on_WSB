SELECT orderid, unitprice, qty AS quantity
FROM Sales.OrderDetails
WHERE qty > 10
ORDER BY quantity

SELECT NULL+3;