/*30. Napisz instrukcjê SELECT do tabeli Production.Products, aby stworzyæ kolumnê o nazwie productdesc. Kolumna powinna opieraæ siê na kolumnach productname i unitprice i wygl¹daæ tak: 
Cena jednostkowa produktu HHYDP to 18,00 $. 
Czy u¿ywa³eœ funkcji CAST lub CONVERT? Który z nich jest bardziej odpowiedni do u¿ycia? */

SELECT *, N'Cena jednostkowa produktu '+ productname + N' to '+ str(unitprice)+N' $' AS productdesc 
FROM [Production].[Products]

SELECT *, N'Cena jednostkowa produktu '+ 
SUBSTRING(productname, CHARINDEX(' ', productname)+1, LEN(productname)-CHARINDEX(' ', productname))  +  ' '+
CAST(unitprice AS NVARCHAR(10))+N' $' AS productdesc 
FROM [Production].[Products]


/*31. Departament marketingu USA dostarczy³ Ci datê rozpoczêcia 4/1/2007 (przy u¿yciu formatu US, czytaj jako 1 kwietnia 2007 r.) I datê koñcow¹ 11/30/2007 (u¿ywaj¹c formatu US, 30 listopada 2007 r.) ). Napisz instrukcjê SELECT do tabeli Sales.Orders, aby pobraæ kolumny orderid, orderdate, shippeddate i shipregion. Przefiltruj wynik tak, aby zawiera³ tylko wiersze z dat¹ zamówienia miêdzy okreœlon¹ dat¹ rozpoczêcia i dat¹ zakoñczenia i mia³ wiêcej ni¿ 30 dni miêdzy dat¹ wys³ania a dat¹ zamówienia. SprawdŸ równie¿ kolumnê shipregion pod k¹tem brakuj¹cych wartoœci. Jeœli brakuje wartoœci, zwróæ wartoœæ "No region". 
W tej instrukcji SELECT mo¿na u¿yæ funkcji CONVERT lub funkcjê PARSE. */

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

/*32. Dzia³ IT chcia³by zamieniæ wszystkie informacje o numerach telefonów w tabeli Sales.Customers na wartoœci ca³kowite. Dzia³ IT wskaza³, ¿e wszystkie ³¹czniki, nawiasy i spacje musz¹ zostaæ usuniête przed konwersj¹ na typ danych ca³kowity (integer).  
Napisz instrukcjê SELECT, aby zrealizowaæ wymagania dzia³u IT. Zast¹p wszystkie okreœlone znaki w kolumnie (phone) tabeli Sales.Customers, a nastêpnie przekonwertuj kolumnê z typu danych nvarchar na typ danych int. Instrukcja T-SQL nie mo¿e zawieœæ, jeœli wyst¹pi³ b³¹d konwersji, ale powinna zwróciæ wartoœæ NULL. (PodpowiedŸ: Najpierw spróbuj napisaæ instrukcjê T-SQL za pomoc¹ funkcji CONVERT, a nastêpnie u¿yj nowszej funkcji poznanej przez Ciebie). U¿yj aliasów dla tej kolumny PhoneAsIntiger. 
--------------------------------------------------------------------- */


/*33. Napisz instrukcjê SELECT do tabeli Sales.Customers i pobierz kolumny custid i contactname. 
Dodaj kolumnê o nazwie segmentgroup za pomoc¹ funkcji logicznej IIF o wartoœci "Target group" dla klientów z Meksyku i którzy w tytule (contacttitle) 
maj¹ s³owo "Owner". U¿yj wartoœci "Other" dla reszty klientów. */

/*przyklad dzialamnie ifa w sql:
SELECT productid, unitprice,
		IIF(unitprice > 50, 'High', 'Low') As pricepoint
FROM Production.Products

*/


SELECT custid, contactname,
	IIF(country=N'Mexico' AND contacttitle = N'Owner', N'Target group', N'Other') AS segmentgroup
FROM Sales.Customers
--------------------------------------------------------------------- 

/*34. Zmodyfikuj instrukcjê T-SQL z poprzedniego zadania, aby wyœwietliæ w "Target group" wszystkich klientów, 
dla których region ma jak¹s wartoœæ lub s³owo "Owner" w contacttitle. */

SELECT custid, contactname,
	IIF(contacttitle = N'Owner' OR region IS NOT NULL, N'Target group', N'Other') AS segmentgroup
FROM Sales.Customers

/*
38. Napisz instrukcjê SELECT, aby pobraæ kolumny contactname, city, region z tabeli Sales.Customers. 
Zwróæ tylko wiersze, które nie maj¹ dwóch znaków w kolumnie regionu lub gdzie region ma wartoœæ NULL. 
--------------------------------------------------------------------- 
*/

SELECT contactname, city, region

FROM Sales.Customers
WHERE region IS NULL
OR LEN(region) <>2;


