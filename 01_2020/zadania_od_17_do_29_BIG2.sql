/*
17. Dział IT napisał instrukcję T-SQL, która tworzy i zapełnia tabelę o nazwie Sales.Somedates. 
Wykonaj dostarczoną instrukcję T-SQL. 
Napisz instrukcję SELECT do tabeli Sales.Somedates i pobierz kolumnę isitdate. 
Dodaj nową kolumnę o nazwie convertdate z nową wartością typu danych daty na podstawie kolumny isitdate. Jeśli nie można przekształcić kolumny isitdate w typ danych daty dla określonego wiersza, zwróć wartość NULL. 
Jaka jest różnica między funkcjami SYSDATETIME i CURRENT_TIMESTAMP? 
Co to jest format neutralny językowo dla typu DATE? 
--------------------------------------------------------------------- 
*/

SET NOCOUNT ON; 
IF OBJECT_ID('Sales.Somedates') IS NOT NULL  
 DROP TABLE Sales.Somedates; 
CREATE TABLE Sales.Somedates ( 
 isitdate varchar(9) 
); 
INSERT INTO Sales.Somedates (isitdate) VALUES  
 ('20110101'), 
 ('20110102'), 
 ('20110103X'), 
 ('20110104'), 
 ('20110105'), 
 ('20110106'), 
 ('20110107Y'), 
 ('20110108'); 
SET NOCOUNT OFF; 
 

 --ROZWIAZANIE


SELECT isitdate, 
	CASE
		WHEN ISDATE(isitdate) = 1
		THEN CAST(isitdate as date)
		ELSE NULL
	END AS convertdate
FROM Sales.Somedates; 

--DRUGIE ROZWIAZANIE

SELECT isitdate, 
	TRY_CAST(isitdate as date),
	TRY_CONVERT(date, isitdate)
FROM Sales.Somedates


/*
18. Wykonaj: 
DROP TABLE Sales.Somedates; 
*/

/*
19. Napisz instrukcję SELECT, aby pobrać różne wartości dla kolumny custid z tabeli Sales.Orders. 
Filtruj wyniki, aby uwzględnić tylko zamówienia złożone w lutym 2008 r. 
--------------------------------------------------------------------- */

SELECT custid
FROM Sales.Orders
WHERE orderdate >= '20080201'
AND
orderdate<'20080301'


--drugie rozwiazanie


SELECT custid
FROM Sales.Orders
WHERE 
YEAR(orderdate) = 2008
AND
MONTH(orderdate) = 2

/*20. Napisz instrukcję SELECT z tymi kolumnami: 
  Aktualna data i czas 
  Pierwsza data bieżącego miesiąca 
  Ostatnia data bieżącego miesiąca 
--------------------------------------------------------------------- 
*/


SELECT
	GETDATE() AS CURRENTDATE,
	DATEADD(day,-(DAY(getdate())-1), getdate()),
	DATEADD(day, 1, EOMONTH(GETDATE(), -1)),
	CAST(DATEADD(day, -Day(getdate())+1, getdate()) as date),
    EOMONTH(GETDATE()) AS ENDOFMONTH
	
	
/*
21. Napisz instrukcję SELECT do tabeli Sales.Orders i pobierz kolumny orderid, custid i orderdate. 
Filtruj wyniki, aby uwzględnić tylko zamówienia złożone w ciągu ostatnich pięciu dni miesiąca zamówienia. 
*/

SELECT orderid, custid, orderdate
FROM Sales.Orders
WHERE DATEDIFF(day, orderdate,EOMONTH(orderdate))<5


/*
22. Napisz instrukcję SELECT na tabelach Sales.Orders i Sales.OrderDetails i pobierz wszystkie unikatowe wartości (użyj DISTINCT) dla kolumny productid. 
Filtruj wyniki, aby uwzględnić tylko zamówienia złożone w ciągu pierwszych 10 tygodni roku 2007. 
*/

