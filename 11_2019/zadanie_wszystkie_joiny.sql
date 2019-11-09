SELECT c.companyname, o.orderdate
FROM Sales.Customers as c
JOIN Sales.Orders as o
ON c.custid=o.custid;

--stary standard

SELECT c.companyname, o.orderdate
FROM Sales.Customers as c,
Sales.Orders as o
WHERE c.custid=o.custid;

--cross

SELECT c.companyname, o.orderdate
FROM Sales.Customers as c
CROSS JOIN Sales.Orders as o


--left join

SELECT c.companyname, o.orderdate
FROM Sales.Customers as c
LEFT JOIN Sales.Orders as o
ON c.custid=o.custid;


--right join

SELECT c.companyname, o.orderdate
FROM Sales.Customers as c
RIGHT JOIN Sales.Orders as o
ON c.custid=o.custid;

--full outer join

SELECT c.companyname, o.orderdate
FROM Sales.Customers as c
FULL OUTER JOIN Sales.Orders as o
ON c.custid=o.custid;

-slowo OUTER jest slowem opcjonalnym