SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vw_UpdateBankovniRacuni]
AS
SELECT        Broj, IDPartnera
FROM            dbo.BankovniRacuni

GO
