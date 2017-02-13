SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vw_PredlozakSvrhaDoznake]
AS
SELECT        dbo.GlavnaKnjigaPredlosci.Naziv AS NazivPredloska, dbo.GlavnaKnjigaPredlosci.ID AS IDPredloska, dbo.SvrhaDoznake.Naziv AS SvrhaDoznake, dbo.SvrhaDoznake.ID AS IDSvrheDoznake
FROM            dbo.GlavnaKnjigaPredlosci FULL OUTER JOIN
                         dbo.SvrhaDoznake ON dbo.GlavnaKnjigaPredlosci.IDSvrhe = dbo.SvrhaDoznake.ID
WHERE        (dbo.GlavnaKnjigaPredlosci.Dokument LIKE N'Izvod banke%')

GO
