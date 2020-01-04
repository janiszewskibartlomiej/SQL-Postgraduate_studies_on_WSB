/*8. Skopiuj istniej�c� instrukcj� T-SQL z poprzedniego zadania i zmodyfikuj j� tak, aby wynik zwr�ci� wszystkich pracownik�w i zosta� posortowany 
przez imi� mened�era. Spr�buj najpierw u�y� nazwy kolumny �r�d�owej, a nast�pnie spr�buj u�y� nazwy kolumny aliasu. 
Dlaczego mo�na u�y� nazwy kolumny �r�d�owej lub nazwy kolumny aliasu? */

SELECT 
 e.empid, e.lastname, e.firstname, e.title, e.mgrid, 
 m.lastname AS mgrlastname, m.firstname AS mgrfirstname
FROM HR.Employees AS e 
INNER JOIN HR.Employees AS m ON e.mgrid = m.empid 
WHERE 
	m.lastname = N'Buck'
ORDER BY m.lastname;


 /*9. Napisz instrukcj� SELECT do tabeli Sales.Orders i pobierz kolumny orderid i orderdate. Wyszukaj 20 ostatnich zam�wie� w oparciu o kolejno�� zam�wie�. */

 SELECT TOP (20) [orderid], [orderdate]
 FROM [Sales].[Orders]
 ORDER BY orderdate DESC;

--------------------------------------------------------------------- 
/*10. Napisz instrukcj� SELECT, aby pobra� ten sam wynik co w poprzednim zadaniu, ale u�yj klauzuli OFFSET-FETCH. 
Wykonaj pisemne o�wiadczenie i por�wnaj uzyskane wyniki z wynikami poprzedniego zadania*/

 SELECT [orderid], [orderdate]
 FROM [Sales].[Orders]
 ORDER BY orderdate DESC
 OFFSET 0 ROWS FETCH NEXT 20 ROWS ONLY;

 /*
 11. Napisz instrukcj� SELECT, aby pobra� kolumny productname i unitprice z tabeli Production.Products. 
Wykonaj instrukcj� T-SQL i zwr�� uwag� na liczb� zwr�conych wierszy. 
Zmodyfikuj instrukcj� SELECT tak, aby obejmowa�a tylko 10% produkt�w na podstawie kolejno�ci kolumny unitprice. 
Czy jest mo�liwe wykonanie tego zadania z klauzul� OFFSET-FETCH? 
 */

 SELECT TOP (10) PERCENT 
 [productname], [unitprice]
 FROM [Production].[Products]
 ORDER BY unitprice DESC;

 /*
 12. Napisz instrukcj� SELECT, aby pobra� kolumny custid, orderid i orderdate z tabeli Sales.Orders. 
 Posortuj wiersze wed�ug daty zam�wienia (orderdate) i zam�wienia (orderid). Wyszukaj pierwsze 20 wierszy. 
 */

 SELECT TOP (20) 
 [custid], [orderid], [orderdate]
 FROM [Sales].[Orders]
 ORDER BY orderdate, orderid;

 --ROZWIAZANIE WYKLADOWCY

  SELECT
 [custid], [orderid], [orderdate]
 FROM [Sales].[Orders]
 ORDER BY orderdate, orderid
 OFFSET 0 ROWS FETCH NEXT 20 ROWS ONLY;

 /*
 13. Skopiuj instrukcj� SELECT do zadania poprzedniego i zmodyfikuj klauzul� OFFSET-FETCH, aby pomin�� pierwsze 20 wierszy i pobra� nast�pne 20 wierszy. 
 */

  SELECT
 [custid], [orderid], [orderdate]
 FROM [Sales].[Orders]
 ORDER BY orderdate, orderid
 OFFSET 20 ROWS FETCH NEXT 20 ROWS ONLY;