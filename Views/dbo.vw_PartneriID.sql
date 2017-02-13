SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vw_PartneriID]
AS
SELECT        UPPER(SkraceniNaziv) AS Partner, ID
FROM            dbo.Partneri

GO
