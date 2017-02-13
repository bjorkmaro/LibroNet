SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vw_INFO]
AS
SELECT (
		SELECT tvrtka
		FROM master.dbo.Tvrtke t
		WHERE Db_Name() = t.FileName
		) AS Tvrtka
	,Db_Name() AS DB
	,(
		SELECT Count(ID)
		FROM dbo.IzvodiBankeStavke
		) AS BrStavki
	,(
		SELECT Max(Cast([Datum] AS DATE))
		FROM IzvodiBanke
		) AS ZadnjiIzvod
	,(
		SELECT Sum(Duguje)
		FROM IzvodiBanke
		) AS Rashodi
	,(
		SELECT Sum(Potrazuje)
		FROM IzvodiBanke
		) AS Prihodi
	,Iif((
			(
				SELECT Round(Sum(Duguje), 0)
				FROM IzvodiBanke
				) - (
				SELECT Round(Sum(Duguje), 0)
				FROM dbo.IzvodiBankeStavke
				) = 0
			), 'OK', 'Err') AS DugTest
	,Iif((
			(
				SELECT Round(Sum(Potrazuje), 0)
				FROM IzvodiBanke
				) - (
				SELECT Round(Sum(Potrazuje), 0)
				FROM dbo.IzvodiBankeStavke
				) = 0
			), 'OK', 'Err') AS PotTest
	,(SELECT COUNT(DISTINCT(ibs.Partner)) FROM(
SELECT Partner FROM dbo.IzvodiBankeStavke
except SELECT SkraceniNaziv AS Partner FROM Partneri) ibs) AS  IBS_P_T
	,	(
		SELECT CAST(MAX(ki.Datum) AS DATE)
		FROM dbo.KnjigaIRA ki
		WHERE ki.RedBroj IS NOT NULL
		) ZadnjiDatumIRA
	,(
		SELECT Sum(ki.UkupniIznosRacuna)
		FROM dbo.KnjigaIRA ki
		) AS IRA_Total
	,(
		SELECT Sum(ki.UkupniIznosRacuna * (ki.StopaPoreza / 100))
		FROM dbo.KnjigaIRA ki
		) AS IRA_PDV
	,(
		SELECT CAST(MAX(ku.Datum) AS DATE)
		FROM dbo.KnjigaURA ku
		WHERE ku.RedBroj IS NOT NULL
		) ZadnjiDatumURA
	,(
		SELECT Sum(ku.UkupniIznosRacuna)
		FROM dbo.KnjigaURA ku
		) AS URA_Total
	,Cast((
			SELECT Sum(ku.UkupniIznosRacuna * (ku.StopaPoreza / 100))
			FROM dbo.KnjigaURA ku
			) AS INT) AS URA_PDV
GO
