SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_BlagajnaStavke]
AS
SELECT        Datum, RedniBroj, Broj, Tip, Primitak, Izdatak, Svrha, Opis, Subjekt, Blagajnik, Slobodno, KPI, UID, Blagajna
FROM            dbo.BlagajnaUplatniceIsplatnice
GO
