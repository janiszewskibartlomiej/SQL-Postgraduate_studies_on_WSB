SELECT country
FROM Sales.Customers
WHERE country = N'UK'
WHERE country LIKE N'U%'  --% dowolny ciag znakow
WHERE country LIKE N'U__'  -- _ jeden znak  __ dwa znaki


SELECT firstname
from HR.Employees
WHERE firstname LIKE N'[A-M]%'  -- N skrot do unicodu

SELECT N'jfhdkfjsd fsdf;fer' 

WHERE LIKE ISNULL

WHERE kolumn  IS not NULL