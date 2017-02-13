CREATE TABLE [dbo].[KnjiznaObavijestIzlaz]
(
[Broj] [int] NULL CONSTRAINT [DF__KnjiznaOba__Broj__03F0984C] DEFAULT ((0)),
[Datum] [datetime] NULL,
[Partner] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Opis] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[Dospjece] [datetime] NULL,
[UkupniIznosRacuna] [float] NULL CONSTRAINT [DF__KnjiznaOb__Ukupn__04E4BC85] DEFAULT ((0)),
[Neoporezivo] [float] NULL,
[OslobodjenoIzvoz] [float] NULL,
[OslobodjenoOstalo] [float] NULL,
[NultaStopa] [float] NULL,
[ObvezniciOsnovica] [float] NULL,
[ObvezniciPorez] [float] NULL,
[VlastitaPotrosnjaOsnovica] [float] NULL,
[VlastitaPotrosnjaPorez] [float] NULL,
[Napomena] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[DatumZakljuceno] [datetime] NULL,
[DatumURAIRA] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[TekstIza] [ntext] COLLATE Croatian_CI_AS NULL,
[ModelPlacanja] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[NabavnaVrijednost] [float] NULL CONSTRAINT [DF__KnjiznaOb__Nabav__05D8E0BE] DEFAULT ((0)),
[OsnovicaUsluge] [float] NULL CONSTRAINT [DF__KnjiznaOb__Osnov__06CD04F7] DEFAULT ((0)),
[NeoporezivoUsluge] [float] NULL CONSTRAINT [DF__KnjiznaOb__Neopo__07C12930] DEFAULT ((0)),
[StopaPoreza] [real] NULL CONSTRAINT [DF__KnjiznaOb__Stopa__08B54D69] DEFAULT ((0)),
[Slobodno] [float] NULL CONSTRAINT [DF__KnjiznaOb__Slobo__09A971A2] DEFAULT ((0)),
[Zakljuceno] [int] NULL,
[IDRacuna] [int] NULL,
[URAIRA] [int] NULL,
[IDPJ] [int] NULL CONSTRAINT [DF__KnjiznaOba__IDPJ__0A9D95DB] DEFAULT ((0)),
[IDPoslovnice] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[KnjiznaObavijestIzlaz] ADD CONSTRAINT [aaaaaKnjiznaObavijestIzlaz_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriPoslovniceKnjiznaObavijestIzlaz] ON [dbo].[KnjiznaObavijestIzlaz] ([IDPoslovnice]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KnjigaIRAKnjiznaObavijestIzlaz] ON [dbo].[KnjiznaObavijestIzlaz] ([IDRacuna]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KnjiznaObavijestIzlaz] ADD CONSTRAINT [FK_KnjiznaObavijestIzlaz_PartneriPoslovnice] FOREIGN KEY ([IDPJ]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
ALTER TABLE [dbo].[KnjiznaObavijestIzlaz] ADD CONSTRAINT [KnjiznaObavijestIzlaz_FK01] FOREIGN KEY ([IDPoslovnice]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
ALTER TABLE [dbo].[KnjiznaObavijestIzlaz] ADD CONSTRAINT [KnjiznaObavijestIzlaz_FK00] FOREIGN KEY ([IDRacuna]) REFERENCES [dbo].[KnjigaIRA] ([ID])
GO
ALTER TABLE [dbo].[KnjiznaObavijestIzlaz] ADD CONSTRAINT [FK_KnjiznaObavijestIzlaz_Opis] FOREIGN KEY ([Opis]) REFERENCES [dbo].[Opis] ([Naziv]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KnjiznaObavijestIzlaz] WITH NOCHECK ADD CONSTRAINT [FK_KnjiznaObavijestIzlaz_Partneri] FOREIGN KEY ([Partner]) REFERENCES [dbo].[Partneri] ([SkraceniNaziv]) ON UPDATE CASCADE
GO
