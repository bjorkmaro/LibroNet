
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vw_IzvodiPredlosci]
AS
SELECT        TOP (100) PERCENT ID, Naziv, IDSvrhe, Dokument
FROM            dbo.GlavnaKnjigaPredlosci
WHERE        (Dokument LIKE N'%Izvod%') AND (NOT (Naziv LIKE N'q%'))
ORDER BY Dokument, Naziv
GO
