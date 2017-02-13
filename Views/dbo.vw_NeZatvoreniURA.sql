SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
--NEZATVORENI ULAZNI
CREATE VIEW [dbo].[vw_NeZatvoreniURA]
AS

SELECT TOP 100 PERCENT SUM(UplateURA.Iznos) AS SumOfIznos
	,KnjigaURA.Broj
	,KnjigaURA.Datum
	,KnjigaURA.Partner
	,KnjigaURA.UkupniIznosRacuna
	,KnjigaURA.Dospjece
FROM KnjigaURA
INNER JOIN Partneri ON KnjigaURA.Partner = Partneri.SkraceniNaziv
LEFT OUTER JOIN UplateURA ON KnjigaURA.ID = UplateURA.IDRacuna
WHERE (
		(KnjigaURA.Vrsta = 0)
		OR (KnjigaURA.Vrsta = 4)
		OR (KnjigaURA.Vrsta IS NULL)
		)
	AND KnjigaURA.UkupniIznosRacuna > 0
	AND (
		(KnjigaURA.Datum >= CONVERT(DATETIME, '2000-01-01', 102))
		AND (KnjigaURA.Datum <= CONVERT(DATETIME, '2020-12-14 23:59:59', 120))
		)
GROUP BY KnjigaURA.Broj
	,KnjigaURA.Datum
	,KnjigaURA.Partner
	,KnjigaURA.UkupniIznosRacuna
	,KnjigaURA.Dospjece
HAVING (ROUND(KnjigaURA.UkupniIznosRacuna, 2) > ROUND(Sum(UplateURA.Iznos), 2))
	OR (Sum(UplateURA.Iznos) IS NULL)
ORDER BY KnjigaURA.Partner
	,KnjigaURA.Datum
	,KnjigaURA.Broj
GO
