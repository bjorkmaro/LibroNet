
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[vw_UpdateIzvodiStavke]
AS
SELECT        DatumIzvoda AS Datum, IDDokumenta AS IDDok, Partner, Reklamacija AS Opis, Duguje, Potrazuje, Predlozak, IDPredloska, SvrhaDoznake, PozivNaBrojZaduzenja AS PNB1, PozivNaBrojOdobrenja AS PNB2, 
                         BrojRacuna AS IBAN, Slobodno, BrojNaloga, IDPartnera
FROM            dbo.IzvodiBankeStavke

GO

SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER [dbo].[INSTEADOF_I_IZVODI] ON [dbo].[vw_UpdateIzvodiStavke]
    INSTEAD OF INSERT
AS
    BEGIN
        DECLARE @p NVARCHAR(100);
        SELECT  @p = IIF(i.Partner = NULL, [dbo].[udf_GetNazivPartnera](i.IDPartnera), i.Partner)
        FROM    INSERTED i;

        IF dbo.[udf_PartnerExists](@p) IS NOT NULL
        BEGIN

            DECLARE @dug FLOAT;
            SELECT  @dug = i.Duguje
            FROM    Inserted i;

            DECLARE @pot FLOAT;
            SELECT  @pot = i.Potrazuje
            FROM    Inserted i;

            DECLARE @IDPredloska INT;
            SELECT  @IDPredloska = i.IDPredloska
            FROM    Inserted i;

            IF dbo.[udf_CheckPredlosak](@IDPredloska, @dug, @pot) IS NOT NULL
            BEGIN

                DECLARE @idp INT;
                SELECT  @idp = [dbo].[udf_GetIDPartnera](@p);

                DECLARE @d DATE; 
                SELECT  @d = COALESCE(i.Datum, GETDATE())
                FROM    INSERTED i;

                DECLARE @IDDokumenta INT;

                EXECUTE dbo.usp_IzvodiBanke_Insert @d, @IDDokumenta OUTPUT;

			   INSERT  INTO [vw_UpdateIzvodiStavke]
                        ( [Datum] ,
                          [IDDok] ,
                          [Partner] ,
                          [Opis] ,
                          [Duguje] ,
                          [Potrazuje] ,
                          [Predlozak] ,
                          [IDPredloska] ,
                          [SvrhaDoznake] ,
                          [PNB1] ,
                          [PNB2] ,
                          [IBAN] ,
                          [Slobodno] ,
                          [BrojNaloga] ,
                          [IDPartnera]
                        )
                        SELECT  @d ,
                                @IDDokumenta ,
                                @p ,
                                i.Opis ,
                                @dug ,
                                @pot ,
                                [dbo].[udf_GetNazivPredloska](i.IDPredloska) ,
                                i.IDPredloska ,
                                i.SvrhaDoznake ,
                                i.PNB1 ,
                                i.PNB2 ,
                                i.IBAN ,
                                IIF(i.Slobodno < 0, i.Slobodno * -1, i.Slobodno) ,
                                i.BrojNaloga ,
                                @idp
                        FROM    inserted i;

            END;	  
          
        END;
    END;
GO
