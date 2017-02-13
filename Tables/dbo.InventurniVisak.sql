CREATE TABLE [dbo].[InventurniVisak]
(
[Broj] [int] NULL CONSTRAINT [DF__Inventurni__Broj__60FC61CA] DEFAULT ((0)),
[Datum] [datetime] NULL,
[Opis] [ntext] COLLATE Croatian_CI_AS NULL,
[Vrijednost] [float] NULL CONSTRAINT [DF__Inventurn__Vrije__61F08603] DEFAULT ((0)),
[RUC] [float] NULL CONSTRAINT [DF__InventurniV__RUC__62E4AA3C] DEFAULT ((0)),
[Porez] [float] NULL CONSTRAINT [DF__Inventurn__Porez__63D8CE75] DEFAULT ((0)),
[ProdajnaVrijednost] [float] NULL CONSTRAINT [DF__Inventurn__Proda__64CCF2AE] DEFAULT ((0)),
[DatumZakljuceno] [datetime] NULL,
[DatumURAIRA] [datetime] NULL,
[DatumFormirano] [datetime] NULL,
[DatumKnjizeno] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[Zakljuceno] [int] NULL,
[URAIRA] [int] NULL,
[Formirano] [int] NULL,
[Knjizeno] [int] NULL,
[IDPrimke] [int] NULL,
[IDPJ] [int] NULL,
[IDPredloska] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[InventurniVisak] ADD CONSTRAINT [aaaaaInventurniVisak_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Sifra] ON [dbo].[InventurniVisak] ([Broj], [IDPJ]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriPoslovniceInventurniVisak] ON [dbo].[InventurniVisak] ([IDPJ]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GlavnaKnjigaPredlosciInventurniVisak] ON [dbo].[InventurniVisak] ([IDPredloska]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InventurniVisak] ADD CONSTRAINT [InventurniVisak_FK01] FOREIGN KEY ([IDPJ]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
ALTER TABLE [dbo].[InventurniVisak] ADD CONSTRAINT [InventurniVisak_FK00] FOREIGN KEY ([IDPredloska]) REFERENCES [dbo].[GlavnaKnjigaPredlosci] ([ID])
GO
