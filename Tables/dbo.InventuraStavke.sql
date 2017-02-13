CREATE TABLE [dbo].[InventuraStavke]
(
[SifraArtikla] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[NazivArtikla] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Kolicina] [float] NULL CONSTRAINT [DF__Inventura__Kolic__7E8CC4B1] DEFAULT ((0)),
[Stanje] [float] NULL CONSTRAINT [DF__Inventura__Stanj__7F80E8EA] DEFAULT ((0)),
[Razlika] [float] NULL CONSTRAINT [DF__Inventura__Razli__00750D23] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDDokumenta] [int] NULL CONSTRAINT [DF__Inventura__IDDok__0169315C] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InventuraStavke] ADD CONSTRAINT [aaaaaInventuraStavke_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [InventuraInventuraStavke] ON [dbo].[InventuraStavke] ([IDDokumenta]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ArtikliInventuraStavke] ON [dbo].[InventuraStavke] ([SifraArtikla]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InventuraStavke] ADD CONSTRAINT [InventuraStavke_FK01] FOREIGN KEY ([IDDokumenta]) REFERENCES [dbo].[Inventura] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InventuraStavke] WITH NOCHECK ADD CONSTRAINT [InventuraStavke_FK00] FOREIGN KEY ([SifraArtikla]) REFERENCES [dbo].[Artikli] ([Sifra]) ON UPDATE CASCADE
GO
