SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vw_Partneri]
AS
SELECT TOP (100) PERCENT SkraceniNaziv AS Partner
	,Sifra
	,Vrsta
	,MaticniBroj AS MB
	,RobnoPoslovanje AS Robno
	,ID
	,BankovniRacun AS IBAN
	,Naziv
FROM dbo.Partneri
ORDER BY SkraceniNaziv
	,ID
GO
