--zadanie 4

/* 
SELECT  
 firstname, lastname, city, country 
FROM HR.Employees 
WHERE country = 'USA' 
ORDER BY lastname ASC;

domyœlnie jest rosn¹co ASC  a MAlej¹co to jest DESC. 
*/

--zadanie 5

SELECT custid, companyname, contactname, contacttitle, address, city, region, postalcode, country, phone, fax FROM [Sales].[Customers];

--zadanie 6

SELECT contactname, address, postalcode, city, country
FROM Sales.Customers;

--zadanie 7

SELECT country FROM  Sales.Customers;

--zadanie 8

SELECT country
FROM  Sales.Customers
GROUP BY country;

--zadanie 9

SELECT  
 city, region  
FROM Sales.Customers; 
 
SELECT DISTINCT  
 city, region  
FROM Sales.Customers; 

--DISTINCT - wyciaga dane unikatowe dal wszystkiego w select

--zadanie 10

/* Napisz formu³ê SELECT zwaracaj¹c¹ kolumny contactname i contacttitle z tabeli Sales.Customers, przypisz alias “C” do tabeli. U¿yj aliasu tabeli C, aby poprzedziæ nazwy dwóch potrzebnych kolumn na liœcie SELECT*/

SELECT C.contactname, C.contacttitle FROM Sales.Customers AS C

--zadanie 11

/*  Napisz formu³ê SELECT aby zwróciæ kolumny: contactname, contacttitle, companyname z tabeli Sales.Customers. Przypisz kolumnom aliasy: Name, Title, Company Name.  */

SELECT contactname AS Name, contacttitle AS Title, companyname AS [Company Name]
FROM Sales.Customers;

--zadanie 12

/*Napisz zapytanie, aby wyœwietliæ kolumnê productname z tabeli Production.Products, u¿ywaj¹c "P" jako aliasu tabeli i nazwy produktu jako aliasu kolumny. */

SELECT P.productname FROM Production.Products AS P

--zadanie 13

Programista napisa³ zapytanie, aby pobraæ dwie kolumny (miasto i region) z tabeli Sales.Customers. Po wykonaniu zapytania zwraca tylko jedn¹ kolumnê. Twoim zadaniem jest przeanalizowanie zapytania, poprawienie go w celu zwrócenia dwóch kolumn i wyjaœnienie, dlaczego zapytanie zwróci³o tylko jedn¹ kolumnê. 

SELECT city country 
FROM Sales.Customers;

--powinno byæ:

SELECT city, country 
FROM Sales.Customers;

--poniewa¿ w pierwszej wersji nstepuje przypisanie city do aliasu country

--zadanie 14

/* Napisz instrukcjê SELECT, aby wyœwietliæ kolumny categoryid i productname z tabeli Production.Products*/

SELECT categoryid, productname
FROM Production.Products;

--zadanie 15

/*Popraw instrukcjê SELECT w zadaniu 1, dodaj¹c wyra¿enie CASE [to jest IF w programowaniu], które generuje kolumnê wyników o nazwie categoryname. Nowa kolumna powinna zawieraæ category ID na podstawie dostarczonej wczeœniej tabeli mapowania - to jest plik o nazwie caseCategoryID.doc . U¿yj wartoœci "Other" dla identyfikatorów kategorii, które nie zosta³y znalezione w tabeli odwzorowañ. */

SELECT  productid, productname, categoryid,
CASE categoryid
WHEN 1 THEN 'Beverages'
WHEN 2 THEN 'Condiments'
WHEN 3 THEN 'Confections'
WHEN 4 THEN 'Dairy Products'
WHEN 5 THEN 'Grains/Cereals'
WHEN 6 THEN 'Meat/Poultry'
WHEN 7 THEN 'Produce'
WHEN 8 THEN 'Seafood'
ELSE 'Unkown Category'
END AS categoryname
FROM [Production].[Products]


--zadanie 16

/*Zmodyfikuj instrukcjê SELECT w zadaniu 2, dodaj¹c now¹ kolumnê o nazwie iscampaign. W tej kolumnie zostanie wyœwietlony opis "Campaign Products" dla kategorii Beverages, Produce, Seafood oraz opis "Non-Campaign Products" dla wszystkich pozosta³ych kategorii. */

SELECT  productid, productname, categoryid,
CASE categoryid
WHEN 1 THEN 'Beverages'
WHEN 2 THEN 'Condiments'
WHEN 3 THEN 'Confections'
WHEN 4 THEN 'Dairy Products'
WHEN 5 THEN 'Grains/Cereals'
WHEN 6 THEN 'Meat/Poultry'
WHEN 7 THEN 'Produce'
WHEN 8 THEN 'Seafood'
ELSE 'Unkown Category'
END AS categoryname,
CASE 
WHEN categoryid IN (1,7,8) THEN 'Campaign Products'
ELSE 'Non-Campaign Products'
END AS iscampaign
FROM [Production].[Products]

--lub

SELECT  productid, productname, categoryid,
CASE categoryid
WHEN 1 THEN 'Beverages'
WHEN 2 THEN 'Condiments'
WHEN 3 THEN 'Confections'
WHEN 4 THEN 'Dairy Products'
WHEN 5 THEN 'Grains/Cereals'
WHEN 6 THEN 'Meat/Poultry'
WHEN 7 THEN 'Produce'
WHEN 8 THEN 'Seafood'
ELSE 'Unkown Category'
END AS categoryname,
CASE categoryid
WHEN 1 THEN 'Campaign Products'
WHEN 7 THEN 'Campaign Products'
WHEN 8 THEN 'Campaign Products'
ELSE 'Non-Campaign Products'
END AS iscampaign
FROM [Production].[Products]


--zadanie 17

/*17. Napisz instrukcjê SELECT, która zwróci kolumnê productname z tabeli Production.Products (u¿yj aliasu tabeli "p") i kolumny categoryname z tabeli Production.Categories (u¿yj aliasu tabeli "c"), u¿ywaj¹c inner join.  
Powiedzmy, ¿e istnieje nowy wiersz w tabeli Production.Categories, a ta nowa kategoria produktów nie zawiera ¿adnych produktów powi¹zanych z ni¹ w tabeli Production.Products. Czy ten wiersz zostanie uwzglêdniony w wyniku instrukcji SELECT zapisanej w zadaniu? Proszê wyt³umacz. */