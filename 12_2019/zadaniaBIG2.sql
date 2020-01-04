/*1. Napisz instrukcjê SELECT, która zwróci kolumny custid, companyname, contactname, address, city, country, 
phone z tabeli Sales.Customers. Filtruj wyniki, aby uwzglêdniæ tylko klientów z kraju Brazylia.*/


SELECT custid, companyname, contactname, address, city, country, phone
FROM Sales.Customers
WHERE country = N'BRAZIL'

 
--------------------------------------------------------------------- 
/*2. Napisz instrukcjê SELECT, która zwróci kolumny custid, companyname, contactname, address, city, country, 
phone z tabeli Sales.Customers. Filtruj wyniki, aby uwzglêdniæ tylko klientów z Brazyli, UK,USA.*/

SELECT custid, companyname, contactname, address, city, country, phone
FROM Sales.Customers
WHERE country IN (N'BRAZIL', N'UK', N'USA')

/*WHERE country = N'Brazil'
OR country = N'UK'
OR country = N'USA'*/ 
 
--------------------------------------------------------------------- 
/*3. Napisz instrukcjê SELECT, która zwróci kolumny custid, companyname, contactname, address, city, country, 
phone z tabeli Sales.Customers. Filtruj wyniki, aby uwzglêdniæ tylko klientów  kolumny contactname 
rozpoczynaj¹cej siê od litery A. */

SELECT custid, companyname, contactname, address, city, country, phone
FROM Sales.Customers
WHERE contactname LIKE N'A%'



--------------------------------------------------------------------- 
/*4. Dzia³ IT napisa³ instrukcjê T-SQL, która pobiera kolumny custid i nazwa firmy z tabeli Sales.Customers 
i kolumny orderid z tabeli Sales.Orders. 
Wykonaj zapytanie. Zwróæ uwagê na dwie rzeczy. Po pierwsze, zapytanie pobiera wszystkie wiersze z 
tabeli Sales.Customers. Po drugie, istnieje operator porównania w klauzuli ON, okreœlaj¹cy, ¿e kolumna city 
powinna byæ równa wartoœci "Paris". 
Skopiuj podan¹ instrukcjê T-SQL i zmodyfikuj j¹ tak, aby miec operator porównania dla kolumny city w klauzuli WHERE. 
Wykonaj zapytanie. 
Czy wynik jest taki sam jak w pierwszym teœcie T-SQL? Czemu? Jaka jest ró¿nica miêdzy okreœlaniem predykatu 
w klauzuli ON iw klauzuli WHERE? */


SELECT 
 c.custid, c.companyname, o.orderid 
FROM Sales.Customers AS c 
LEFT OUTER JOIN Sales.Orders AS o 
ON c.custid = o.custid 
--AND c.city = 'Paris'; to jest zle, powinno byc V
WHERE c.city LIKE N'Paris'



--------------------------------------------------------------------- 
/*5. Napisz instrukcjê T-SQL, aby pobraæ klientów (custommers) z tabeli Sales.Customers, którzy nie maj¹ 
pasuj¹cych zamówieñ w tabeli Sales.Orders. Dopasowanie klientów do zamówieñ opiera siê na porównaniu 
miêdzy custid (dla Sales.Custommers) a wartoœci¹ zamówienia (custid z Sales.Orders). 
Odzyskaj kolumny custid i nazwa firmy z tabeli Sales.Customers. (Wskazówka: u¿yj instrukcji T-SQL, 
która jest podobna do instrukcji z poprzedniego zadania.) */


SELECT 
 c.custid, c.companyname, o.orderid 
FROM Sales.Customers AS c 
LEFT OUTER JOIN Sales.Orders AS o 
ON c.custid = o.custid 
WHERE o.orderid IS NULL

