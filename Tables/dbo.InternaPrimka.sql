CREATE TABLE [dbo].[InternaPrimka]
(
[Broj] [int] NULL CONSTRAINT [DF__InternaPri__Broj__02284B6B] DEFAULT ((0)),
[Datum] [datetime] NULL,
[PoslovnaJedinica] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Vrsta] [smallint] NULL CONSTRAINT [DF__InternaPr__Vrsta__031C6FA4] DEFAULT ((0)),
[Vrijednost] [float] NULL CONSTRAINT [DF__InternaPr__Vrije__041093DD] DEFAULT ((0)),
[Troskovi] [float] NULL CONSTRAINT [DF__InternaPr__Trosk__0504B816] DEFAULT ((0)),
[Iznos] [float] NULL CONSTRAINT [DF__InternaPr__Iznos__05F8DC4F] DEFAULT ((0)),
[RUC] [float] NULL CONSTRAINT [DF__InternaPrim__RUC__06ED0088] DEFAULT ((0)),
[Porez] [float] NULL CONSTRAINT [DF__InternaPr__Porez__07E124C1] DEFAULT ((0)),
[ProdajnaVrijednost] [float] NULL CONSTRAINT [DF__InternaPr__Proda__08D548FA] DEFAULT ((0)),
[DatumZakljucenoR] [datetime] NULL,
[DatumZakljucenoF] [datetime] NULL,
[DatumFormirano] [datetime] NULL,
[DatumKnjizeno] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[BrojOtpremnice] [int] NULL CONSTRAINT [DF__InternaPr__BrojO__09C96D33] DEFAULT ((0)),
[DatumOtpremnice] [datetime] NULL,
[ZakljucenoR] [int] NULL,
[ZakljucenoF] [int] NULL,
[Formirano] [int] NULL,
[Knjizeno] [int] NULL,
[IDPJ] [int] NULL,
[IDPredloska] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InternaPrimka] ADD CONSTRAINT [aaaaaInternaPrimka_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Sifra] ON [dbo].[InternaPrimka] ([Broj], [IDPJ]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriPoslovniceInternaPrimka] ON [dbo].[InternaPrimka] ([IDPJ]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GlavnaKnjigaPredlosciInternaPrimka] ON [dbo].[InternaPrimka] ([IDPredloska]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriPoslovniceInternaPrimka1] ON [dbo].[InternaPrimka] ([PoslovnaJedinica]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InternaPrimka] ADD CONSTRAINT [FK_InternaPrimka_PartneriPoslovnice] FOREIGN KEY ([IDPJ]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
ALTER TABLE [dbo].[InternaPrimka] ADD CONSTRAINT [FK_InternaPrimka_GlavnaKnjigaPredlosci] FOREIGN KEY ([IDPredloska]) REFERENCES [dbo].[GlavnaKnjigaPredlosci] ([ID])
GO
