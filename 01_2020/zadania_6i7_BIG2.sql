/*6. Napisz instrukcjê SELECT, aby pobraæ kolumny custid i contactname z tabeli Sales.Customers oraz kolumny orderid i orderdate z tabeli Sales.Orders. 
Filtruj wyniki, aby uwzglêdniæ tylko zamówienia z³o¿one w/po 1 kwietnia 2008 r. (Filtruj kolumnê orderdate). 
Nastêpnie posortuj wynik wed³ug orderdate w porz¹dku malej¹cym i custid w porz¹dku rosn¹cym.*/

SELECT SC.[custid], SC.[contactname], SO.[orderid], SO.[orderdate]
FROM [Sales].[Customers] AS SC
INNER JOIN [Sales].[Orders] AS SO
ON SC.custid = SO.custid
WHERE SO.orderdate >= '20080401'
ORDER BY SO.orderdate DESC, SC.custid ASC;


/*7. Wykonaj zapytanie dok³adnie tak, jak zosta³o napisane w oknie zapytania i obserwuj wynik. 
Otrzymujesz b³¹d. Jaki jest komunikat o b³êdzie? Jak myœlisz, dlaczego masz ten b³¹d? (Wskazówka: Zapamiêtaj logiczny porz¹dek przetwarzania zapytania.) 
Zastosuj potrzebne zmiany do instrukcji SELECT, aby dzia³a³y bezb³êdnie. Przetestuj zmiany, wykonuj¹c instrukcjê T-SQL. 
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

