
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[vw_OtvIraPartner]
AS
SELECT TOP 100 PERCENT [Partner]
      ,SUM([IznosRacuna]) IznosRacuna
      ,SUM([Zatvoreno]) Zatvoreno
      ,SUM([Slobodno]) Slobodno

  FROM [dbo].[vw_OtvIraRacuni]
  GROUP BY Partner
  ORDER BY Partner

GO
