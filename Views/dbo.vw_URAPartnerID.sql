SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[vw_URAPartnerID]  AS 
SELECT        CONCAT(dbo.Partneri.ID,'-',dbo.KnjigaURA.UkupniIznosRacuna)IDIznosURA,dbo.Partneri.ID, dbo.KnjigaURA.Partner, dbo.KnjigaURA.Datum, dbo.KnjigaURA.Broj, dbo.KnjigaURA.UkupniIznosRacuna, dbo.KnjigaURA.RedBroj
FROM            dbo.KnjigaURA INNER JOIN
                         dbo.Partneri ON dbo.KnjigaURA.Partner = dbo.Partneri.SkraceniNaziv
GO
