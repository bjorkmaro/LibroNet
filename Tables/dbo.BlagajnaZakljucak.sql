CREATE TABLE [dbo].[BlagajnaZakljucak]
(
[Blagajna] [smallint] NULL,
[Broj] [int] NULL CONSTRAINT [DF__BlagajnaZa__Broj__1B5E0D89] DEFAULT ((0)),
[DatumOd] [datetime] NULL,
[Datum] [datetime] NULL,
[PrethodniSaldo] [float] NULL CONSTRAINT [DF__BlagajnaZ__Preth__1C5231C2] DEFAULT ((0)),
[Primici] [float] NULL CONSTRAINT [DF__BlagajnaZ__Primi__1D4655FB] DEFAULT ((0)),
[Izdaci] [float] NULL CONSTRAINT [DF__BlagajnaZ__Izdac__1E3A7A34] DEFAULT ((0)),
[NoviSaldo] [float] NULL CONSTRAINT [DF__BlagajnaZ__NoviS__1F2E9E6D] DEFAULT ((0)),
[BrojPriloga] [smallint] NULL CONSTRAINT [DF__BlagajnaZ__BrojP__2022C2A6] DEFAULT ((0)),
[Napomene] [ntext] COLLATE Croatian_CI_AS NULL,
[DatumKnjizeno] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[Blagajnik] [int] NULL,
[Knjizeno] [int] NULL,
[IDPredloska] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[BlagajnaZakljucak] ADD CONSTRAINT [aaaaaBlagajnaZakljucak_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BlagajneBlagajnaZakljucak] ON [dbo].[BlagajnaZakljucak] ([Blagajna]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DjelatniciBlagajnaZakljucak] ON [dbo].[BlagajnaZakljucak] ([Blagajnik]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Broj] ON [dbo].[BlagajnaZakljucak] ([Broj]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GlavnaKnjigaPredlosciBlagajnaZakljucak] ON [dbo].[BlagajnaZakljucak] ([IDPredloska]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BlagajnaZakljucak] ADD CONSTRAINT [BlagajnaZakljucak_FK00] FOREIGN KEY ([Blagajna]) REFERENCES [dbo].[Blagajne] ([Broj]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BlagajnaZakljucak] ADD CONSTRAINT [FK_BlagajnaZakljucak_Korisnici] FOREIGN KEY ([Blagajnik]) REFERENCES [dbo].[Korisnici] ([ID])
GO
ALTER TABLE [dbo].[BlagajnaZakljucak] ADD CONSTRAINT [BlagajnaZakljucak_FK02] FOREIGN KEY ([IDPredloska]) REFERENCES [dbo].[GlavnaKnjigaPredlosci] ([ID])
GO
