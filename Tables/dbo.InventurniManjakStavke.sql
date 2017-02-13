CREATE TABLE [dbo].[InventurniManjakStavke]
(
[SifraArtikla] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[NazivArtikla] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Kolicina] [float] NULL CONSTRAINT [DF__Inventurn__Kolic__6991A7CB] DEFAULT ((0)),
[Cijena] [float] NULL CONSTRAINT [DF__Inventurn__Cijen__6A85CC04] DEFAULT ((0)),
[Vrijednost] [float] NULL CONSTRAINT [DF__Inventurn__Vrije__6B79F03D] DEFAULT ((0)),
[RUC] [float] NULL CONSTRAINT [DF__InventurniM__RUC__6C6E1476] DEFAULT ((0)),
[Porez] [float] NULL CONSTRAINT [DF__Inventurn__Porez__6D6238AF] DEFAULT ((0)),
[ProdajnaCijena] [float] NULL CONSTRAINT [DF__Inventurn__Proda__6E565CE8] DEFAULT ((0)),
[ProdajnaVrijednost] [float] NULL CONSTRAINT [DF__Inventurn__Proda__6F4A8121] DEFAULT ((0)),
[IDDokumenta] [int] NULL CONSTRAINT [DF__Inventurn__IDDok__703EA55A] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER [dbo].[IMSkidanjeStanja] ON [dbo].[InventurniManjakStavke] 
AFTER INSERT, UPDATE
AS
--Trigger se aktivira cak i ako nijedan zapis nije promijenjen
--U tom slucaju funkcija @@ROWCOUNT ce vratiti 0
IF @@ROWCOUNT = 0
  RETURN

SET NOCOUNT ON
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

