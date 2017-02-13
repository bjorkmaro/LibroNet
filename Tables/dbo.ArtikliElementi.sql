CREATE TABLE [dbo].[ArtikliElementi]
(
[SifraArtikla] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[NazivArtikla] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Kolicina] [float] NULL CONSTRAINT [DF__ArtikliEl__Kolic__3EA749C6] DEFAULT ((0)),
[Grupa] [tinyint] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDSlozenogArtikla] [int] NULL CONSTRAINT [DF__ArtikliEl__IDSlo__3F9B6DFF] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArtikliElementi] ADD CONSTRAINT [aaaaaArtikliElementi_PK] PRIMARY KEY NONCLUSTERED  ([ID]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Artikl] ON [dbo].[ArtikliElementi] ([SifraArtikla], [IDSlozenogArtikla]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArtikliElementi] WITH NOCHECK ADD CONSTRAINT [FK_ArtikliElementi_Artikli] FOREIGN KEY ([IDSlozenogArtikla]) REFERENCES [dbo].[Artikli] ([ID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArtikliElementi] WITH NOCHECK ADD CONSTRAINT [FK_ArtikliElementi_Artikli1] FOREIGN KEY ([SifraArtikla]) REFERENCES [dbo].[Artikli] ([Sifra]) ON UPDATE CASCADE
GO
