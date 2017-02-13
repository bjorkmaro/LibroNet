SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_NeRazduzeno]
AS
SELECT        dbo.RazduzenjeStavke.SifraArtikla, dbo.RazduzenjeStavke.NazivArtikla, SUM(dbo.RazduzenjeStavke.Kolicina) AS Kolicina, MIN(dbo.RazduzenjeStavke.IDDokumenta) AS IDDok, dbo.Artikli.ID AS IDArtikla, 
                         MAX(CAST(dbo.Artikli.Slozeni AS INT)) AS Slozeni
FROM            dbo.RazduzenjeStavke INNER JOIN
                         dbo.Razduzenje ON dbo.RazduzenjeStavke.IDDokumenta = dbo.Razduzenje.ID INNER JOIN
                         dbo.Artikli ON dbo.RazduzenjeStavke.SifraArtikla = dbo.Artikli.Sifra
WHERE        (dbo.Razduzenje.Zakljuceno IS NULL)
GROUP BY dbo.RazduzenjeStavke.SifraArtikla, dbo.RazduzenjeStavke.NazivArtikla, dbo.Artikli.ID
GO