--Treba izvrsiti samo ako je mijenjana kolicina.
--Normalno bi trebalo i u slucaju izmjene artikla, ali bi se tada operacija
--izvrsavala i u slucaju izmjene sifre/naziva u tabli 'Artikli' zbog kaskadiranja.
--Program se brine da uvijek kod izmjene artikla u stavci upise i kolicinu.
--Uporaba funkcije SUBSTRING je neophodna jer COLUMNS_UPDATED() vraca bajtove
--slijeva nadesno, ali bitove unutar bajta zdesna nalijevo
IF (SUBSTRING(COLUMNS_UPDATED(), 1, 1) & 4) > 0
BEGIN
	DECLARE @Metoda TINYINT
	DECLARE @Inserted CURSOR
	DECLARE @Skladiste CURSOR
	DECLARE @Sifra VARCHAR(10)
	DECLARE @IDDok INT
	DECLARE @IDStavke INT
	DECLARE @Kol FLOAT
	DECLARE @Kolicina FLOAT
	DECLARE @Veza FLOAT
	DECLARE @EndDate DATETIME
	DECLARE @IDPJ INT
	DECLARE @VrstaPJ TINYINT
	DECLARE @Vrsta BIT
	DECLARE @Dat DATETIME
	DECLARE @IDUlaza INT
	DECLARE @Cijena FLOAT
	DECLARE @Stanje FLOAT
	DECLARE @Nabav FLOAT

	SET @Metoda = (SELECT Postav FROM PostaviBroj WHERE Naziv = 'MetodaZaliha')
	
	SET @Inserted = CURSOR FORWARD_ONLY READ_ONLY STATIC
	FOR
	  SELECT SifraArtikla, Kolicina, IDDokumenta, ID FROM inserted
	
	OPEN @Inserted
	
	FETCH NEXT FROM @Inserted
	  INTO @Sifra, @Kol, @IDDok, @IDStavke
  
  WHILE @@FETCH_STATUS = 0
  BEGIN
    SET @Kolicina = @Kol
    
		SELECT @EndDate = InventurniManjak.Datum, @IDPJ = InventurniManjak.IDPJ, @VrstaPJ = PartneriPoslovnice.Vrsta
    FROM InventurniManjak INNER JOIN PartneriPoslovnice ON InventurniManjak.IDPJ = PartneriPoslovnice.ID
    WHERE InventurniManjak.ID = @IDDok
    
    IF @Metoda = 0
      --FIFO
      SET @Skladiste = CURSOR FORWARD_ONLY READ_ONLY STATIC
        FOR
          SELECT 0 AS Vrsta, Primka.Datum, Primka.Broj, PrimkaStavke.ID, (PrimkaStavke.NabavnaVrijednost / PrimkaStavke.Kolicina) AS Cijena, PrimkaStavke.Stanje
          FROM Primka INNER JOIN PrimkaStavke ON Primka.ID = PrimkaStavke.IDDokumenta
          WHERE (Primka.Broj <> -1) AND (PrimkaStavke.SifraArtikla = @Sifra) AND (Primka.Datum <= @EndDate) AND (PrimkaStavke.Stanje > 0) AND (Primka.ZakljucenoR > 0) AND (Primka.IDPJ = @IDPJ) AND (PrimkaStavke.FiktivnaStavka = 0) AND (Primka.Formirano > 0 OR @VrstaPJ <> 1)
          UNION ALL SELECT 0 AS Vrsta, PovratnicaOdKupca.Datum, Primka.Broj, PrimkaStavke.ID, (PrimkaStavke.NabavnaVrijednost / PrimkaStavke.Kolicina) AS Cijena, PrimkaStavke.Stanje
          FROM PrimkaStavke INNER JOIN Primka ON PrimkaStavke.IDDokumenta = Primka.ID INNER JOIN VezaPovratnicaOdKupcaPrimka ON PrimkaStavke.ID = VezaPovratnicaOdKupcaPrimka.IDPrimkaStavke INNER JOIN PovratnicaOdKupcaStavke ON VezaPovratnicaOdKupcaPrimka.IDPovratnicaOdKupcaStavke = PovratnicaOdKupcaStavke.ID INNER JOIN PovratnicaOdKupca ON PovratnicaOdKupcaStavke.IDDokumenta = PovratnicaOdKupca.ID
          WHERE (Primka.Broj = - 1) AND (PrimkaStavke.SifraArtikla = @Sifra) AND (PovratnicaOdKupca.Datum <= @EndDate) AND (PrimkaStavke.Stanje > 0) AND (Primka.IDPJ = @IDPJ) AND (PrimkaStavke.FiktivnaStavka = 0) AND (Primka.Formirano > 0 OR @VrstaPJ <> 1) -- Povratnica od kupca koja nema definiranu otpremnicu. Nije potrebno provjeravati je li zakljucena jer u suprotnom ne bi bilo veza s primkom
          UNION ALL SELECT 1 AS Vrsta, InternaPrimka.Datum, InternaPrimka.Broj, InternaPrimkaStavke.ID, (InternaPrimkaStavke.NabavnaVrijednost / InternaPrimkaStavke.Kolicina) AS Cijena, InternaPrimkaStavke.Stanje
          FROM InternaPrimka INNER JOIN InternaPrimkaStavke ON InternaPrimka.ID = InternaPrimkaStavke.IDDokumenta
          WHERE (InternaPrimkaStavke.SifraArtikla = @Sifra) AND (InternaPrimka.Datum <= @EndDate) AND (InternaPrimkaStavke.Stanje > 0) AND (InternaPrimka.ZakljucenoR > 0) AND (InternaPrimka.IDPJ = @IDPJ) AND (InternaPrimkaStavke.FiktivnaStavka = 0) AND (InternaPrimka.Formirano > 0 OR @VrstaPJ <> 1)
          ORDER BY Datum ASC, Broj ASC
    ELSE
    IF @Metoda = 1
      --LIFO
      SET @Skladiste = CURSOR FORWARD_ONLY READ_ONLY STATIC
        FOR
          SELECT 0 AS Vrsta, Primka.Datum, Primka.Broj, PrimkaStavke.ID, (PrimkaStavke.NabavnaVrijednost / PrimkaStavke.Kolicina) AS Cijena, PrimkaStavke.Stanje
          FROM Primka INNER JOIN PrimkaStavke ON Primka.ID = PrimkaStavke.IDDokumenta
          WHERE (Primka.Broj <> -1) AND (PrimkaStavke.SifraArtikla = @Sifra) AND (Primka.Datum <= @EndDate) AND (PrimkaStavke.Stanje > 0) AND (Primka.ZakljucenoR > 0) AND (Primka.IDPJ = @IDPJ) AND (PrimkaStavke.FiktivnaStavka = 0) AND (Primka.Formirano > 0 OR @VrstaPJ <> 1)
          UNION ALL SELECT 0 AS Vrsta, PovratnicaOdKupca.Datum, Primka.Broj, PrimkaStavke.ID, (PrimkaStavke.NabavnaVrijednost / PrimkaStavke.Kolicina) AS Cijena, PrimkaStavke.Stanje
          FROM PrimkaStavke INNER JOIN Primka ON PrimkaStavke.IDDokumenta = Primka.ID INNER JOIN VezaPovratnicaOdKupcaPrimka ON PrimkaStavke.ID = VezaPovratnicaOdKupcaPrimka.IDPrimkaStavke INNER JOIN PovratnicaOdKupcaStavke ON VezaPovratnicaOdKupcaPrimka.IDPovratnicaOdKupcaStavke = PovratnicaOdKupcaStavke.ID INNER JOIN PovratnicaOdKupca ON PovratnicaOdKupcaStavke.IDDokumenta = PovratnicaOdKupca.ID
          WHERE (Primka.Broj = - 1) AND (PrimkaStavke.SifraArtikla = @Sifra) AND (PovratnicaOdKupca.Datum <= @EndDate) AND (PrimkaStavke.Stanje > 0) AND (Primka.IDPJ = @IDPJ) AND (PrimkaStavke.FiktivnaStavka = 0) AND (Primka.Formirano > 0 OR @VrstaPJ <> 1) -- Povratnica od kupca koja nema definiranu otpremnicu. Nije potrebno provjeravati je li zakljucena jer u suprotnom ne bi bilo veza s primkom
          UNION ALL SELECT 1 AS Vrsta, InternaPrimka.Datum, InternaPrimka.Broj, InternaPrimkaStavke.ID, (InternaPrimkaStavke.NabavnaVrijednost / InternaPrimkaStavke.Kolicina) AS Cijena, InternaPrimkaStavke.Stanje
          FROM InternaPrimka INNER JOIN InternaPrimkaStavke ON InternaPrimka.ID = InternaPrimkaStavke.IDDokumenta
          WHERE (InternaPrimkaStavke.SifraArtikla = @Sifra) AND (InternaPrimka.Datum <= @EndDate) AND (InternaPrimkaStavke.Stanje > 0) AND (InternaPrimka.ZakljucenoR > 0) AND (InternaPrimkaStavke.FiktivnaStavka = 0) AND (InternaPrimka.IDPJ = @IDPJ) AND (InternaPrimkaStavke.FiktivnaStavka = 0) AND (InternaPrimka.Formirano > 0 OR @VrstaPJ <> 1)
          ORDER BY Datum DESC, Broj DESC
    ELSE
    IF @Metoda = 2
      --HIFO
      SET @Skladiste = CURSOR FORWARD_ONLY READ_ONLY STATIC
        FOR
          SELECT 0 AS Vrsta, Primka.Datum, Primka.Broj, PrimkaStavke.ID, (PrimkaStavke.NabavnaVrijednost / PrimkaStavke.Kolicina) AS Cijena, PrimkaStavke.Stanje
          FROM Primka INNER JOIN PrimkaStavke ON Primka.ID = PrimkaStavke.IDDokumenta
          WHERE (Primka.Broj <> -1) AND (PrimkaStavke.SifraArtikla = @Sifra) AND (Primka.Datum <= @EndDate) AND (PrimkaStavke.Stanje > 0) AND (Primka.ZakljucenoR > 0) AND (Primka.IDPJ = @IDPJ) AND (Primka.Formirano > 0 OR @VrstaPJ <> 1)
          UNION ALL SELECT 0 AS Vrsta, PovratnicaOdKupca.Datum, Primka.Broj, PrimkaStavke.ID, (PrimkaStavke.NabavnaVrijednost / PrimkaStavke.Kolicina) AS Cijena, PrimkaStavke.Stanje
          FROM PrimkaStavke INNER JOIN Primka ON PrimkaStavke.IDDokumenta = Primka.ID INNER JOIN VezaPovratnicaOdKupcaPrimka ON PrimkaStavke.ID = VezaPovratnicaOdKupcaPrimka.IDPrimkaStavke INNER JOIN PovratnicaOdKupcaStavke ON VezaPovratnicaOdKupcaPrimka.IDPovratnicaOdKupcaStavke = PovratnicaOdKupcaStavke.ID INNER JOIN PovratnicaOdKupca ON PovratnicaOdKupcaStavke.IDDokumenta = PovratnicaOdKupca.ID
          WHERE (Primka.Broj = - 1) AND (PrimkaStavke.SifraArtikla = @Sifra) AND (PovratnicaOdKupca.Datum <= @EndDate) AND (PrimkaStavke.Stanje > 0) AND (Primka.IDPJ = @IDPJ) AND (PrimkaStavke.FiktivnaStavka = 0) AND (Primka.Formirano > 0 OR @VrstaPJ <> 1) -- Povratnica od kupca koja nema definiranu otpremnicu. Nije potrebno provjeravati je li zakljucena jer u suprotnom ne bi bilo veza s primkom
          UNION ALL SELECT 1 AS Vrsta, InternaPrimka.Datum, InternaPrimka.Broj, InternaPrimkaStavke.ID, (InternaPrimkaStavke.NabavnaVrijednost / InternaPrimkaStavke.Kolicina) AS Cijena, InternaPrimkaStavke.Stanje
          FROM InternaPrimka INNER JOIN InternaPrimkaStavke ON InternaPrimka.ID = InternaPrimkaStavke.IDDokumenta
          WHERE (InternaPrimkaStavke.SifraArtikla = @Sifra) AND (InternaPrimka.Datum <= @EndDate) AND (InternaPrimkaStavke.Stanje > 0) AND (InternaPrimka.ZakljucenoR > 0) AND (InternaPrimka.IDPJ = @IDPJ) AND (InternaPrimkaStavke.FiktivnaStavka = 0) AND (InternaPrimka.Formirano > 0 OR @VrstaPJ <> 1)
          ORDER BY Cijena DESC
    ELSE
      --Prosjecne cijene
      SET @Skladiste = CURSOR FORWARD_ONLY READ_ONLY STATIC
        FOR
          SELECT 0 AS Vrsta, Primka.Datum, Primka.Broj, PrimkaStavke.ID, (PrimkaStavke.NabavnaVrijednost / PrimkaStavke.Kolicina) AS Cijena, PrimkaStavke.Stanje
          FROM Primka INNER JOIN PrimkaStavke ON Primka.ID = PrimkaStavke.IDDokumenta
          WHERE (Primka.Broj <> -1) AND (PrimkaStavke.SifraArtikla = @Sifra) AND (Primka.Datum <= @EndDate) AND (PrimkaStavke.Stanje > 0) AND (Primka.ZakljucenoR > 0) AND (Primka.IDPJ = @IDPJ) AND (PrimkaStavke.FiktivnaStavka = 0) AND (Primka.Formirano > 0 OR @VrstaPJ <> 1)
          UNION ALL SELECT 0 AS Vrsta, PovratnicaOdKupca.Datum, Primka.Broj, PrimkaStavke.ID, (PrimkaStavke.NabavnaVrijednost / PrimkaStavke.Kolicina) AS Cijena, PrimkaStavke.Stanje
          FROM PrimkaStavke INNER JOIN Primka ON PrimkaStavke.IDDokumenta = Primka.ID INNER JOIN VezaPovratnicaOdKupcaPrimka ON PrimkaStavke.ID = VezaPovratnicaOdKupcaPrimka.IDPrimkaStavke INNER JOIN PovratnicaOdKupcaStavke ON VezaPovratnicaOdKupcaPrimka.IDPovratnicaOdKupcaStavke = PovratnicaOdKupcaStavke.ID INNER JOIN PovratnicaOdKupca ON PovratnicaOdKupcaStavke.IDDokumenta = PovratnicaOdKupca.ID
          WHERE (Primka.Broj = - 1) AND (PrimkaStavke.SifraArtikla = @Sifra) AND (PovratnicaOdKupca.Datum <= @EndDate) AND (PrimkaStavke.Stanje > 0) AND (Primka.IDPJ = @IDPJ) AND (PrimkaStavke.FiktivnaStavka = 0) AND (Primka.Formirano > 0 OR @VrstaPJ <> 1) -- Povratnica od kupca koja nema definiranu otpremnicu. Nije potrebno provjeravati je li zakljucena jer u suprotnom ne bi bilo veza s primkom
          UNION ALL SELECT 1 AS Vrsta, InternaPrimka.Datum, InternaPrimka.Broj, InternaPrimkaStavke.ID, (InternaPrimkaStavke.NabavnaVrijednost / InternaPrimkaStavke.Kolicina) AS Cijena, InternaPrimkaStavke.Stanje
          FROM InternaPrimka INNER JOIN InternaPrimkaStavke ON InternaPrimka.ID = InternaPrimkaStavke.IDDokumenta
          WHERE (InternaPrimkaStavke.SifraArtikla = @Sifra) AND (InternaPrimka.Datum <= @EndDate) AND (InternaPrimkaStavke.Stanje > 0) AND (InternaPrimka.ZakljucenoR > 0) AND (InternaPrimka.IDPJ = @IDPJ) AND (InternaPrimkaStavke.FiktivnaStavka = 0) AND (InternaPrimka.Formirano > 0 OR @VrstaPJ <> 1)
          ORDER BY Datum ASC, Broj ASC
    
    OPEN @Skladiste
    
    SET @Nabav = 0
    
    --@IDDok nije potreban u ovom trenutku, koristimo ga za spremanje broja koji nam zapravo treba samo za ORDER BY
    FETCH NEXT FROM @Skladiste
      INTO @Vrsta, @Dat, @IDDok, @IDUlaza, @Cijena, @Stanje

    WHILE @@FETCH_STATUS = 0
    BEGIN
      IF ROUND(@Kol, 3) <= ROUND(@Stanje, 3)
        BEGIN
          SET @Veza = @Kol
          SET @Kol = 0
        END
      ELSE
        BEGIN
          SET @Veza = @Stanje
          SET @Kol = @Kol - @Stanje
        END
      
      IF @Vrsta = 0
        BEGIN
          UPDATE PrimkaStavke SET PrimkaStavke.Stanje = PrimkaStavke.Stanje - @Veza WHERE PrimkaStavke.ID = @IDUlaza
          INSERT INTO VezaInventurniManjakPrimka (IDInventurniManjakStavke, IDPrimkaStavke, Kolicina) VALUES (@IDStavke, @IDUlaza, @Veza)
        END
      ELSE
        BEGIN
          UPDATE InternaPrimkaStavke SET InternaPrimkaStavke.Stanje = InternaPrimkaStavke.Stanje - @Veza WHERE InternaPrimkaStavke.ID = @IDUlaza
          INSERT INTO VezaInventurniManjakPrimka (IDInventurniManjakStavke, IDInternaPrimkaStavke, Kolicina) VALUES (@IDStavke, @IDUlaza, @Veza)
        END
      
      IF @Metoda <> 3
        SET @Nabav = @Nabav + (@Cijena * @Veza)

      IF ROUND(@Kol, 3) = 0
        -- Spremamo vrijednost u stavku, osim ako razduzujemo po metodi prosjecnih cijena
        -- U tom slucaju vrijednost spremamo kad se procesiraju svi zapisi (vidi dolje)
        BEGIN
          IF @Metoda <> 3
            UPDATE InventurniManjakStavke SET Vrijednost = @Nabav, Cijena = @Nabav / Kolicina WHERE ID = @IDStavke
          
          BREAK
        END
      
      FETCH NEXT FROM @Skladiste
        INTO @Vrsta, @Dat, @IDDok, @IDUlaza, @Cijena, @Stanje
    END
    
    IF ROUND(@Kol, 3) > 0
      BEGIN
        DECLARE @MSG VARCHAR(60)
        SET @MSG = CAST(@Kol AS VARCHAR) + ' Na skladistu nema dovoljno kolicine za odabrani artikl'
        RAISERROR (@MSG, 16 ,1)
        CLOSE @Skladiste
        DEALLOCATE @Skladiste
        CLOSE @Inserted
        DEALLOCATE @Inserted
        RETURN
      END
    
    IF @Metoda = 3
      BEGIN
        SELECT @Nabav = SUM(NabavnaVrijednost), @Stanje = SUM(Stanje)
        FROM (SELECT PrimkaStavke.NabavnaVrijednost, PrimkaStavke.Stanje FROM Primka INNER JOIN PrimkaStavke ON Primka.ID = PrimkaStavke.IDDokumenta
        WHERE (PrimkaStavke.SifraArtikla = @Sifra) AND (Primka.Datum <= @EndDate) AND (Primka.IDPJ = @IDPJ) AND (PrimkaStavke.FiktivnaStavka = 0) AND (Primka.Formirano > 0 OR @VrstaPJ <> 1)
        UNION ALL SELECT InternaPrimkaStavke.NabavnaVrijednost, InternaPrimkaStavke.Stanje FROM InternaPrimka INNER JOIN InternaPrimkaStavke ON InternaPrimka.ID = InternaPrimkaStavke.IDDokumenta
        WHERE (InternaPrimkaStavke.SifraArtikla = @Sifra) AND (InternaPrimka.Datum <= @EndDate) AND (InternaPrimka.IDPJ = @IDPJ) AND (InternaPrimkaStavke.FiktivnaStavka = 0) AND (InternaPrimka.Formirano > 0 OR @VrstaPJ <> 1)) T

        IF @Nabav IS NULL
          SET @Nabav = 0
        IF @Stanje IS NULL
          SET @Stanje = 0
        
        SET @Stanje = @Stanje + @Kolicina
        
        SELECT @Cijena = SUM(Vrijednost)
        FROM (SELECT OtpremnicaStavke.Vrijednost
        FROM Otpremnica INNER JOIN OtpremnicaStavke ON Otpremnica.ID = OtpremnicaStavke.IDDokumenta
        WHERE (Otpremnica.Datum <= @EndDate) AND OtpremnicaStavke.SifraArtikla = @Sifra AND Otpremnica.IDPJ = @IDPJ
        UNION ALL SELECT InternaOtpremnicaStavke.Vrijednost
        FROM InternaOtpremnica INNER JOIN InternaOtpremnicaStavke ON InternaOtpremnica.ID = InternaOtpremnicaStavke.IDDokumenta
        WHERE (InternaOtpremnica.Datum <= @EndDate) AND InternaOtpremnicaStavke.SifraArtikla = @Sifra AND InternaOtpremnica.IDPJ = @IDPJ
        UNION ALL SELECT PovratnicaDobavljacuStavke.Vrijednost
        FROM PovratnicaDobavljacu INNER JOIN PovratnicaDobavljacuStavke ON PovratnicaDobavljacu.ID = PovratnicaDobavljacuStavke.IDDokumenta
        WHERE (PovratnicaDobavljacu.Datum <= @EndDate) AND PovratnicaDobavljacuStavke.SifraArtikla = @Sifra AND PovratnicaDobavljacu.IDPJ = @IDPJ
        UNION ALL SELECT InventurniManjakStavke.Vrijednost
        FROM InventurniManjak INNER JOIN InventurniManjakStavke ON InventurniManjak.ID = InventurniManjakStavke.IDDokumenta
        WHERE (InventurniManjak.Datum <= @EndDate) AND InventurniManjakStavke.SifraArtikla = @Sifra AND InventurniManjak.IDPJ = @IDPJ
        UNION ALL SELECT ZapisnikKRLKStavke.Vrijednost
        FROM ZapisnikKRLK INNER JOIN ZapisnikKRLKStavke ON ZapisnikKRLK.ID = ZapisnikKRLKStavke.IDDokumenta
        WHERE (ZapisnikKRLK.Datum <= @EndDate) AND ZapisnikKRLKStavke.SifraArtikla = @Sifra AND ZapisnikKRLK.IDPJ = @IDPJ
        UNION ALL SELECT RadniNalogStavke.Vrijednost
        FROM RadniNalog INNER JOIN RadniNalogPoslovi ON RadniNalog.ID = RadniNalogPoslovi.IDDokumenta INNER JOIN RadniNalogStavke ON RadniNalogPoslovi.ID = RadniNalogStavke.IDDokumenta
        WHERE (RadniNalog.DatumZakljuceno <= @EndDate) AND RadniNalogStavke.SifraArtikla = @Sifra AND RadniNalog.Zakljuceno>0 AND RadniNalogStavke.Vrsta=2 AND RadniNalog.IDPJ = @IDPJ
        UNION ALL SELECT SastavnicaStavke.Vrijednost
        FROM Sastavnica INNER JOIN SastavnicaStavke ON Sastavnica.ID = SastavnicaStavke.IDDokumenta
        WHERE (Sastavnica.DatumZakljuceno <= @EndDate) AND SastavnicaStavke.SifraArtikla = @Sifra AND Sastavnica.Zakljuceno>0 AND Sastavnica.IDPJ = @IDPJ) T

        IF @Cijena IS NULL
          SET @Cijena = 0
        
        SET @Nabav = @Nabav - @Cijena
        SET @Nabav = @Nabav / @Stanje
        
        UPDATE InventurniManjakStavke SET Vrijednost = @Nabav * Kolicina, Cijena = @Nabav WHERE ID = @IDStavke
      END
     
    CLOSE @Skladiste
    DEALLOCATE @Skladiste
  
    FETCH NEXT FROM @Inserted
      INTO @Sifra, @Kol, @IDDok, @IDStavke
  END
  
  CLOSE @Inserted
  DEALLOCATE @Inserted
