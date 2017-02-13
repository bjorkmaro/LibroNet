SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_IzvodiInsertBlagajna]
AS
SELECT        Datum, RedniBroj, Broj, Tip, Izdatak, Primitak, Slobodno, Blagajna, Blagajnik, Subjekt, Svrha, Opis, UID
FROM            dbo.BlagajnaUplatniceIsplatnice
GO
