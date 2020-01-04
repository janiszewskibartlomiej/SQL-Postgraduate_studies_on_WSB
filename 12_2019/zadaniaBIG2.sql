/*1. Napisz instrukcj� SELECT, kt�ra zwr�ci kolumny custid, companyname, contactname, address, city, country, 
phone z tabeli Sales.Customers. Filtruj wyniki, aby uwzgl�dni� tylko klient�w z kraju Brazylia.*/


SELECT custid, companyname, contactname, address, city, country, phone
FROM Sales.Customers
WHERE country = N'BRAZIL'

 
--------------------------------------------------------------------- 
/*2. Napisz instrukcj� SELECT, kt�ra zwr�ci kolumny custid, companyname, contactname, address, city, country, 
phone z tabeli Sales.Customers. Filtruj wyniki, aby uwzgl�dni� tylko klient�w z Brazyli, UK,USA.*/

SELECT custid, companyname, contactname, address, city, country, phone
FROM Sales.Customers
WHERE country IN (N'BRAZIL', N'UK', N'USA')

/*WHERE country = N'Brazil'
OR country = N'UK'
OR country = N'USA'*/ 
 
--------------------------------------------------------------------- 
/*3. Napisz instrukcj� SELECT, kt�ra zwr�ci kolumny custid, companyname, contactname, address, city, country, 
phone z tabeli Sales.Customers. Filtruj wyniki, aby uwzgl�dni� tylko klient�w  kolumny contactname 
rozpoczynaj�cej si� od litery A. */

SELECT custid, companyname, contactname, address, city, country, phone
FROM Sales.Customers
WHERE contactname LIKE N'A%'



--------------------------------------------------------------------- 
/*4. Dzia� IT napisa� instrukcj� T-SQL, kt�ra pobiera kolumny custid i nazwa firmy z tabeli Sales.Customers 
i kolumny orderid z tabeli Sales.Orders. 
Wykonaj zapytanie. Zwr�� uwag� na dwie rzeczy. Po pierwsze, zapytanie pobiera wszystkie wiersze z 
tabeli Sales.Customers. Po drugie, istnieje operator por�wnania w klauzuli ON, okre�laj�cy, �e kolumna city 
powinna by� r�wna warto�ci "Paris". 
Skopiuj podan� instrukcj� T-SQL i zmodyfikuj j� tak, aby miec operator por�wnania dla kolumny city w klauzuli WHERE. 
Wykonaj zapytanie. 
Czy wynik jest taki sam jak w pierwszym te�cie T-SQL? Czemu? Jaka jest r�nica mi�dzy okre�laniem predykatu 
w klauzuli ON iw klauzuli WHERE? */


SELECT 
 c.custid, c.companyname, o.orderid 
FROM Sales.Customers AS c 
LEFT OUTER JOIN Sales.Orders AS o 
ON c.custid = o.custid 
--AND c.city = 'Paris'; to jest zle, powinno byc V
WHERE c.city LIKE N'Paris'



--------------------------------------------------------------------- 
/*5. Napisz instrukcj� T-SQL, aby pobra� klient�w (custommers) z tabeli Sales.Customers, kt�rzy nie maj� 
pasuj�cych zam�wie� w tabeli Sales.Orders. Dopasowanie klient�w do zam�wie� opiera si� na por�wnaniu 
mi�dzy custid (dla Sales.Custommers) a warto�ci� zam�wienia (custid z Sales.Orders). 
Odzyskaj kolumny custid i nazwa firmy z tabeli Sales.Customers. (Wskaz�wka: u�yj instrukcji T-SQL, 
kt�ra jest podobna do instrukcji z poprzedniego zadania.) */


SELECT 
 c.custid, c.companyname, o.orderid 
FROM Sales.Customers AS c 
LEFT OUTER JOIN Sales.Orders AS o 
ON c.custid = o.custid 
WHERE o.orderid IS NULL

