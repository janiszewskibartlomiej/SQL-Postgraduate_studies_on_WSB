/*15. Napisz 11 grudnia 2011 r. Jako kolumnę z typem daty. 
Skorzystaj z różnych możliwości języka T-SQL (cast, convert, specific function, etc.) I użyj aliasu "somedate". */

SELECT CONVERT(Date, '12/11/2011', 101) AS somedate
SELECT CAST('20111211' AS Date)
SELECT DATEFROMPARTS(2011,12,11)


/*
16. Napisz instrukcję SELECT, aby zwrócić kolumny zawierające: 
  Trzy miesiące [threemonths] od bieżącej daty i godziny. Użyj aliasów. 
  Liczba dni między bieżącą datą a pierwszą kolumną [threemonths]. Użyj aliasu diffdays. 
  Liczba tygodni między 4 kwietnia 1992 a 16 września 2011. Użyj aliasów. 
  Pierwszy dzień w bieżącym miesiącu na podstawie bieżącej daty i godziny. Najpierw użyj aliasu. 
--------------------------------------------------------------------- 
*/

SELECT
	DATEADD(month, 3, CURRENT_TIMESTAMP) AS threemonths,
	DATEDIFF(day, CURRENT_TIMESTAMP,DATEADD(month, 3, CURRENT_TIMESTAMP)),
	DATEADD(day, Day(current_timestamp)+1, current_timestamp),
	DATEADD(day, EOMONTH(current_timestamp), current_timestamp)

SELECT EOMONTH(CURRENT_TIMESTAMP)+1
	-- z aliasow w seleccie nie mozna kozystac ze wzgledu na to ze select jest wykonywany pozniej