CREATE TABLE [dbo].[KnjigaPopisa]
(
[RedniBroj] [int] NULL CONSTRAINT [DF__KnjigaPop__Redni__4F7CD00D] DEFAULT ((0)),
[Datum] [datetime] NULL,
[Opis] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[Zaduzenje] [float] NULL CONSTRAINT [DF__KnjigaPop__Zaduz__5070F446] DEFAULT ((0)),
[Razduzenje] [float] NULL CONSTRAINT [DF__KnjigaPop__Razdu__5165187F] DEFAULT ((0)),
[IDPJ] [int] NULL CONSTRAINT [DF__KnjigaPopi__IDPJ__52593CB8] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[VrstaDokumenta] [smallint] NULL,
[IDDokumenta] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KnjigaPopisa] ADD CONSTRAINT [aaaaaKnjigaPopisa_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IDPJ] ON [dbo].[KnjigaPopisa] ([IDPJ]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KnjigaPopisa] ADD CONSTRAINT [FK_KnjigaPopisa_PartneriPoslovnice] FOREIGN KEY ([IDPJ]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
