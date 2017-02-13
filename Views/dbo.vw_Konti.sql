SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vw_Konti]
AS
SELECT TOP 100 PERCENT BankovniRacuni.Broj      
 ,                      Partneri.SkraceniNaziv   
 ,                      BankovniRacuni.Valuta    
 ,                      BankovniRacuni.Konto     
 ,                      BankovniRacuni.IDPartnera
 ,                      DB_NAME()                 AS Baza
 FROM       BankovniRacuni
 INNER JOIN Partneri       ON BankovniRacuni.IDPartnera = Partneri.ID
 WHERE ( SELECT DISTINCT [BankovniRacun]) IS NOT NULL 
 ORDER BY  Partneri.SkraceniNaziv 
 COLLATE Croatian_CI_AS

GO
