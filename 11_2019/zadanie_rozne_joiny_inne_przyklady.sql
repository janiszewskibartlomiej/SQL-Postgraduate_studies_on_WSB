CREATE TABLE t1 (n int);

CREATE TABLE t2 (n int);

INSERT INTO t1 VALUES (1);
INSERT INTO t1 VALUES (2);
INSERT INTO t1 VALUES (3);

INSERT INTO t2 VALUES (1);
INSERT INTO t2 VALUES (2);
INSERT INTO t2 VALUES (3);

SELECT * FROM t1;

SELECT * FROM t2;

SELECT t1.n, t2.n
FROM t1 CROSS JOIN t2

SELECT t1.n, t2.n
FROM t1 CROSS JOIN t2
WHERE t1.n<t2.n

SELECT c.custid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
ON c.custid = o.custid

SELECT c.custid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
ON c.custid = o.custid
WHERE o.orderid IS NULL;

SELECT c.custid, c.companyname, o.orderid, o.orderdate
FROM Sales.Customers AS c
LEFT JOIN Sales.Orders AS o
ON c.custid = o.custid
WHERE o.orderid IS NOT NULL;

SELECT  [empid], [lastname], [title],[mgrid]
FROM [HR].[Employees]



SELECT  e.[empid], e.[lastname] AS EmplyeeName, e.[title],
m.[mgrid], m.lastname AS MansgerName
FROM [HR].[Employees] AS e
JOIN [HR].[Employees] AS m
ON e.mgrid=m.empid;