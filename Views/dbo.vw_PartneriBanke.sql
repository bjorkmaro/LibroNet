SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE VIEW [dbo].[vw_PartneriBanke]
AS
SELECT        TOP (100) PERCENT dbo.Partneri.SkraceniNaziv AS Partner, dbo.Partneri.ID, dbo.BankovniRacuni.Broj AS IBAN
FROM            dbo.Partneri LEFT OUTER JOIN
                         dbo.BankovniRacuni ON dbo.Partneri.ID = dbo.BankovniRacuni.IDPartnera

GO