END
UPDATE InventurniManjak
--Vrijednost se ne moze vaditi iz table inserted jer je sam trigger azurira
SET InventurniManjak.Vrijednost = InventurniManjak.Vrijednost + (SELECT SUM(InventurniManjakStavke.Vrijednost) FROM InventurniManjakStavke INNER JOIN inserted ON InventurniManjakStavke.ID = inserted.ID WHERE InventurniManjakStavke.IDDokumenta = InventurniManjak.ID),
    InventurniManjak.RUC = InventurniManjak.RUC + (SELECT SUM(RUC) FROM inserted WHERE IDDokumenta = InventurniManjak.ID),
    InventurniManjak.Porez = InventurniManjak.Porez + (SELECT SUM(Porez) FROM inserted WHERE IDDokumenta = InventurniManjak.ID),
    InventurniManjak.ProdajnaVrijednost = InventurniManjak.ProdajnaVrijednost + (SELECT SUM(ProdajnaVrijednost) FROM inserted WHERE IDDokumenta = InventurniManjak.ID)
FROM InventurniManjak, inserted
WHERE (InventurniManjak.ID = inserted.IDDokumenta)

SET TRANSACTION ISOLATION LEVEL READ COMMITTED

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER [dbo].[IMVracanjeStanja] ON [dbo].[InventurniManjakStavke] 
AFTER DELETE, UPDATE
AS
--Trigger se aktivira cak i ako nijedan zapis nije promijenjen
--U tom slucaju funkcija @@ROWCOUNT ce vratiti 0
IF @@ROWCOUNT = 0
  RETURN

