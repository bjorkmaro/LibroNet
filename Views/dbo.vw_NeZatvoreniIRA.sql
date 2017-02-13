SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--NEZATVORENI ULAZNI


--SELECT SUM(UplateURA.Iznos) AS SumOfIznos
--	,KnjigaURA.Broj
--	,KnjigaURA.Datum
--	,KnjigaURA.Partner
--	,KnjigaURA.UkupniIznosRacuna
--	,KnjigaURA.Dospjece
--FROM KnjigaURA
--INNER JOIN Partneri ON KnjigaURA.Partner = Partneri.SkraceniNaziv
--LEFT OUTER JOIN UplateURA ON KnjigaURA.ID = UplateURA.IDRacuna
--WHERE (
--		(KnjigaURA.Vrsta = 0)
--		OR (KnjigaURA.Vrsta = 4)
--		OR (KnjigaURA.Vrsta IS NULL)
--		)
--	AND KnjigaURA.UkupniIznosRacuna > 0
--	AND (
--		(KnjigaURA.Datum >= CONVERT(DATETIME, '2000-01-01', 102))
--		AND (KnjigaURA.Datum <= CONVERT(DATETIME, '2020-12-14 23:59:59', 120))
--		)
--GROUP BY KnjigaURA.Broj
--	,KnjigaURA.Datum
--	,KnjigaURA.Partner
--	,KnjigaURA.UkupniIznosRacuna
--	,KnjigaURA.Dospjece
--HAVING (ROUND(KnjigaURA.UkupniIznosRacuna, 2) > ROUND(Sum(UplateURA.Iznos), 2))
--	OR (Sum(UplateURA.Iznos) IS NULL)
--ORDER BY KnjigaURA.Partner
--	,KnjigaURA.Datum
--	,KnjigaURA.Broj
 
-- GO

 -- NEZATVORENI IZLAZNI

 CREATE VIEW [dbo].[vw_NeZatvoreniIRA]
 AS

SELECT TOP 100 PERCENT Sum(UplateIRA.Iznos) AS SumOfIznos
	,KnjigaIRA.Broj
	,KnjigaIRA.Datum
	,KnjigaIRA.Partner
	,KnjigaIRA.UkupniIznosRacuna
	,KnjigaIRA.Dospjece
FROM KnjigaIRA
INNER JOIN Partneri ON KnjigaIRA.Partner = Partneri.SkraceniNaziv
LEFT OUTER JOIN UplateIRA ON KnjigaIRA.ID = UplateIRA.IDRacuna
WHERE (KnjigaIRA.Vrsta = 0)
	AND KnjigaIRA.UkupniIznosRacuna > 0
	AND (
		(KnjigaIRA.Datum >= CONVERT(DATETIME, '2000-01-01', 102))
		AND (KnjigaIRA.Datum <= CONVERT(DATETIME, '2020-12-14 23:59:59', 120))
		)
GROUP BY KnjigaIRA.Broj
	,KnjigaIRA.Datum
	,KnjigaIRA.Partner
	,KnjigaIRA.UkupniIznosRacuna
	,KnjigaIRA.Dospjece
HAVING (ROUND(KnjigaIRA.UkupniIznosRacuna, 2) > ROUND(Sum(UplateIRA.Iznos), 2))
	OR (Sum(UplateIRA.Iznos) IS NULL)
ORDER BY KnjigaIRA.Partner
	,KnjigaIRA.Datum
	,KnjigaIRA.Broj
GO