SELECT DISTINCT D.productid,*
FROM Sales.Orders AS O
INNER JOIN
Sales.OrderDetails AS D
ON D.orderid = O.orderid
WHERE YEAR(orderdate) = 2007
AND DATEPART(week, orderdate) <= 10;

/*
Napisz instrukcję SELECT do tabeli Sales.Customers i pobierz kolumny contactname i city. 
Połącz oba kolumny, aby nowa kolumna wyglądała następująco: 
Allen, Michael (miasto: Berlin) 
*/

SELECT contactname, city, contactname + N' (miasto: ' + city + N')'
FROM Sales.Customers

/*
24. Skopiuj instrukcję T-SQL do poprzedniego zadania i zmodyfikuj ją, aby rozszerzyć kolumnę o nowe informacje z kolumny region. 
Traktuj wartość NULL w kolumnie region jako pusty ciąg znaków w celu połączenia. Kiedy region ma wartość NULL, zmodyfikowana kolumna powinna wyglądać następująco: 
 Allen, Michael (miasto: Berlin, region:) 
 Gdy region nie ma wartości NULL, zmodyfikowana kolumna powinna wyglądać następująco 
Richardson, Shawn (miasto: Sao Paulo, region: SP) 
--------------------------------------------------------------------- 
*/

SELECT contactname, city, CONCAT(contactname,'(miasto: ', city, ', region: ', region,')')
FROM Sales.Customers

--DRUGIE ROZWIAZANIE


SELECT contactname, city, contactname + N'(miasto: ' + city + N', region: '+ COALESCE(region, '') + N')'
FROM Sales.Customers
/*
25. Napisz instrukcję SELECT, aby pobrać kolumny contactname i contacttitle z tabeli Sales.Customers. 
Zwróć tylko wiersze, w których pierwszy znak w contactname to "A" do "G". 
*/

SELECT contactname, contacttitle
FROM Sales.Customers
WHERE contactname LIKE N'[A-G]%'
ORDER BY contactname

/*
26. Napisz instrukcję SELECT, aby pobrać kolumnę contactname z tabeli Sales.Customers. 
Na podstawie tej kolumny dodaj kolumnę o nazwie lastname, która powinna składać się ze wszystkich znaków przed przecinkiem. 
*/

SELECT contactname, SUBSTRING(contactname, 0, CHARINDEX(N',', contactname)) as lastname
FROM Sales.Customers


/*
27. Napisz SELECT, aby pobrać kolumnę ContactName z tabeli Sales.Customers i zastąp przecinek w contactname pustym ciągiem. 
Na podstawie tej kolumny dodaj kolumnę o nazwie firstname, która powinna składać się ze wszystkich znaków po przecinku
*/

SELECT contactname, 
	REPLACE(contactname,',',''),
	SUBSTRING(contactname, CHARINDEX(N',', contactname)+1,
	LEN(contactname)-CHARINDEX(N',', contactname)+1),
	
	SUBSTRING(REPLACE(contactname,',',''),
	CHARINDEX(N' ', REPLACE(contactname, ',','')), LEN(REPLACE(contactname,',','')))
FROM Sales.Customers


/*
28. Napisz instrukcję SELECT, aby pobrać custid z tabeli Sales.Customers. 
Na podstawie kolumny custid stwórz: custid o stałej szerokości (6 znaków) poprzedzonego literą C i zerami. 
Na przykład wartość custid 1 powinna wyglądać tak C00001 a custid 10 C00010. */

SELECT custid, FORMAT(custid,N'\C000000')
FROM Sales.Customers


/*--------------------------------------------------------------------- 
29. Napisz instrukcję SELECT, aby pobrać kolumnę contactname z tabeli Sales.Customers. Dodaj kolumnę, 
która powinna policzyć liczbę pojawienia się znaku "a" w contactname. (Wskazówka: Użyj funkcji REPLACE i LEN.) 
Posortuj wynik od najwyższej do najniższej liczby pojawiania się znaku "a". 
*/

--zastosuj len i replace do rozwiazania