SET NOCOUNT ON SET TRANSACTION ISOLATION LEVEL SERIALIZABLE

--U slucaju brisanja, tabla 'inserted' nece sadrzavati nijedan zapis.
--U slucaju izmjene, treba izvrsiti samo ako je mijenjana kolicina.
--Normalno bi trebalo i u slucaju izmjene artikla, ali bi se tada operacija
--izvrsavala i u slucaju izmjene sifre/naziva u tabli 'Artikli' zbog kaskadiranja.
--Program se brine da uvijek kod izmjene artikla u stavci upise i kolicinu.
--Uporaba funkcije SUBSTRING je neophodna jer COLUMNS_UPDATED() vraca bajtove
--slijeva nadesno, ali bitove unutar bajta zdesna nalijevo
IF ((SUBSTRING(COLUMNS_UPDATED(), 1, 1) & 4) > 0) OR (NOT EXISTS(SELECT 0 FROM inserted))
BEGIN
	UPDATE PrimkaStavke
	SET PrimkaStavke.Stanje = PrimkaStavke.Stanje + (SELECT SUM(VezaInventurniManjakPrimka.Kolicina) FROM VezaInventurniManjakPrimka INNER JOIN deleted ON VezaInventurniManjakPrimka.IDInventurniManjakStavke = deleted.ID WHERE VezaInventurniManjakPrimka.IDPrimkaStavke = PrimkaStavke.ID)
	FROM PrimkaStavke, deleted, VezaInventurniManjakPrimka
  WHERE (deleted.ID = VezaInventurniManjakPrimka.IDInventurniManjakStavke) AND (PrimkaStavke.ID = VezaInventurniManjakPrimka.IDPrimkaStavke)
  
	UPDATE InternaPrimkaStavke
	SET InternaPrimkaStavke.Stanje = InternaPrimkaStavke.Stanje + (SELECT SUM(VezaInventurniManjakPrimka.Kolicina) FROM VezaInventurniManjakPrimka INNER JOIN deleted ON VezaInventurniManjakPrimka.IDInventurniManjakStavke = deleted.ID WHERE VezaInventurniManjakPrimka.IDInternaPrimkaStavke = InternaPrimkaStavke.ID)
	FROM InternaPrimkaStavke, deleted, VezaInventurniManjakPrimka
  WHERE (deleted.ID = VezaInventurniManjakPrimka.IDInventurniManjakStavke) AND (InternaPrimkaStavke.ID = VezaInventurniManjakPrimka.IDInternaPrimkaStavke)
	
	DELETE VezaInventurniManjakPrimka
	FROM VezaInventurniManjakPrimka INNER JOIN
	   deleted ON VezaInventurniManjakPrimka.IDInventurniManjakStavke = deleted.ID
