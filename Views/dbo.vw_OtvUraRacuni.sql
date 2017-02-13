SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_OtvUraRacuni]
AS

SELECT TOP 100 PERCENT 	KnjigaURA.Partner
,KnjigaURA.UkupniIznosRacuna IznosRacuna
,SUM(UplateURA.Iznos) AS Zatvoreno
	,KnjigaURA.UkupniIznosRacuna-COALESCE(SUM(UplateURA.Iznos),0) AS Slobodno
	,KnjigaURA.Broj
	,CAST(KnjigaURA.Datum AS DATE) Datum

	
FROM KnjigaURA
INNER JOIN Partneri ON KnjigaURA.Partner = Partneri.SkraceniNaziv
LEFT OUTER JOIN UplateURA ON KnjigaURA.ID = UplateURA.IDRacuna
WHERE (
		(KnjigaURA.Vrsta = 0)
		OR (KnjigaURA.Vrsta = 4)
		OR (KnjigaURA.Vrsta IS NULL)
		)
	AND KnjigaURA.UkupniIznosRacuna > 0
	
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
