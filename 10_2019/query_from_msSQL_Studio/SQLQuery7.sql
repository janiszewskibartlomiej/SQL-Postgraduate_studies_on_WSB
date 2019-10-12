select 'witaj œwiecie';

select * from Sales.OrderDetails;

SELECT empid, YEAR(orderdate) AS orderyear, YEAR(orderdate) +5
FROM Sales.Orders
WHERE custid =71
GROUP BY empid, YEAR(orderdate)
HAVING COUNT(*) > 1
ORDER BY empid, orderyear;



SELECT DISTINCT country
from Sales.Customers
order by country ASC;  
--DESC   z automatu jest ASC

SELECT orderid, unitprice, qty AS quantity
from Sales.OrderDetails
WHERE qty !=10;