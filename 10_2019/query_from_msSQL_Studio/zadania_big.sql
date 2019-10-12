SELECT
firstname, lastname, city, country
FROM HR.Employees;

SELECT
firstname, lastname, city, country
FROM HR.Employees
WHERE country = 'USA';

/*
SELECT
firstname, lastname, city, country
FROM HR.Employees
WHERE country = 'USA'
ORDER BY lastname;
*/

SELECT * from [Sales].[Customers]

SELECT custid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax
from [Sales].[Customers]

SELECT address, postalcode, city, country from HR.Employees;


SELECT country from Sales.Customers;