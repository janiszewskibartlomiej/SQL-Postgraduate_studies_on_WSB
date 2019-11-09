SELECT c.companyname, o.orderdate
FROM Sales.Customers as c
JOIN Sales.Orders as o
ON c.custid=o.custid;