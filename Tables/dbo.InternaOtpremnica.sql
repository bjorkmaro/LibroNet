CREATE TABLE [dbo].[InternaOtpremnica]
(
[Broj] [int] NULL CONSTRAINT [DF__InternaOtp__Broj__4830B400] DEFAULT ((0)),
[Datum] [datetime] NULL,
[PoslovnaJedinica] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[Vrsta] [smallint] NULL CONSTRAINT [DF__InternaOt__Vrsta__4924D839] DEFAULT ((0)),
[Vrijednost] [float] NULL CONSTRAINT [DF__InternaOt__Vrije__4A18FC72] DEFAULT ((0)),
[RUC] [float] NULL CONSTRAINT [DF__InternaOtpr__RUC__4B0D20AB] DEFAULT ((0)),
[Porez] [float] NULL CONSTRAINT [DF__InternaOt__Porez__4C0144E4] DEFAULT ((0)),
[ProdajnaVrijednost] [float] NULL CONSTRAINT [DF__InternaOt__Proda__4CF5691D] DEFAULT ((0)),
[Primatelj] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[DatumZakljuceno] [datetime] NULL,
[DatumKnjizeno] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[NacinIsporuke] [int] NULL,
[Franco] [int] NULL,
[TekstPrije] [ntext] COLLATE Croatian_CI_AS NULL,
[TekstIza] [ntext] COLLATE Croatian_CI_AS NULL,
[Zakljuceno] [int] NULL,
[Knjizeno] [int] NULL,
[IDPredloska] [int] NULL,
[IDPJ] [int] NULL CONSTRAINT [DF__InternaOtp__IDPJ__4DE98D56] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[InternaOtpremnica] ADD CONSTRAINT [aaaaaInternaOtpremnica_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Sifra] ON [dbo].[InternaOtpremnica] ([Broj], [IDPJ]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [FrancoInternaOtpremnica] ON [dbo].[InternaOtpremnica] ([Franco]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriPoslovniceInternaOtpremnica] ON [dbo].[InternaOtpremnica] ([IDPJ]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GlavnaKnjigaPredlosciInternaOtpremnica] ON [dbo].[InternaOtpremnica] ([IDPredloska]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NacinIsporukeInternaOtpremnica] ON [dbo].[InternaOtpremnica] ([NacinIsporuke]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriPoslovniceInternaOtpremnica1] ON [dbo].[InternaOtpremnica] ([PoslovnaJedinica]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InternaOtpremnica] ADD CONSTRAINT [FK_InternaOtpremnica_Franco] FOREIGN KEY ([Franco]) REFERENCES [dbo].[Franco] ([ID])
GO
ALTER TABLE [dbo].[InternaOtpremnica] ADD CONSTRAINT [FK_InternaOtpremnica_PartneriPoslovnice] FOREIGN KEY ([IDPJ]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
ALTER TABLE [dbo].[InternaOtpremnica] ADD CONSTRAINT [FK_InternaOtpremnica_GlavnaKnjigaPredlosci] FOREIGN KEY ([IDPredloska]) REFERENCES [dbo].[GlavnaKnjigaPredlosci] ([ID])
GO
ALTER TABLE [dbo].[InternaOtpremnica] ADD CONSTRAINT [FK_InternaOtpremnica_NacinIsporuke] FOREIGN KEY ([NacinIsporuke]) REFERENCES [dbo].[NacinIsporuke] ([ID])
GO
