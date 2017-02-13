CREATE TABLE [dbo].[KnjiznaObavijestUlaz]
(
[Broj] [int] NULL CONSTRAINT [DF__KnjiznaOba__Broj__25869641] DEFAULT ((0)),
[Datum] [datetime] NULL,
[Partner] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Opis] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[Dospjece] [datetime] NULL,
[Osnovica] [float] NULL,
[Neoporezivo] [float] NULL,
[UkupniIznosRacuna] [float] NULL CONSTRAINT [DF__KnjiznaOb__Ukupn__267ABA7A] DEFAULT ((0)),
[PretporezUkupno] [float] NULL,
[PretporezMozeSeOdbiti] [float] NULL,
[PretporezNeMozeSeOdbiti] [float] NULL,
[Napomena] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[DatumZakljuceno] [datetime] NULL,
[DatumURAIRA] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[TekstIza] [ntext] COLLATE Croatian_CI_AS NULL,
[ModelPlacanja] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[StopaPoreza] [real] NULL CONSTRAINT [DF__KnjiznaOb__Stopa__276EDEB3] DEFAULT ((0)),
[Slobodno] [float] NULL CONSTRAINT [DF__KnjiznaOb__Slobo__286302EC] DEFAULT ((0)),
[Zakljuceno] [int] NULL,
[IDRacuna] [int] NULL,
[URAIRA] [int] NULL,
[IDPJ] [int] NULL CONSTRAINT [DF__KnjiznaOba__IDPJ__29572725] DEFAULT ((0)),
[IDPoslovnice] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[KnjiznaObavijestUlaz] ADD CONSTRAINT [aaaaaKnjiznaObavijestUlaz_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriPoslovniceKnjiznaObavijestUlaz] ON [dbo].[KnjiznaObavijestUlaz] ([IDPoslovnice]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KnjigaURAKnjiznaObavijestUlaz] ON [dbo].[KnjiznaObavijestUlaz] ([IDRacuna]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KnjiznaObavijestUlaz] ADD CONSTRAINT [FK_KnjiznaObavijestUlaz_PartneriPoslovnice] FOREIGN KEY ([IDPJ]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
ALTER TABLE [dbo].[KnjiznaObavijestUlaz] ADD CONSTRAINT [KnjiznaObavijestUlaz_FK01] FOREIGN KEY ([IDPoslovnice]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
ALTER TABLE [dbo].[KnjiznaObavijestUlaz] ADD CONSTRAINT [KnjiznaObavijestUlaz_FK00] FOREIGN KEY ([IDRacuna]) REFERENCES [dbo].[KnjigaURA] ([ID])
GO
ALTER TABLE [dbo].[KnjiznaObavijestUlaz] ADD CONSTRAINT [FK_KnjiznaObavijestUlaz_Opis] FOREIGN KEY ([Opis]) REFERENCES [dbo].[Opis] ([Naziv]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KnjiznaObavijestUlaz] WITH NOCHECK ADD CONSTRAINT [FK_KnjiznaObavijestUlaz_Partneri] FOREIGN KEY ([Partner]) REFERENCES [dbo].[Partneri] ([SkraceniNaziv]) ON UPDATE CASCADE
GO
