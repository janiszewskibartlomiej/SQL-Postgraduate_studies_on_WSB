/*17. Napisz instrukcję SELECT, która zwróci kolumnę productname z tabeli Production.Products (użyj aliasu tabeli "p") i kolumny categoryname z tabeli Production.Categories (użyj aliasu tabeli "c"), używając inner join.  
Powiedzmy, że istnieje nowy wiersz w tabeli Production.Categories, a ta nowa kategoria produktów nie zawiera żadnych produktów powiązanych z nią w tabeli Production.Products. Czy ten wiersz zostanie uwzględniony w wyniku instrukcji SELECT zapisanej w zadaniu? Proszę wytłumacz.*/
--W moje opini nie powinno sie wyswietlic poniewaz nie ma polaczenia

SELECT pp.productname, cac.categoryname
FROM Production.Products AS pp 
INNER JOIN Production.Categories AS cac
ON pp.categoryid = cac.categoryid;


--18. Programista napisał to zapytanie. Wykonaj zapytanie dokładnie tak, jak zostało napisane w oknie zapytania i obserwuj wynik. Otrzymujesz błąd. Co to jest komunikat o błędzie? Jak myślisz, dlaczego masz ten błąd? 
SELECT  
 custid, contactname, orderid 
FROM Sales.Customers
INNER JOIN Sales.Orders
ON Customers.custid = Orders.custid; 

/*błąd Ambiguous clumn name 'custid' = sql nie wie w kturej tabeli ma wyswietlic to pole
prawdiłowe zapytanie w ad 19
SELECT  
 Customers.custid, contactname, orderid 
FROM Sales.Customers
INNER JOIN Sales.Orders
ON Customers.custid = Orders.custid; 
*/



/*19. Zauważ, że istnieją pełne nazwy tabel źródłowych zapisane jako aliasy tabel. 
Zastosuj potrzebne zmiany do instrukcji SELECT, aby działały bezbłędnie. Przetestuj zmiany, wykonując instrukcję T-SQL. */

SELECT  
c.custid, c.contactname, o.orderid 
FROM Sales.Customers AS c
INNER JOIN Sales.Orders AS o 
ON c.custid = o.custid;



--------------------------------------------------------------------- 
/*20. Skopiuj instrukcję T-SQL z zadania 18 i zmodyfikuj ją, aby wykorzystała aliasy tabel "C" dla tabeli Sales.Custumers 
i "O" dla tabeli Sales.Orders. Zmień prefiks kolumn w instrukcji SELECT z pełnymi nazwami tabel źródłowych i wykonaj instrukcję. Otrzymujesz błąd. 
Czemu? Zmień instrukcję SELECT, aby użyć aliasów tabeli zapisanych na początku zadania. */
--wydaje sie ze nie ma spujnej konwencji poniewaz select jest robiony po przypisaniu aliasow wiec z jednej strony mamy aliasy a z drugiej pena scizke

SELECT  
 Sales.Customers.custid, Sales.Customers.contactname, Sales.Orders.orderid 
FROM Sales.Customers
INNER JOIN Sales.Orders 
ON Sales.Customers.custid = Sales.Orders.custid; 


--------------------------------------------------------------------- 
/*21. Skopiuj instrukcję T-SQL z zadania 20 i zmodyfikuj ją tak, aby zawierała trzy dodatkowe kolumny z tabeli 
Sales.OrderDetails: productid, qty i unitprice. */

SELECT  
 sc.custid,
 sc.contactname,
 so.orderid, 
 sod.productid,
 sod.qty,
 sod.unitprice
FROM Sales.Customers AS sc
	INNER JOIN Sales.Orders AS so 
ON sc.custid = so.custid
	INNER JOIN Sales.OrderDetails AS sod
ON so.orderid = sod.orderid

 

--------------------------------------------------------------------- 
/*22. Aby lepiej zrozumieć potrzebne zadania, najpierw napisz instrukcję SELECT do tabeli HR.Employees 
wyświetlając kolumny empid, lastname, firstname, title i mgrid.*/

SELECT
	empid,
	lastname,
	firstname,
	title,
	mgrid
