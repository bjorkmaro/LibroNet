SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_OtvIraRacuni]
AS

SELECT TOP 100 PERCENT 

	KnjigaIRA.Partner
	
	,KnjigaIRA.UkupniIznosRacuna IznosRacuna
	,SUM(UplateIRA.Iznos) AS Zatvoreno
	,KnjigaIRA.UkupniIznosRacuna - COALESCE(SUM(UplateIRA.Iznos), 0) AS Slobodno
		,KnjigaIRA.Broj
	,CAST(KnjigaIRA.Datum AS DATE) Datum

FROM KnjigaIRA
INNER JOIN Partneri ON KnjigaIRA.Partner = Partneri.SkraceniNaziv
LEFT OUTER JOIN UplateIRA ON KnjigaIRA.ID = UplateIRA.IDRacuna
WHERE (KnjigaIRA.Vrsta = 0)
	AND KnjigaIRA.UkupniIznosRacuna > 0

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
