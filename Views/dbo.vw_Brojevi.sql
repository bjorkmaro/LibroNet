SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

 
CREATE VIEW [dbo].[vw_Brojevi]
AS
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ID]
	,[Dokument]
	,[Broj]
FROM [dbo].[Brojevi]
WHERE BROJ > 0

UNION ALL

SELECT [ID]
	,[Dokument]
	,Broj
FROM [dbo].[BrojeviInterni]
WHERE BROJ > 0

GO