END

UPDATE InventurniManjak
SET InventurniManjak.Vrijednost = InventurniManjak.Vrijednost - (SELECT SUM(Vrijednost) FROM deleted WHERE IDDokumenta = InventurniManjak.ID),
    InventurniManjak.RUC = InventurniManjak.RUC - (SELECT SUM(RUC) FROM deleted WHERE IDDokumenta = InventurniManjak.ID),
    InventurniManjak.Porez = InventurniManjak.Porez - (SELECT SUM(Porez) FROM deleted WHERE IDDokumenta = InventurniManjak.ID),
    InventurniManjak.ProdajnaVrijednost = InventurniManjak.ProdajnaVrijednost - (SELECT SUM(ProdajnaVrijednost) FROM deleted WHERE IDDokumenta = InventurniManjak.ID)
FROM InventurniManjak, deleted
WHERE (InventurniManjak.ID = deleted.IDDokumenta)

SET TRANSACTION ISOLATION LEVEL READ COMMITTED

GO
EXEC sp_settriggerorder N'[dbo].[IMVracanjeStanja]', 'first', 'update', null
GO
ALTER TABLE [dbo].[InventurniManjakStavke] ADD CONSTRAINT [aaaaaInventurniManjakStavke_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDDokumenta] ON [dbo].[InventurniManjakStavke] ([IDDokumenta]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [InventurniManjakInventurniManjakStavke] ON [dbo].[InventurniManjakStavke] ([IDDokumenta]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ArtikliInventurniManjakStavke] ON [dbo].[InventurniManjakStavke] ([SifraArtikla]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InventurniManjakStavke] ADD CONSTRAINT [InventurniManjakStavke_FK01] FOREIGN KEY ([IDDokumenta]) REFERENCES [dbo].[InventurniManjak] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InventurniManjakStavke] WITH NOCHECK ADD CONSTRAINT [InventurniManjakStavke_FK00] FOREIGN KEY ([SifraArtikla]) REFERENCES [dbo].[Artikli] ([Sifra]) ON UPDATE CASCADE
GO
