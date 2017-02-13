CREATE TABLE [dbo].[KnjigaURAIno]
(
[Broj] [nvarchar] (30) COLLATE Croatian_CI_AS NULL,
[Datum] [datetime] NULL,
[Partner] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Valuta] [nvarchar] (4) COLLATE Croatian_CI_AS NULL,
[IznosStr] [float] NULL CONSTRAINT [DF__KnjigaURA__Iznos__31EC6D26] DEFAULT ((0)),
[UkupniIznosRacuna] [float] NULL CONSTRAINT [DF__KnjigaURA__Ukupn__32E0915F] DEFAULT ((0)),
[Dospjece] [datetime] NULL,
[Napomena] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[DatumKnjizeno] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[TecajStr] [smallint] NULL CONSTRAINT [DF__KnjigaURA__Tecaj__33D4B598] DEFAULT ((0)),
[TecajDom] [float] NULL CONSTRAINT [DF__KnjigaURA__Tecaj__34C8D9D1] DEFAULT ((0)),
[IDDokumenta] [int] NULL,
[Knjizeno] [int] NULL,
[IDPredloska] [int] NULL,
[Slobodno] [float] NULL CONSTRAINT [DF__KnjigaURA__Slobo__35BCFE0A] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KnjigaURAIno] ADD CONSTRAINT [aaaaaKnjigaURAIno_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PrimkaKnjigaURAIno] ON [dbo].[KnjigaURAIno] ([IDDokumenta]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GlavnaKnjigaPredlosciKnjigaURAIno] ON [dbo].[KnjigaURAIno] ([IDPredloska]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDPredloska] ON [dbo].[KnjigaURAIno] ([IDPredloska]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ValuteKnjigaURAIno] ON [dbo].[KnjigaURAIno] ([Valuta]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KnjigaURAIno] ADD CONSTRAINT [KnjigaURAIno_FK01] FOREIGN KEY ([IDDokumenta]) REFERENCES [dbo].[Primka] ([ID])
GO
ALTER TABLE [dbo].[KnjigaURAIno] ADD CONSTRAINT [KnjigaURAIno_FK00] FOREIGN KEY ([IDPredloska]) REFERENCES [dbo].[GlavnaKnjigaPredlosci] ([ID])
GO
ALTER TABLE [dbo].[KnjigaURAIno] WITH NOCHECK ADD CONSTRAINT [FK_KnjigaURAIno_Partneri] FOREIGN KEY ([Partner]) REFERENCES [dbo].[Partneri] ([SkraceniNaziv]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KnjigaURAIno] ADD CONSTRAINT [KnjigaURAIno_FK02] FOREIGN KEY ([Valuta]) REFERENCES [dbo].[Valute] ([Skracenica]) ON UPDATE CASCADE
GO
