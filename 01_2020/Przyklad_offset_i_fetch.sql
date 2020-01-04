-- DANE OD 10 DO 20 W£¥CZNIE - 10 WIERSZY
-- OFFSET I FETCH - NAWIAZUJE DO ORDER BY 

SELECT *
FROM Sales.Orders
ORDER BY orderid
OFFSET 9 ROWS FETCH NEXT 11 ROWS ONLY;  

--lub


SELECT TOP (10)*
FROM Sales.Orders
ORDER BY orderid


-- ciekawy przypadek - jezeli wezmiemy with ties to bierze 8 wierszy i sprawdza ze sa jesze orderid sa jesz 2 wiersze i je zwraca

SELECT TOP (8) WITH ties*
FROM Sales.Orders
ORDER BY orderid