CREATE TABLE [dbo].[Artikli]
(
[Sifra] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[Naziv] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Tip] [smallint] NULL CONSTRAINT [DF__Artikli__Tip__787EE5A0] DEFAULT ((0)),
[JedinicaMjere] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[Barkod] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[KataloskiBroj] [nvarchar] (30) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDSkupineArtikla] [int] NULL CONSTRAINT [DF__Artikli__IDSkupi__797309D9] DEFAULT ((0)),
[IDTarifePoreza] [int] NULL CONSTRAINT [DF__Artikli__IDTarif__7A672E12] DEFAULT ((0)),
[MinZalihe] [float] NULL CONSTRAINT [DF__Artikli__MinZali__7B5B524B] DEFAULT ((0)),
[MaxZalihe] [float] NULL CONSTRAINT [DF__Artikli__MaxZali__7C4F7684] DEFAULT ((0)),
[KRLKVP] [real] NULL CONSTRAINT [DF__Artikli__KRLKVP__7D439ABD] DEFAULT ((0)),
[KRLKMP] [real] NULL CONSTRAINT [DF__Artikli__KRLKMP__7E37BEF6] DEFAULT ((0)),
[Opis] [ntext] COLLATE Croatian_CI_AS NULL,
[Slozeni] [bit] NOT NULL CONSTRAINT [DF__Artikli__Slozeni__7F2BE32F] DEFAULT ((0)),
[PosebniPorez0] [bit] NULL,
[PosebniPorez1] [bit] NULL,
[PosebniPorez2] [bit] NULL,
[PosebniPorez3] [bit] NULL,
[PosebniPorez4] [bit] NULL,
[PosebniPorez5] [bit] NULL,
[PosebniPorez6] [bit] NULL,
[PosebniPorez7] [bit] NULL,
[upsize_ts] [timestamp] NULL,
[Ambalaza] [float] NOT NULL CONSTRAINT [DF_Artikli_Ambalaza] DEFAULT ((0))
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Artikli] ADD CONSTRAINT [aaaaaArtikli_PK] PRIMARY KEY NONCLUSTERED  ([ID]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ArtikliSkupineArtikli] ON [dbo].[Artikli] ([IDSkupineArtikla]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PoreziArtikli] ON [dbo].[Artikli] ([IDTarifePoreza]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[Artikli] ([Naziv], [Slozeni]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Sifra] ON [dbo].[Artikli] ([Sifra]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Artikli] WITH NOCHECK ADD CONSTRAINT [Artikli_FK00] FOREIGN KEY ([IDSkupineArtikla]) REFERENCES [dbo].[ArtikliSkupine] ([ID])
GO
ALTER TABLE [dbo].[Artikli] WITH NOCHECK ADD CONSTRAINT [Artikli_FK02] FOREIGN KEY ([IDTarifePoreza]) REFERENCES [dbo].[Porezi] ([ID]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Artikli] ADD CONSTRAINT [FK_Artikli_JedMjere] FOREIGN KEY ([JedinicaMjere]) REFERENCES [dbo].[JedMjere] ([Skracenica]) ON UPDATE CASCADE
GO