FROM HR.Employees

 
--------------------------------------------------------------------- 
/*23. Skopiuj instrukcję SELECT z zadania 22 i zmodyfikuj ją, aby zawierała dodatkowe kolumny dla informacji menedżera 
(lastname, firstname) za pomocą samołączenia [self-join]. Przydziel aliasy odpowiednio mgrlastname i mgrfirstname, 
aby odróżnić nazwy menedżerów od nazwisk pracowników. 
Czy podczas self-join należy używać aliasów tabel? Czy możesz użyć pełnej nazwy tabeli źródłowej jako aliasu?*/

SELECT
	e.empid,
	e.lastname,
	e.firstname,
	e.title,
	e.mgrid,
	e.lastname AS mgrlastname,
	e.firstname AS mgrfirstname
FROM HR.Employees AS e
INNER JOIN HR.Employees AS h
ON e.mgrid = h. empid


--------------------------------------------------------------------- 
/*24. Napisz instrukcję SELECT, aby pobrać kolumny custid i contactname z tabeli Sales.Customers 
i kolumny orderid z tabeli Sales.Orders. Instrukcja powinna pobrać wszystkie wiersze z tabeli Sales.Customers. 
Zwróć uwagę na wartości w porządku kolumny. Czy są jakieś brakujące wartości (oznaczone jako NULL)? Czemu?*/
--MAM NULL  

SELECT
	sc.custid,
	sc.contactname,
	sor.orderid
FROM 
	Sales.Customers AS sc
LEFT OUTER JOIN
	Sales.Orders AS sor
ON sc.custid = sor.custid
ORDER BY sor.custid

--------------------------------------------------------------------- 
/*25. Wykonaj kod T-SQL. Nie martw się, jeśli nie rozumiesz dostarczonego kodu T-SQL, 
ponieważ jest on tutaj używany w celu zapewnienia bardziej realistycznego przykładu łączenia krzyżowego 
w następnym zadaniu. */

SET NOCOUNT ON; 
IF OBJECT_ID('HR.Calendar') IS NOT NULL  
 DROP TABLE HR.Calendar; 
CREATE TABLE HR.Calendar ( 
 calendardate DATE CONSTRAINT PK_Calendar PRIMARY KEY 
); 
 
DECLARE  
 @startdate DATE = DATEFROMPARTS(YEAR(SYSDATETIME()), 1, 1), 
 @enddate DATE = DATEFROMPARTS(YEAR(SYSDATETIME()), 12, 31); 
 

WHILE @startdate <= @enddate 
BEGIN 
 INSERT INTO HR.Calendar (calendardate) 
 VALUES (@startdate); 
 
 SET @startdate = DATEADD(DAY, 1, @startdate); 
END; 
 
SET NOCOUNT OFF; 
 
GO 
-- observe the HR.Calendar table 
SELECT  
 calendardate 
FROM HR.Calendar; 

 
/*26. Napisz instrukcję SELECT, aby pobrać kolumny empid, firstname i lastname z tabeli HR.Employees 
i kolumny Calendardate z tabeli HR.Calendar. 
Jaka jest liczba wierszy zwróconych przez zapytanie? W tabeli HR.Employees znajduje się dziewięć wierszy. 
Spróbuj obliczyć całkowitą liczbę wierszy w tabeli HR.Calendar. */
--liczba wierszy 3285 [365x9 = 3285] rows  w clendar jest 365 rows

SELECT
	hre.empid,
	hre.firstname,
	hre.lastname,
	hrc.Calendardate
FROM 
HR.Employees AS hre
CROSS JOIN
HR.Calendar AS hrc;


--------------------------------------------------------------------- 
/*27. Wykonaj dostarczoną instrukcję T-SQL, aby usunąć tabelę HR.Calendar. */

IF OBJECT_ID('HR.Calendar') IS NOT NULL  
 DROP TABLE HR.Calendar; 




--------------------------------------------------------------------- 

/*STWÓRZ TABELE */

CREATE TABLE T1 (n int);
CREATE TABLE T2 (n int);

INSERT INTO T1 VALUES (1);
INSERT INTO T1 VALUES (2);
INSERT INTO T1 VALUES (3);

INSERT INTO T2 VALUES (1);
INSERT INTO T2 VALUES (2);
INSERT INTO T2 VALUES (3);

SELECT * FROM T2

SELECT T1.N, T2.N
FROM T1
CROSS JOIN T2;

SELECT T1.N, T2.N
FROM T1
CROSS JOIN T2
WHERE T1.N>T2.N