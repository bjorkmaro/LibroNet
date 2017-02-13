SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vw_Normativi]
AS
SELECT        TOP (100) PERCENT dbo.Artikli.ID, dbo.Artikli.Sifra, dbo.Artikli.Naziv, dbo.Artikli.JedinicaMjere, dbo.ArtikliElementi.SifraArtikla, dbo.ArtikliElementi.NazivArtikla, dbo.ArtikliElementi.Kolicina
FROM            dbo.Artikli INNER JOIN
                         dbo.ArtikliElementi ON dbo.Artikli.ID = dbo.ArtikliElementi.IDSlozenogArtikla
WHERE        (dbo.Artikli.Slozeni = 1)
ORDER BY dbo.Artikli.Naziv, dbo.ArtikliElementi.NazivArtikla
GO
