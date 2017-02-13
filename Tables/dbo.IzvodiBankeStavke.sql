CREATE TABLE [dbo].[IzvodiBankeStavke]
(
[Partner] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[SvrhaDoznake] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[Duguje] [float] NULL CONSTRAINT [DF__IzvodiBan__Duguj__52AE4273] DEFAULT ((0)),
[Potrazuje] [float] NULL CONSTRAINT [DF__IzvodiBan__Potra__53A266AC] DEFAULT ((0)),
[PozivNaBrojZaduzenja] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[PozivNaBrojOdobrenja] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[Reklamacija] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[Slobodno] [float] NULL CONSTRAINT [DF__IzvodiBan__Slobo__54968AE5] DEFAULT ((0)),
[IDPredloska] [int] NULL,
[IDDokumenta] [int] NULL CONSTRAINT [DF__IzvodiBan__IDDok__558AAF1E] DEFAULT ((0)),
[KPI] [int] NULL,
[upsize_ts] [timestamp] NULL,
[BrojRacuna] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[DatumIzvoda] [datetime] NULL,
[IDPartnera] [int] NULL,
[BrojNaloga] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Predlozak] [nvarchar] (100) COLLATE Croatian_CI_AS NULL
) ON [PRIMARY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[IZVSkidanjeStanja] ON [dbo].[IzvodiBankeStavke] 
AFTER INSERT, UPDATE
AS
--Trigger se aktivira cak i ako nijedan zapis nije promijenjen
--U tom slucaju funkcija @@ROWCOUNT ce vratiti 0
IF @@ROWCOUNT = 0
  RETURN

--Treba izvrsiti samo ako su mijenjana polja Duguje ili Potrazuje.
--Uporaba funkcije SUBSTRING je neophodna jer COLUMNS_UPDATED() vraca bajtove
--slijeva nadesno, ali bitove unutar bajta zdesna nalijevo
IF (SUBSTRING(COLUMNS_UPDATED(), 1, 1) & 12) > 0
BEGIN
  SET NOCOUNT ON
  
  UPDATE IzvodiBanke
  SET IzvodiBanke.Duguje = ISNULL(IzvodiBanke.Duguje, 0) + ISNULL((SELECT SUM(Duguje) FROM inserted WHERE IDDokumenta = IzvodiBanke.ID), 0),
      IzvodiBanke.Potrazuje = ISNULL(IzvodiBanke.Potrazuje, 0) + ISNULL((SELECT SUM(Potrazuje) FROM inserted WHERE IDDokumenta = IzvodiBanke.ID), 0)
  FROM IzvodiBanke, inserted
  WHERE (IzvodiBanke.ID = inserted.IDDokumenta)
END
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE TRIGGER [dbo].[IZVVracanjeStanja] ON [dbo].[IzvodiBankeStavke] 
AFTER DELETE, UPDATE
AS
--Trigger se aktivira cak i ako nijedan zapis nije promijenjen
--U tom slucaju funkcija @@ROWCOUNT ce vratiti 0
IF @@ROWCOUNT = 0
  RETURN

--Treba izvrsiti samo ako su mijenjana polja Duguje ili Potrazuje.
--Uporaba funkcije SUBSTRING je neophodna jer COLUMNS_UPDATED() vraca bajtove
--slijeva nadesno, ali bitove unutar bajta zdesna nalijevo
IF ((SUBSTRING(COLUMNS_UPDATED(), 1, 1) & 12) > 0) OR (NOT EXISTS(SELECT 0 FROM inserted))
BEGIN
  SET NOCOUNT ON
  
  UPDATE IzvodiBanke
  SET IzvodiBanke.Duguje = IzvodiBanke.Duguje - ISNULL((SELECT SUM(Duguje) FROM deleted WHERE IDDokumenta = IzvodiBanke.ID), 0),
      IzvodiBanke.Potrazuje = IzvodiBanke.Potrazuje - ISNULL((SELECT SUM(Potrazuje) FROM deleted WHERE IDDokumenta = IzvodiBanke.ID), 0)
  FROM IzvodiBanke, deleted
  WHERE (IzvodiBanke.ID = deleted.IDDokumenta)
END
GO
ALTER TABLE [dbo].[IzvodiBankeStavke] ADD CONSTRAINT [aaaaaIzvodiBankeStavke_PK] PRIMARY KEY NONCLUSTERED  ([ID]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDDokumenta] ON [dbo].[IzvodiBankeStavke] ([IDDokumenta]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IzvodiBankeIzvodiBankeStavke] ON [dbo].[IzvodiBankeStavke] ([IDDokumenta]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GlavnaKnjigaPredlosciIzvodiBankeStavke] ON [dbo].[IzvodiBankeStavke] ([IDPredloska]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriIzvodiBankeStavke] ON [dbo].[IzvodiBankeStavke] ([Partner]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[IzvodiBankeStavke] ADD CONSTRAINT [FK_IzvodiBankeStavke_IzvodiBanke] FOREIGN KEY ([IDDokumenta]) REFERENCES [dbo].[IzvodiBanke] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[IzvodiBankeStavke] ADD CONSTRAINT [FK_IzvodiBankeStavke_GlavnaKnjigaPredlosci] FOREIGN KEY ([IDPredloska]) REFERENCES [dbo].[GlavnaKnjigaPredlosci] ([ID])
GO
