SELECT city, region, country, city +' ' + region +' ' + country
FROM Sales.Customers


SELECT city, region, country, CONCAT(city,' ',region,' ',country)
FROM Sales.Customers