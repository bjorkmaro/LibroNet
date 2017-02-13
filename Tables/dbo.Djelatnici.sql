CREATE TABLE [dbo].[Djelatnici]
(
[Aktivan] [bit] NOT NULL CONSTRAINT [DF__Djelatnic__Aktiv__53D770D6] DEFAULT ((0)),
[Zaposlen] [bit] NULL,
[Titula] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[Ime] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Prezime] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Sufiks] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[JMBG] [nvarchar] (13) COLLATE Croatian_CI_AS NULL,
[OIB] [nvarchar] (11) COLLATE Croatian_CI_AS NULL,
[Telefon] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[Mobitel] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[Fax] [nvarchar] (20) COLLATE Croatian_CI_AS NULL,
[Email] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Spol] [smallint] NULL CONSTRAINT [DF__Djelatnici__Spol__54CB950F] DEFAULT ((0)),
[IDPoslovneJedinice] [int] NULL,
[IDNacinaIsplatePlace] [int] NULL,
[IDBanke] [int] NULL,
[OslobodjenPoreza] [real] NULL CONSTRAINT [DF__Djelatnic__Oslob__55BFB948] DEFAULT ((0)),
[OsnovniOdbitak] [float] NULL CONSTRAINT [DF__Djelatnic__Osnov__56B3DD81] DEFAULT ((0)),
[FaktorOdbitaka] [real] NULL CONSTRAINT [DF__Djelatnic__Fakto__57A801BA] DEFAULT ((0)),
[IznosOdbitaka] [float] NULL CONSTRAINT [DF__Djelatnic__Iznos__589C25F3] DEFAULT ((0)),
[NajnizaOsnovica] [float] NULL CONSTRAINT [DF__Djelatnic__Najni__59904A2C] DEFAULT ((0)),
[UzdrzavaniClanovi] [smallint] NULL CONSTRAINT [DF__Djelatnic__Uzdrz__5A846E65] DEFAULT ((0)),
[InvalidniClanovi] [smallint] NULL CONSTRAINT [DF__Djelatnic__Inval__5B78929E] DEFAULT ((0)),
[VrstaObracuna] [smallint] NULL CONSTRAINT [DF__Djelatnic__Vrsta__5C6CB6D7] DEFAULT ((0)),
[MinuliRad] [bit] NOT NULL CONSTRAINT [DF__Djelatnic__Minul__5D60DB10] DEFAULT ((0)),
[ZadnjaPlaca] [float] NULL CONSTRAINT [DF__Djelatnic__Zadnj__5E54FF49] DEFAULT ((0)),
[BrojTekucegRacuna] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[BrojStedneKnjizice] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Napomene] [ntext] COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[Invalidnost] [smallint] NULL CONSTRAINT [DF__Djelatnic__Inval__5F492382] DEFAULT ((0)),
[BeneficiraniStaz] [smallint] NULL CONSTRAINT [DF__Djelatnic__Benef__603D47BB] DEFAULT ((0)),
[Zdravstveno] [smallint] NULL CONSTRAINT [DF__Djelatnic__Zdrav__61316BF4] DEFAULT ((0)),
[IDGrada] [int] NULL,
[IDRadnogMjesta] [int] NULL,
[RadnoVrijeme] [real] NULL CONSTRAINT [DF__Djelatnic__Radno__6225902D] DEFAULT ((0)),
[DatumUgovora] [datetime] NULL,
[PrethodniStazGod] [smallint] NULL CONSTRAINT [DF__Djelatnic__Preth__6319B466] DEFAULT ((0)),
[PrethodniStazMjes] [smallint] NULL CONSTRAINT [DF__Djelatnic__Preth__640DD89F] DEFAULT ((0)),
[PrethodniStazDani] [smallint] NULL CONSTRAINT [DF__Djelatnic__Preth__6501FCD8] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Djelatnici] ADD CONSTRAINT [aaaaaDjelatnici_PK] PRIMARY KEY NONCLUSTERED  ([ID]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BankeDjelatnici] ON [dbo].[Djelatnici] ([IDBanke]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GradoviDjelatnici] ON [dbo].[Djelatnici] ([IDGrada]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NacinIsplatePlaceDjelatnici] ON [dbo].[Djelatnici] ([IDNacinaIsplatePlace]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriPoslovniceDjelatnici] ON [dbo].[Djelatnici] ([IDPoslovneJedinice]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RadnoMjestoDjelatnici] ON [dbo].[Djelatnici] ([IDRadnogMjesta]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [JMBG] ON [dbo].[Djelatnici] ([JMBG]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Djelatnici] WITH NOCHECK ADD CONSTRAINT [Djelatnici_FK00] FOREIGN KEY ([IDBanke]) REFERENCES [dbo].[Banke] ([ID])
GO
ALTER TABLE [dbo].[Djelatnici] WITH NOCHECK ADD CONSTRAINT [Djelatnici_FK01] FOREIGN KEY ([IDGrada]) REFERENCES [dbo].[Gradovi] ([ID])
GO
ALTER TABLE [dbo].[Djelatnici] WITH NOCHECK ADD CONSTRAINT [Djelatnici_FK02] FOREIGN KEY ([IDNacinaIsplatePlace]) REFERENCES [dbo].[NacinIsplatePlace] ([ID])
GO
ALTER TABLE [dbo].[Djelatnici] WITH NOCHECK ADD CONSTRAINT [Djelatnici_FK03] FOREIGN KEY ([IDPoslovneJedinice]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
ALTER TABLE [dbo].[Djelatnici] WITH NOCHECK ADD CONSTRAINT [Djelatnici_FK04] FOREIGN KEY ([IDRadnogMjesta]) REFERENCES [dbo].[RadnoMjesto] ([ID])
GO
