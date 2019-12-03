  /*1. Napisz zapytanie, które zwróci listę pracowników, których 
  nazwisko zawiera dwie litery ‘a’ (w dowolnym miejscu)*/

  SELECT *
  FROM [Northwind].[dbo].[Employees]
  WHERE LastName LIKE '%a%a%' OR LastName LIKE 'a%a%'

  /*2. Napisz zapytanie, które pokaże nam wszystkie osoby kontaktowe z 
  nazwiskiem zaczynającym się na ‘L’ (imię i nazwisko w bazie to jedna kolumna).*/

SELECT *
  FROM [Northwind].[dbo].[Customers]
  WHERE ContactName LIKE '% L%'

  /*3. Znajdź pracowników zatrudnionych między październikiem 1990 a marcem 1993. 
  Wynik posortuj według daty zatrudnienia.*/

  SELECT *
  FROM [Northwind].[dbo].[Employees]
  WHERE HireDate BETWEEN '1990-10-01' AND '1993-03-30'
  ORDER BY HireDate

  /*4. Stwórz zestawienie pracowników, tak jak pokazano ponizej na zdjeciu.
Pracownicy
Ms. Nancy Davolio, Sales Representative
Dr. Andrew Fuller, Vice President, Sales
Ms. Janet Leverling, Sales Representative
Mrs. Margaret Peacock, Sales Representative*/

  SELECT 
	TitleOfCourtesy +' '+ FirstName +' ' + LastName +', ' + Title 
	AS Pracownicy 
	FROM [Northwind].[dbo].[Employees]

/*5. Napisz najkrótsze zapytanie, jakie wymyślisz.*/

PRINT 2

SELECT GETDATE()  

SELECT *
FROM sys.dm_os_sys_memory;


/*6. Dla klienta o ID SAVEA wybierz wszystkie zamówienia złożone 
po 1 maja 1995.*/

SELECT *
	FROM [Northwind].[dbo].[Orders]
	WHERE CustomerID = 'SAVEA'
	AND
	OrderDate > '1995-05-01'

/*7. Dla zamówień o numerach od 10760 do 10849 (włącznie) 
ustal id klienta oraz datę zamówienia.*/

SELECT OrderID, CustomerID, OrderDate
	FROM [Northwind].[dbo].[Orders]
	WHERE OrderID BETWEEN 10760 AND 10849

/*8. Pokaż te zamówienia klienta o id SAVEA, które były obsługiwane 
przez pracowników o id 2, 4 lub 6.*/

SELECT *
	FROM [Northwind].[dbo].[Orders]
	WHERE CustomerID = 'SAVEA'
	AND
	EmployeeID IN (2,4,6)
	

/*9. Z tabeli klientów wybierz kraj, miasto i nazwę firmy. 
Nazwa kraju ma zaczynać się literą A,B lub C.*/

SELECT Country, City, CompanyName
	FROM dbo.Customers
	WHERE Country LIKE '[ABC]%'
	ORDER BY Country

/*10. Z tabeli Employees (EmployeeID, FirstName, LastName) wybierz:
a) pracowników z UK 
b) pracowników, którzy nie są z Seatle 
c) urodzeni po 1950 roku 
d) wszystkie panny*/

SELECT *,
	[EmployeeID], 
	[FirstName], 
	[LastName]
	FROM [dbo].[Employees]
	WHERE Country = 'UK'
	AND City != 'Seatle'
	AND BirthDate > '1950'
	AND TitleOfCourtesy != 'Mr.'

/*11. Z tabeli Orders wybierz (OrderID, CustomerID) zamówienia: 
a) dostarczone między 1 maja a 15 października 1996 
b) dostarczone do Australii, Niemiec i Stanów Zjednoczonych 
c) obsługiwane przez przewoźnika o id 3 
d) dostarczone do miast, których nazwa zaczyna się na litery od A, B*/

SELECT 
	[OrderID],
	[CustomerID]
	FROM [dbo].[Orders]
	WHERE RequiredDate BETWEEN '1996-05-01' AND '1996-10-15'
	AND ShipCountry IN ('Austria','Germany', 'USA')
	AND ShipVia = 3
	AND ShipCity LIKE '[AB]%'


/*13. Z tabeli Products wybierz (ProductID, ProductName) produkty: 
a) należące do kategorii nr 8 
b) takie, gdzie cena jednostkowa jest większa niż 14 
c) w cenie do 15 lub powyżej 50 
d) których nazwa na drugim miejscu ma literę ‘o’*/

SELECT *,
	[ProductID],
	[ProductName]
	FROM [dbo].[Products]
	WHERE CategoryID = 8
	AND UnitPrice BETWEEN 14 AND 15
	OR UnitPrice > 50
	AND ProductName LIKE '_o%'
