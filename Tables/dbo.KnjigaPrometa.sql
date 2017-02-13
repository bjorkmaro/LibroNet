CREATE TABLE [dbo].[KnjigaPrometa]
(
[PJ] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[Broj] [int] NULL CONSTRAINT [DF__KnjigaProm__Broj__4AB81AF0] DEFAULT ((0)),
[Datum] [datetime] NULL,
[Opis] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[Gotovina] [float] NULL,
[Cekovi] [float] NULL,
[DatumKnjizeno] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[Knjizeno] [int] NULL,
[IDPJ] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KnjigaPrometa] ADD CONSTRAINT [aaaaaKnjigaPrometa_PK] PRIMARY KEY NONCLUSTERED  ([ID]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KnjigaPrometa] ADD CONSTRAINT [FK_KnjigaPrometa_PartneriPoslovnice1] FOREIGN KEY ([PJ]) REFERENCES [dbo].[PartneriPoslovnice] ([Naziv]) ON UPDATE CASCADE
GO
