/*8. Skopiuj istniej¹c¹ instrukcjê T-SQL z poprzedniego zadania i zmodyfikuj j¹ tak, aby wynik zwróci³ wszystkich pracowników i zosta³ posortowany 
przez imiê mened¿era. Spróbuj najpierw u¿yæ nazwy kolumny Ÿród³owej, a nastêpnie spróbuj u¿yæ nazwy kolumny aliasu. 
Dlaczego mo¿na u¿yæ nazwy kolumny Ÿród³owej lub nazwy kolumny aliasu? */

SELECT 
 e.empid, e.lastname, e.firstname, e.title, e.mgrid, 
 m.lastname AS mgrlastname, m.firstname AS mgrfirstname
FROM HR.Employees AS e 
INNER JOIN HR.Employees AS m ON e.mgrid = m.empid 
WHERE 
	m.lastname = N'Buck'
ORDER BY m.lastname;


 /*9. Napisz instrukcjê SELECT do tabeli Sales.Orders i pobierz kolumny orderid i orderdate. Wyszukaj 20 ostatnich zamówieñ w oparciu o kolejnoœæ zamówieñ. */

 SELECT TOP (20) [orderid], [orderdate]
 FROM [Sales].[Orders]
 ORDER BY orderdate DESC;

--------------------------------------------------------------------- 
/*10. Napisz instrukcjê SELECT, aby pobraæ ten sam wynik co w poprzednim zadaniu, ale u¿yj klauzuli OFFSET-FETCH. 
Wykonaj pisemne oœwiadczenie i porównaj uzyskane wyniki z wynikami poprzedniego zadania*/

 SELECT [orderid], [orderdate]
 FROM [Sales].[Orders]
 ORDER BY orderdate DESC
 OFFSET 0 ROWS FETCH NEXT 20 ROWS ONLY;

 /*
 11. Napisz instrukcjê SELECT, aby pobraæ kolumny productname i unitprice z tabeli Production.Products. 
Wykonaj instrukcjê T-SQL i zwróæ uwagê na liczbê zwróconych wierszy. 
Zmodyfikuj instrukcjê SELECT tak, aby obejmowa³a tylko 10% produktów na podstawie kolejnoœci kolumny unitprice. 
Czy jest mo¿liwe wykonanie tego zadania z klauzul¹ OFFSET-FETCH? 
 */

 SELECT TOP (10) PERCENT 
 [productname], [unitprice]
 FROM [Production].[Products]
 ORDER BY unitprice DESC;

 /*
 12. Napisz instrukcjê SELECT, aby pobraæ kolumny custid, orderid i orderdate z tabeli Sales.Orders. 
 Posortuj wiersze wed³ug daty zamówienia (orderdate) i zamówienia (orderid). Wyszukaj pierwsze 20 wierszy. 
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
 13. Skopiuj instrukcjê SELECT do zadania poprzedniego i zmodyfikuj klauzulê OFFSET-FETCH, aby pomin¹æ pierwsze 20 wierszy i pobraæ nastêpne 20 wierszy. 
 */

  SELECT
 [custid], [orderid], [orderdate]
 FROM [Sales].[Orders]
 ORDER BY orderdate, orderid
 OFFSET 20 ROWS FETCH NEXT 20 ROWS ONLY;