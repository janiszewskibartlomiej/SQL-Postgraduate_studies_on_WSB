/*6. Napisz instrukcj� SELECT, aby pobra� kolumny custid i contactname z tabeli Sales.Customers oraz kolumny orderid i orderdate z tabeli Sales.Orders. 
Filtruj wyniki, aby uwzgl�dni� tylko zam�wienia z�o�one w/po 1 kwietnia 2008 r. (Filtruj kolumn� orderdate). 
Nast�pnie posortuj wynik wed�ug orderdate w porz�dku malej�cym i custid w porz�dku rosn�cym.*/

SELECT SC.[custid], SC.[contactname], SO.[orderid], SO.[orderdate]
FROM [Sales].[Customers] AS SC
INNER JOIN [Sales].[Orders] AS SO
ON SC.custid = SO.custid
WHERE SO.orderdate >= '20080401'
ORDER BY SO.orderdate DESC, SC.custid ASC;


/*7. Wykonaj zapytanie dok�adnie tak, jak zosta�o napisane w oknie zapytania i obserwuj wynik. 
Otrzymujesz b��d. Jaki jest komunikat o b��dzie? Jak my�lisz, dlaczego masz ten b��d? (Wskaz�wka: Zapami�taj logiczny porz�dek przetwarzania zapytania.) 
Zastosuj potrzebne zmiany do instrukcji SELECT, aby dzia�a�y bezb��dnie. Przetestuj zmiany, wykonuj�c instrukcj� T-SQL. 
--------------------------------------------------------------------- 
SELECT 
 e.empid, e.lastname, e.firstname, e.title, e.mgrid, 
 m.lastname AS mgrlastname, m.firstname AS mgrfirstname 
FROM HR.Employees AS e 
INNER JOIN HR.Employees AS m ON e.mgrid = m.empid 
WHERE 
 mgrlastname = N'Buck'; 
---------------------------------------------------------
tresc bledu:

Msg 207, Level 16, State 1, Line 23
Invalid column name 'mgrlastname'.

Completion time: 2020-01-04T08:10:03.0663537+01:00
*/

SELECT 
 e.empid, e.lastname, e.firstname, e.title, e.mgrid, 
 m.lastname, m.firstname
FROM HR.Employees AS e 
INNER JOIN HR.Employees AS m ON e.mgrid = m.empid 
WHERE 
 m.lastname = N'Buck'; 

