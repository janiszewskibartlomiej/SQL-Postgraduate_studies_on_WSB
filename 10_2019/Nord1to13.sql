/*1.Napisz zapytanie, które zwróci listę pracowników, których nazwisko zawiera dwie litery ‘a’ (w dowolnym miejscu) */

SELECT * FROM dbo.Employees 
WHERE LastName LIKE REGEXP'%[a]%[a]';

/*2.  Napisz zapytanie, które pokaże nam wszystkie osoby kontaktowe z nazwiskiem zaczynającym się na ‘L’ (imię i nazwisko w bazie to jedna kolumna). */

SELECT * FROM dbo.Employees 
WHERE LastName LIKE 'L%';