SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_ArtikliRazvrstano]
AS
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Sifra]
      ,[Naziv]
     
      ,1 AS Kolicina
     
    
      ,[ID]
	  , Slozeni

FROM [dbo].[Artikli]
WHERE Slozeni = 0
UNION ALL
  SELECT [SifraArtikla] ,
  [NazivArtikla] ,
  [Kolicina], IDSlozenogArtikla, 1  
  FROM dbo.ArtikliElementi
  --WHERE IDSlozenogArtikla = @id
--  ORDER BY ID
GO
