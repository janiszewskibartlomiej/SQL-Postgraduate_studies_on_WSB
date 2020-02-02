/*30. Napisz instrukcj� SELECT do tabeli Production.Products, aby stworzy� kolumn� o nazwie productdesc. Kolumna powinna opiera� si� na kolumnach productname i unitprice i wygl�da� tak: 
Cena jednostkowa produktu HHYDP to 18,00 $. 
Czy u�ywa�e� funkcji CAST lub CONVERT? Kt�ry z nich jest bardziej odpowiedni do u�ycia? */

SELECT *, N'Cena jednostkowa produktu '+ productname + N' to '+ str(unitprice)+N' $' AS productdesc 
FROM [Production].[Products]

SELECT *, N'Cena jednostkowa produktu '+ 
SUBSTRING(productname, CHARINDEX(' ', productname)+1, LEN(productname)-CHARINDEX(' ', productname))  +  ' '+
CAST(unitprice AS NVARCHAR(10))+N' $' AS productdesc 
FROM [Production].[Products]


/*31. Departament marketingu USA dostarczy� Ci dat� rozpocz�cia 4/1/2007 (przy u�yciu formatu US, czytaj jako 1 kwietnia 2007 r.) I dat� ko�cow� 11/30/2007 (u�ywaj�c formatu US, 30 listopada 2007 r.) ). Napisz instrukcj� SELECT do tabeli Sales.Orders, aby pobra� kolumny orderid, orderdate, shippeddate i shipregion. Przefiltruj wynik tak, aby zawiera� tylko wiersze z dat� zam�wienia mi�dzy okre�lon� dat� rozpocz�cia i dat� zako�czenia i mia� wi�cej ni� 30 dni mi�dzy dat� wys�ania a dat� zam�wienia. Sprawd� r�wnie� kolumn� shipregion pod k�tem brakuj�cych warto�ci. Je�li brakuje warto�ci, zwr�� warto�� "No region". 
W tej instrukcji SELECT mo�na u�y� funkcji CONVERT lub funkcj� PARSE. */

SELECT orderid, orderdate, shippeddate, COALESCE(shipregion, 'No region')
FROM Sales.Orders


SELECT orderid, orderdate, shippeddate, ISNULL(shipregion, 'No region')
FROM Sales.Orders
WHERE
	orderdate >= CONVERT(DATETIME, '4/1/2007', 101)
	AND orderdate <= CONVERT(DATETIME, '11/30/2007', 101)
	AND shippeddate > DATEADD(DAY, 30, orderdate);


/*metoda PARSE*/

SELECT orderid, orderdate, shippeddate, ISNULL(shipregion, 'No region')
FROM Sales.Orders
WHERE
orderdate >= PARSE('4/1/2007' AS DATETIME USING 'en-US')
AND orderdate <= PARSE('11/30/2007' AS DATETIME USING 'en-US')
AND shippeddate > DATEADD(DAY, 30, orderdate)

SELECT COALESCE(NULL, NULL, 'Ania', 'Magda'); /*coalesce ta metoda w przeciiwienstwie do is null dzial na paru parametrach*/

/*32. Dzia� IT chcia�by zamieni� wszystkie informacje o numerach telefon�w w tabeli Sales.Customers na warto�ci ca�kowite. Dzia� IT wskaza�, �e wszystkie ��czniki, nawiasy i spacje musz� zosta� usuni�te przed konwersj� na typ danych ca�kowity (integer).  
Napisz instrukcj� SELECT, aby zrealizowa� wymagania dzia�u IT. Zast�p wszystkie okre�lone znaki w kolumnie (phone) tabeli Sales.Customers, a nast�pnie przekonwertuj kolumn� z typu danych nvarchar na typ danych int. Instrukcja T-SQL nie mo�e zawie��, je�li wyst�pi� b��d konwersji, ale powinna zwr�ci� warto�� NULL. (Podpowied�: Najpierw spr�buj napisa� instrukcj� T-SQL za pomoc� funkcji CONVERT, a nast�pnie u�yj nowszej funkcji poznanej przez Ciebie). U�yj alias�w dla tej kolumny PhoneAsIntiger. 
--------------------------------------------------------------------- */


/*33. Napisz instrukcj� SELECT do tabeli Sales.Customers i pobierz kolumny custid i contactname. 
Dodaj kolumn� o nazwie segmentgroup za pomoc� funkcji logicznej IIF o warto�ci "Target group" dla klient�w z Meksyku i kt�rzy w tytule (contacttitle) 
maj� s�owo "Owner". U�yj warto�ci "Other" dla reszty klient�w. */

/*przyklad dzialamnie ifa w sql:
SELECT productid, unitprice,
		IIF(unitprice > 50, 'High', 'Low') As pricepoint
FROM Production.Products

*/


SELECT custid, contactname,
	IIF(country=N'Mexico' AND contacttitle = N'Owner', N'Target group', N'Other') AS segmentgroup
FROM Sales.Customers
--------------------------------------------------------------------- 

/*34. Zmodyfikuj instrukcj� T-SQL z poprzedniego zadania, aby wy�wietli� w "Target group" wszystkich klient�w, 
dla kt�rych region ma jak�s warto�� lub s�owo "Owner" w contacttitle. */

SELECT custid, contactname,
	IIF(contacttitle = N'Owner' OR region IS NOT NULL, N'Target group', N'Other') AS segmentgroup
FROM Sales.Customers

/*
38. Napisz instrukcj� SELECT, aby pobra� kolumny contactname, city, region z tabeli Sales.Customers. 
Zwr�� tylko wiersze, kt�re nie maj� dw�ch znak�w w kolumnie regionu lub gdzie region ma warto�� NULL. 
--------------------------------------------------------------------- 
*/

SELECT contactname, city, region

FROM Sales.Customers
WHERE region IS NULL
OR LEN(region) <>2;


