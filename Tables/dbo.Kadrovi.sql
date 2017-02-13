CREATE TABLE [dbo].[Kadrovi]
(
[Datum] [datetime] NULL,
[MBTekuci] [int] NULL CONSTRAINT [DF__Kadrovi__MBTekuc__7073AF84] DEFAULT ((0)),
[MBKasniji] [int] NULL CONSTRAINT [DF__Kadrovi__MBKasni__7167D3BD] DEFAULT ((0)),
[MBRaniji] [int] NULL CONSTRAINT [DF__Kadrovi__MBRanij__725BF7F6] DEFAULT ((0)),
[JMBG] [nvarchar] (13) COLLATE Croatian_CI_AS NULL,
[Titula] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[Ime] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Prezime] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Sufiks] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[ImeOca] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[PrezimePrije] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[BracnoStanje] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Spol] [smallint] NULL CONSTRAINT [DF__Kadrovi__Spol__73501C2F] DEFAULT ((0)),
[RodjenjeDatum] [int] NULL CONSTRAINT [DF__Kadrovi__Rodjenj__74444068] DEFAULT ((0)),
[RodjenjeMjesto] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[RodjenjeGrad] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[RodjenjeDrzava] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[BrojOsobne] [nvarchar] (30) COLLATE Croatian_CI_AS NULL,
[OsobniBrojOsiguranika] [nvarchar] (30) COLLATE Croatian_CI_AS NULL,
[Ulica] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Grad] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[ZIP] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[Drzava] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[RadUlica] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[RadGrad] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[RadZIP] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[RadDrzava] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Clan9] [bit] NOT NULL CONSTRAINT [DF__Kadrovi__Clan9__753864A1] DEFAULT ((0)),
[Zanimanje] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Kvalifikacija] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[ZavrsenaSkola] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[RadnoVrijemePuno] [real] NULL CONSTRAINT [DF__Kadrovi__RadnoVr__762C88DA] DEFAULT ((0)),
[RadnoVrijemeKrace] [real] NULL CONSTRAINT [DF__Kadrovi__RadnoVr__7720AD13] DEFAULT ((0)),
[RadnoVrijemeOstalo] [real] NULL CONSTRAINT [DF__Kadrovi__RadnoVr__7814D14C] DEFAULT ((0)),
[Status] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[RadniOdnos] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[RKSerBroj] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[RKRegBroj] [int] NULL CONSTRAINT [DF__Kadrovi__RKRegBr__7908F585] DEFAULT ((0)),
[RKGrad] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[PrethodniStazGod] [smallint] NULL CONSTRAINT [DF__Kadrovi__Prethod__79FD19BE] DEFAULT ((0)),
[PrethodniStazMjes] [smallint] NULL CONSTRAINT [DF__Kadrovi__Prethod__7AF13DF7] DEFAULT ((0)),
[PrethodniStazDani] [smallint] NULL CONSTRAINT [DF__Kadrovi__Prethod__7BE56230] DEFAULT ((0)),
[BrojUgovora] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[DatumUgovora] [datetime] NULL,
[DatumPrestanka] [datetime] NULL,
[RazlogPrestanka] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[StazGod] [smallint] NULL CONSTRAINT [DF__Kadrovi__StazGod__7CD98669] DEFAULT ((0)),
[StazMjes] [smallint] NULL CONSTRAINT [DF__Kadrovi__StazMje__7DCDAAA2] DEFAULT ((0)),
[StazDani] [smallint] NULL CONSTRAINT [DF__Kadrovi__StazDan__7EC1CEDB] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDDjelatnika] [int] NULL,
[Drzavljanstvo] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[RadnaDozvola] [datetime] NULL,
[RadnoVrijemeTjednoPuno] [real] NULL CONSTRAINT [DF_Kadrovi_RadnoVrijemeTjednoPuno] DEFAULT ((0)),
[RadnoVrijemeTjednoKrace] [real] NULL CONSTRAINT [DF_Kadrovi_RadnoVrijemeTjednoKrace] DEFAULT ((0)),
[RadnoVrijemeTjednoOstalo] [real] NULL CONSTRAINT [DF_Kadrovi_RadnoVrijemeTjednoOstalo] DEFAULT ((0)),
[ProduzenoMirovinskoMjesec] [smallint] NULL,
[ProduzenoMirovinskoUvjet] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[RadnaSposobnost] [bit] NOT NULL CONSTRAINT [DF_Kadrovi_RadnaSposobnost_1] DEFAULT ((0)),
[DatumPocetkaRada] [datetime] NULL,
[MirovanjeGod] [smallint] NULL,
[MirovanjeMjes] [smallint] NULL,
[OdredjenoGod] [smallint] NULL CONSTRAINT [DF_Kadrovi_OdredjenoGod] DEFAULT ((0)),
[OdredjenoMjes] [smallint] NULL CONSTRAINT [DF_Kadrovi_OdredjenoMjes] DEFAULT ((0)),
[OdredjenoDani] [smallint] NULL CONSTRAINT [DF_Kadrovi_OdredjenoDani] DEFAULT ((0)),
[ProbniRadGod] [smallint] NULL CONSTRAINT [DF_Kadrovi_ProbniRadGod] DEFAULT ((0)),
[ProbniRadMjes] [smallint] NULL CONSTRAINT [DF_Kadrovi_ProbniRadMjes] DEFAULT ((0)),
[ProbniRadDani] [smallint] NULL CONSTRAINT [DF_Kadrovi_ProbniRadDani] DEFAULT ((0)),
[ZabranaGod] [smallint] NULL CONSTRAINT [DF_Kadrovi_ZabranaGod] DEFAULT ((0)),
[ZabranaMjes] [smallint] NULL CONSTRAINT [DF_Kadrovi_ZabranaMjes] DEFAULT ((0)),
[ZabranaDani] [smallint] NULL CONSTRAINT [DF_Kadrovi_ZabranaDani] DEFAULT ((0)),
[PripravnikGod] [smallint] NULL CONSTRAINT [DF_Kadrovi_PripravnikGod] DEFAULT ((0)),
[PripravnikMjes] [smallint] NULL CONSTRAINT [DF_Kadrovi_PripravnikMjes] DEFAULT ((0)),
[PripravnikDani] [smallint] NULL CONSTRAINT [DF_Kadrovi_PripravnikDani] DEFAULT ((0)),
[StrucniIspitNaziv] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[StrucniIspitDatum] [datetime] NULL,
[InozemstvoGod] [smallint] NULL CONSTRAINT [DF_Kadrovi_InozemstvoGod] DEFAULT ((0)),
[InozemstvoMjes] [smallint] NULL CONSTRAINT [DF_Kadrovi_InozemstvoMjes] DEFAULT ((0)),
[InozemstvoDani] [smallint] NULL CONSTRAINT [DF_Kadrovi_InozemstvoDani] DEFAULT ((0)),
[InozemstvoMjesto] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[InozemstvoDrzava] [nvarchar] (50) COLLATE Croatian_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kadrovi] ADD CONSTRAINT [aaaaaKadrovi_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BracnaStanjaKadrovi] ON [dbo].[Kadrovi] ([BracnoStanje]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DrzaveKadrovi1] ON [dbo].[Kadrovi] ([Drzava]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GradoviKadrovi1] ON [dbo].[Kadrovi] ([Grad]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DjelatniciKadrovi] ON [dbo].[Kadrovi] ([IDDjelatnika]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KvalifikacijeKadrovi] ON [dbo].[Kadrovi] ([Kvalifikacija]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [MBTekuci] ON [dbo].[Kadrovi] ([MBTekuci]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DrzaveKadrovi2] ON [dbo].[Kadrovi] ([RadDrzava]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GradoviKadrovi2] ON [dbo].[Kadrovi] ([RadGrad]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RadniOdnosKadrovi] ON [dbo].[Kadrovi] ([RadniOdnos]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GradoviKadrovi3] ON [dbo].[Kadrovi] ([RKGrad]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [DrzaveKadrovi] ON [dbo].[Kadrovi] ([RodjenjeDrzava]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GradoviKadrovi] ON [dbo].[Kadrovi] ([RodjenjeGrad]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kadrovi] ADD CONSTRAINT [FK_Kadrovi_BracnaStanja] FOREIGN KEY ([BracnoStanje]) REFERENCES [dbo].[BracnaStanja] ([Naziv]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Kadrovi] WITH NOCHECK ADD CONSTRAINT [FK_Kadrovi_Djelatnici] FOREIGN KEY ([IDDjelatnika]) REFERENCES [dbo].[Djelatnici] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Kadrovi] ADD CONSTRAINT [FK_Kadrovi_Kvalifikacije] FOREIGN KEY ([Kvalifikacija]) REFERENCES [dbo].[Kvalifikacije] ([Skracenica]) ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Kadrovi] ADD CONSTRAINT [FK_Kadrovi_RadniOdnos] FOREIGN KEY ([RadniOdnos]) REFERENCES [dbo].[RadniOdnos] ([Naziv]) ON UPDATE CASCADE
GO
