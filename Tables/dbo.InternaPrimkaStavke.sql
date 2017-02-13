CREATE TABLE [dbo].[InternaPrimkaStavke]
(
[SifraArtikla] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[NazivArtikla] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Kolicina] [float] NULL CONSTRAINT [DF__InternaPr__Kolic__119F9925] DEFAULT ((0)),
[Cijena] [float] NULL CONSTRAINT [DF__InternaPr__Cijen__1293BD5E] DEFAULT ((0)),
[Vrijednost] [float] NULL CONSTRAINT [DF__InternaPr__Vrije__1387E197] DEFAULT ((0)),
[NabavnaVrijednost] [float] NULL CONSTRAINT [DF__InternaPr__Nabav__147C05D0] DEFAULT ((0)),
[RUC] [float] NULL CONSTRAINT [DF__InternaPrim__RUC__15702A09] DEFAULT ((0)),
[Porez] [float] NULL CONSTRAINT [DF__InternaPr__Porez__16644E42] DEFAULT ((0)),
[ProdajnaCijena] [float] NULL CONSTRAINT [DF__InternaPr__Proda__1758727B] DEFAULT ((0)),
[ProdajnaVrijednost] [float] NULL CONSTRAINT [DF__InternaPr__Proda__184C96B4] DEFAULT ((0)),
[PorezUlaz] [float] NULL CONSTRAINT [DF__InternaPr__Porez__1940BAED] DEFAULT ((0)),
[Troskovi] [float] NULL CONSTRAINT [DF__InternaPr__Trosk__1A34DF26] DEFAULT ((0)),
[Stanje] [float] NULL CONSTRAINT [DF__InternaPr__Stanj__1B29035F] DEFAULT ((0)),
[IDDokumenta] [int] NULL CONSTRAINT [DF__InternaPr__IDDok__1C1D2798] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDGlavneStavke] [int] NULL,
[FiktivnaStavka] [bit] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InternaPrimkaStavke] ADD CONSTRAINT [aaaaaInternaPrimkaStavke_PK] PRIMARY KEY NONCLUSTERED  ([ID]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDDokumenta] ON [dbo].[InternaPrimkaStavke] ([IDDokumenta]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [InternaPrimkaInternaPrimkaStavke] ON [dbo].[InternaPrimkaStavke] ([IDDokumenta]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ArtikliInternaPrimkaStavke] ON [dbo].[InternaPrimkaStavke] ([SifraArtikla]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InternaPrimkaStavke] WITH NOCHECK ADD CONSTRAINT [InternaPrimkaStavke_FK01] FOREIGN KEY ([IDDokumenta]) REFERENCES [dbo].[InternaPrimka] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InternaPrimkaStavke] WITH NOCHECK ADD CONSTRAINT [InternaPrimkaStavke_FK00] FOREIGN KEY ([SifraArtikla]) REFERENCES [dbo].[Artikli] ([Sifra]) ON UPDATE CASCADE
GO
