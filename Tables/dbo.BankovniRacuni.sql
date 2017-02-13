CREATE TABLE [dbo].[BankovniRacuni]
(
[Broj] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Banka] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Valuta] [nvarchar] (4) COLLATE Croatian_CI_AS NULL,
[Konto] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDPartnera] [int] NULL CONSTRAINT [DF__BankovniR__IDPar__30592A6F] DEFAULT ((0)),
[IDDokumentaGlavneKnjige] [int] NULL,
[upsize_ts] [timestamp] NULL,
[BrojDok] [int] NULL CONSTRAINT [DF_BankovniRacuni_BrojDok] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BankovniRacuni] ADD CONSTRAINT [aaaaaBankovniRacuni_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BankeBankovniRacuni] ON [dbo].[BankovniRacuni] ([Banka]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Broj] ON [dbo].[BankovniRacuni] ([Broj]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GlavnaKnjigaDokumentiBankovniRacuni] ON [dbo].[BankovniRacuni] ([IDDokumentaGlavneKnjige]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriBankovniRacuni] ON [dbo].[BankovniRacuni] ([IDPartnera]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KontniPlanBankovniRacuni] ON [dbo].[BankovniRacuni] ([Konto]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ValuteBankovniRacuni] ON [dbo].[BankovniRacuni] ([Valuta]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BankovniRacuni] WITH NOCHECK ADD CONSTRAINT [BankovniRacuni_FK00] FOREIGN KEY ([Banka]) REFERENCES [dbo].[Banke] ([Naziv]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BankovniRacuni] ADD CONSTRAINT [BankovniRacuni_FK01] FOREIGN KEY ([IDDokumentaGlavneKnjige]) REFERENCES [dbo].[GlavnaKnjigaDokumenti] ([ID]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BankovniRacuni] WITH NOCHECK ADD CONSTRAINT [BankovniRacuni_FK03] FOREIGN KEY ([IDPartnera]) REFERENCES [dbo].[Partneri] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BankovniRacuni] ADD CONSTRAINT [BankovniRacuni_FK02] FOREIGN KEY ([Konto]) REFERENCES [dbo].[KontniPlan] ([Broj]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BankovniRacuni] ADD CONSTRAINT [BankovniRacuni_FK04] FOREIGN KEY ([Valuta]) REFERENCES [dbo].[Valute] ([Skracenica]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BankovniRacuni] NOCHECK CONSTRAINT [BankovniRacuni_FK00]
GO
ALTER TABLE [dbo].[BankovniRacuni] NOCHECK CONSTRAINT [BankovniRacuni_FK03]
GO
