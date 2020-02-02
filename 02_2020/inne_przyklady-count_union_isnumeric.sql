/*przyklady inne*/

SELECT empid, lastname, postalcode
FROM HR.Employees
WHERE ISNUMERIC(postalcode)=1;

SELECT ISNUMERIC('abc');

SELECT ISNUMERIC(22);


SELECT AVG(unitprice), MIN(qty), MAX(discount)
FROM Sales.OrderDetails


SELECT empid, count(*)
FROM Sales.Orders
GROUP BY empid

SELECT orderid, empid, custid, COUNT(*)
FROM Sales.Orders
WHERE custid IN(1,2)
GROUP BY orderid, empid, custid

SELECT custid, COUNT(*)
FROM Sales.Orders
GROUP BY custid
HAVING COUNT(*) > 13
ORDER BY COUNT(*);

SELECT country, city
FROM Production.Suppliers
UNION ALL /* UNION, INTERSECT, EXCEPT*/
SELECT country, city
FROM Sales.Customers