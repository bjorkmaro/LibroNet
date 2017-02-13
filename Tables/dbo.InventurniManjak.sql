CREATE TABLE [dbo].[InventurniManjak]
(
[Broj] [int] NULL CONSTRAINT [DF__Inventurni__Broj__75035A77] DEFAULT ((0)),
[Datum] [datetime] NULL,
[Opis] [ntext] COLLATE Croatian_CI_AS NULL,
[Vrijednost] [float] NULL CONSTRAINT [DF__Inventurn__Vrije__75F77EB0] DEFAULT ((0)),
[RUC] [float] NULL CONSTRAINT [DF__InventurniM__RUC__76EBA2E9] DEFAULT ((0)),
[Porez] [float] NULL CONSTRAINT [DF__Inventurn__Porez__77DFC722] DEFAULT ((0)),
[ProdajnaVrijednost] [float] NULL CONSTRAINT [DF__Inventurn__Proda__78D3EB5B] DEFAULT ((0)),
[DatumZakljuceno] [datetime] NULL,
[DatumURAIRA] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[Zakljuceno] [int] NULL,
[URAIRA] [int] NULL,
[IDPJ] [int] NULL CONSTRAINT [DF__Inventurni__IDPJ__79C80F94] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[InventurniManjak] ADD CONSTRAINT [aaaaaInventurniManjak_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Sifra] ON [dbo].[InventurniManjak] ([Broj], [IDPJ]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriPoslovniceInventurniManjak] ON [dbo].[InventurniManjak] ([IDPJ]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[InventurniManjak] ADD CONSTRAINT [InventurniManjak_FK00] FOREIGN KEY ([IDPJ]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
