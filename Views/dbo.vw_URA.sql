SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE VIEW [dbo].[vw_URA]  AS 
SELECT    Partner, Broj, Datum, UkupniIznosRacuna,Neoporezivo,ID
FROM          dbo.KnjigaURA
--WHERE RedBroj > (SELECT MAX(RedBroj)-10	FROM dbo.KnjigaURA)
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



--CREATE VIEW [dbo].[vw_URA]  AS 
--SELECT    Partner, Broj, Datum, UkupniIznosRacuna,Neoporezivo,ID
--FROM          dbo.KnjigaURA
--WHERE RedBroj > (SELECT Max(RedBroj)-10	FROM dbo.KnjigaURA)

--GO





CREATE TRIGGER [dbo].[INSTEADOF_I_URA]
ON [dbo].[vw_URA]
INSTEAD OF INSERT AS


BEGIN
DECLARE @P NVARCHAR(100)
SELECT @P = i.Partner FROM INSERTED i

INSERT INTO dbo.KnjigaURA
        ( RedBroj,
          UkljuciUObrazac,
          Broj,
          Datum,
		  Dospjece,
          Partner,
          UkupniIznosRacuna,
		  Neoporezivo,
		  StopaPoreza,
		  Osnovica,
          PretporezUkupno,
          PretporezMozeSeOdbiti,
     	  IDPredloska,
          ApsolutniIznos,
          Slobodno,
		  VrstaRacuna)
     

SELECT (SELECT MAX(RedBroj)+1 FROM dbo.KnjigaURA),
1,
Broj,
COALESCE(Datum,GETDATE()),
COALESCE(Datum,GETDATE())+7,
[dbo].[udf_GetLastPartner](@P),
UkupniIznosRacuna,
COALESCE(Neoporezivo,0), 
25,
(UkupniIznosRacuna-COALESCE(Neoporezivo,0))*0.8,(UkupniIznosRacuna-COALESCE(Neoporezivo,0))*0.2,(UkupniIznosRacuna-COALESCE(Neoporezivo,0))*0.2,
[dbo].[udf_GetUraPredlozak]([dbo].[udf_GetLastPartner](Partner)),
UkupniIznosRacuna,
UkupniIznosRacuna,0
FROM inserted 		 ;

          
END
GO
