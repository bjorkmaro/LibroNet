SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vw_IRA]
AS
SELECT        RedBroj, Broj, Datum, Dospjece, Partner, ObvezniciOsnovica, ObvezniciPorez, StopaPoreza, UkupniIznosRacuna, ApsolutniIznos, IDPredloska, UkljuciUObrazac
FROM            dbo.KnjigaIRA

GO
