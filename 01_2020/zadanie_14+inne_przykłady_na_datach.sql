/*14. Napisz instrukcję SELECT, aby zwrócić kolumny zawierające: 
  Aktualna data i czas. Użyj aliasu currentdatetime. 
  Tylko aktualna data. Użyj aliasu currentdate. 
  Tylko aktualny czas. Użyj aliasu currenttime. 
  Tylko w bieżącym roku. Użyj aliasu currentyear. 
  Tylko numer bieżącego miesiąca. Użyj aliasu currentmonth. 
  Tylko numer bieżącego dnia miesiąca. Użyj aliasu currentday. 
  Tylko numer bieżącego tygodnia w roku. Użyj aliasu currentweeknumber. 
  Nazwa bieżącego miesiąca na podstawie kolumny currentdatetime. Użyj aliasu currentmonthname. 
Czy możesz użyć aliasu currentdatetime jako źródła w drugiej kolumnie (currentdate)? Proszę wytłumacz. */

SELECT YEAR(CURRENT_TIMESTAMP)

SELECT DATEPART(ww, GETDATE()),
DATENAME(mm, CURRENT_TIMESTAMP)

SELECT DATEADD(ww, 8, GETDATE())
SELECT ABS(DATEDIFF(d, '20200624', GETDATE()))

SELECT EOMONTH(CURRENT_TIMESTAMP)

IF ISDATE(GETDATE()) = 1
	PRINT 'VALID'
ELSE
	PRINT 'INVALID'


--ROZWIAZANIE

SELECT 
	CURRENT_TIMESTAMP AS currentdatetime,
	CAST(CURRENT_TIMESTAMP AS date) AS currentdate,
	CAST(CURRENT_TIMESTAMP AS time) AS currenttime,
	YEAR(CURRENT_TIMESTAMP) AS currentyear,
	MONTH(CURRENT_TIMESTAMP) AS currentmonth,
	DAY(CURRENT_TIMESTAMP) AS currentday,
	DATEPART(week, CURRENT_TIMESTAMP) AS currentweeknumber,
	DATENAME(month, CURRENT_TIMESTAMP) AS currentmonthname;