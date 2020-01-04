--charindex

SELECT CHARINDEX('SQLa', 'Wszyscy chca sie uczyc SQLa')  -- daje 24 znaki

SELECT CHARINDEX('SQLa', 'Wszyscy chca sie uczyc SQLa,
Basia tez chce sie uczyc SQLa', 25)

SELECT LOWER(shipname) , shipname
FROM Sales.Orders

SELECT DATALENGTH('Wszyscy chca sie uczyc SQLa    ')

SELECT LEN('Wszyscy chca sie uczyc SQLa    ')  --NIE LICZY SPACJI PO 

 
SELECT SUBSTRING('Wszyscy chca sie uczyc SQLa', 9, 4)  --WYLUSKANIE Z TEKSTU TYLKO "chca"


SELECT REPLACE('Wszycy lubia Basie', 'Basie', 'SQLa')  -- zamiana tekstu Basie na SQLq


SELECT GETDATE();


SELECT FORMAT(GETDATE(), 'dd/MM/yyyy', 'en-US');   --format zmienia format daty na zadeklarowany

SELECT
GETDATE(),
GETUTCDATE(),
CURRENT_TIMESTAMP,
SYSDATETIME(),
SYSDATETIMEOFFSET(),
SYSUTCDATETIME();


SELECT 3*NULL;

SELECT 1 + 'SIX'

SELECT 1 + '6'

DECLARE @SIX CHAR(4) = '6'
SELECT 1 + @SIX

DECLARE @A VARCHAR(2) = '25a'
DECLARE @B VARCHAR(2) = '15'

SELECT @A + @B

SELECT CAST(@A AS INT) + CAST(@B AS INT);   -- CAST ZMIENIA FORMAT NA W TYM WYPADKU INT

select convert(varchar(20), GETDATE(),101)
