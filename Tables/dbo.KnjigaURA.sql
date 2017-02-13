CREATE TABLE [dbo].[KnjigaURA]
(
[RedBroj] [int] NULL CONSTRAINT [DF__KnjigaURA__RedBr__76CBA758] DEFAULT ((0)),
[UkljuciUObrazac] [bit] NOT NULL CONSTRAINT [DF__KnjigaURA__Uklju__77BFCB91] DEFAULT ((0)),
[Broj] [nvarchar] (30) COLLATE Croatian_CI_AS NULL,
[Datum] [datetime] NULL,
[Partner] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Osnovica] [float] NULL,
[Osnovica10] [float] NULL,
[Osnovica5] [float] NULL,
[Neoporezivo] [float] NULL,
[UkupniIznosRacuna] [float] NULL CONSTRAINT [DF__KnjigaURA__Ukupn__78B3EFCA] DEFAULT ((0)),
[PretporezUkupno] [float] NULL,
[PretporezMozeSeOdbiti] [float] NULL,
[PretporezNeMozeSeOdbiti] [float] NULL,
[PretporezMozeSeOdbiti10] [float] NULL,
[PretporezNeMozeSeOdbiti10] [float] NULL,
[PretporezMozeSeOdbiti5] [float] NULL,
[PretporezNeMozeSeOdbiti5] [float] NULL,
[Dospjece] [datetime] NULL,
[Napomena] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[DatumKnjizeno] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[ModelPlacanja] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[UvrstenUPDV] [datetime] NULL,
[StopaPoreza] [real] NULL CONSTRAINT [DF__KnjigaURA__Stopa__79A81403] DEFAULT ((0)),
[Vrsta] [smallint] NULL CONSTRAINT [DF__KnjigaURA__Vrsta__7A9C383C] DEFAULT ((0)),
[Auto] [bit] NOT NULL CONSTRAINT [DF__KnjigaURA__Auto__7B905C75] DEFAULT ((0)),
[Knjizeno] [int] NULL,
[VrstaDokumenta] [smallint] NULL,
[IDDokumenta] [int] NULL,
[VrstaRacuna] [smallint] NULL,
[IDPredloska] [int] NULL,
[ApsolutniIznos] [float] NULL CONSTRAINT [DF__KnjigaURA__Apsol__7C8480AE] DEFAULT ((0)),
[Slobodno] [float] NULL CONSTRAINT [DF__KnjigaURA__Slobo__7D78A4E7] DEFAULT ((0)),
[IDMjestaTroska] [int] NULL,
[ObracunavaPrimatelj] [bit] NOT NULL CONSTRAINT [DF_KnjigaURA_ObracunavaPrimatelj] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KnjigaURA] ADD CONSTRAINT [aaaaaKnjigaURA_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Sifra] ON [dbo].[KnjigaURA] ([Broj], [Vrsta], [Partner]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GlavnaKnjigaDokumentiKnjigaURA] ON [dbo].[KnjigaURA] ([IDPredloska]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriKnjigaURA] ON [dbo].[KnjigaURA] ([Partner]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KnjigaURA] ADD CONSTRAINT [FK_KnjigaURA_MjestaTroska] FOREIGN KEY ([IDMjestaTroska]) REFERENCES [dbo].[MjestaTroska] ([ID])
GO
ALTER TABLE [dbo].[KnjigaURA] ADD CONSTRAINT [KnjigaURA_FK00] FOREIGN KEY ([IDPredloska]) REFERENCES [dbo].[GlavnaKnjigaPredlosci] ([ID])
GO
ALTER TABLE [dbo].[KnjigaURA] ADD CONSTRAINT [KnjigaURA_FK01] FOREIGN KEY ([Partner]) REFERENCES [dbo].[Partneri] ([SkraceniNaziv]) ON UPDATE CASCADE
GO
