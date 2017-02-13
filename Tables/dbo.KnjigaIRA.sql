CREATE TABLE [dbo].[KnjigaIRA]
(
[RedBroj] [int] NULL CONSTRAINT [DF__KnjigaIRA__RedBr__571DF1D5] DEFAULT ((0)),
[UkljuciUObrazac] [bit] NOT NULL CONSTRAINT [DF__KnjigaIRA__Uklju__5812160E] DEFAULT ((0)),
[Broj] [nvarchar] (30) COLLATE Croatian_CI_AS NULL,
[Datum] [datetime] NULL,
[Partner] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[UkupniIznosRacuna] [float] NULL CONSTRAINT [DF__KnjigaIRA__Ukupn__59063A47] DEFAULT ((0)),
[Neoporezivo] [float] NULL,
[OslobodjenoPrijenos] [float] NULL,
[OslobodjenoClanice] [float] NULL,
[OslobodjenoDobraEU] [float] NULL,
[OslobodjenoUslugeEU] [float] NULL,
[OslobodjenoIzvanRH] [float] NULL,
[OslobodjenoSastavljanje] [float] NULL,
[OslobodjenoPrijevoz] [float] NULL,
[OslobodjenoTuzemstvo] [float] NULL,
[OslobodjenoIzvoz] [float] NULL,
[OslobodjenoOstalo] [float] NULL,
[NultaStopa] [float] NULL,
[ObvezniciOsnovica] [float] NULL,
[ObvezniciPorez] [float] NULL,
[ObvezniciOsnovica10] [float] NULL,
[ObvezniciPorez10] [float] NULL,
[ObvezniciOsnovica5] [float] NULL,
[ObvezniciPorez5] [float] NULL,
[VlastitaPotrosnjaOsnovica] [float] NULL,
[VlastitaPotrosnjaPorez] [float] NULL,
[Dospjece] [datetime] NULL,
[Napomena] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[DatumKnjizeno] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[ModelPlacanja] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[UvrstenUPDV] [datetime] NULL,
[StopaPoreza] [real] NULL CONSTRAINT [DF__KnjigaIRA__Stopa__59FA5E80] DEFAULT ((0)),
[Vrsta] [smallint] NULL CONSTRAINT [DF__KnjigaIRA__Vrsta__5AEE82B9] DEFAULT ((0)),
[Auto] [bit] NOT NULL CONSTRAINT [DF__KnjigaIRA__Auto__5BE2A6F2] DEFAULT ((0)),
[Knjizeno] [int] NULL,
[VrstaDokumenta] [smallint] NULL,
[IDDokumenta] [int] NULL,
[IDPredloska] [int] NULL,
[NabavnaVrijednost] [float] NULL CONSTRAINT [DF__KnjigaIRA__Nabav__5CD6CB2B] DEFAULT ((0)),
[OsnovicaUsluge] [float] NULL CONSTRAINT [DF__KnjigaIRA__Osnov__5DCAEF64] DEFAULT ((0)),
[NeoporezivoUsluge] [float] NULL CONSTRAINT [DF__KnjigaIRA__Neopo__5EBF139D] DEFAULT ((0)),
[ApsolutniIznos] [float] NULL CONSTRAINT [DF__KnjigaIRA__Apsol__5FB337D6] DEFAULT ((0)),
[IDKnjigaURA] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KnjigaIRA] ADD CONSTRAINT [aaaaaKnjigaIRA_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GlavnaKnjigaDokumentiKnjigaIRA] ON [dbo].[KnjigaIRA] ([IDPredloska]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriKnjigaIRA] ON [dbo].[KnjigaIRA] ([Partner]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KnjigaIRA] ADD CONSTRAINT [KnjigaIRA_FK00] FOREIGN KEY ([IDPredloska]) REFERENCES [dbo].[GlavnaKnjigaPredlosci] ([ID])
GO
ALTER TABLE [dbo].[KnjigaIRA] ADD CONSTRAINT [KnjigaIRA_FK01] FOREIGN KEY ([Partner]) REFERENCES [dbo].[Partneri] ([SkraceniNaziv]) ON UPDATE CASCADE
GO
