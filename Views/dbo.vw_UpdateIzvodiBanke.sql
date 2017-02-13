SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE VIEW [dbo].[vw_UpdateIzvodiBanke]
AS
SELECT        BrojRacuna, Broj, Datum
FROM            dbo.IzvodiBanke
GO
