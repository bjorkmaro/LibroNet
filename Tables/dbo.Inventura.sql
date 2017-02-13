CREATE TABLE [dbo].[Inventura]
(
[Broj] [int] NULL CONSTRAINT [DF__Inventura__Broj__062DE679] DEFAULT ((0)),
[Datum] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[Napomena] [ntext] COLLATE Croatian_CI_AS NULL,
[IDPJ] [int] NULL CONSTRAINT [DF__Inventura__IDPJ__07220AB2] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inventura] ADD CONSTRAINT [aaaaaInventura_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inventura] ADD CONSTRAINT [FK_Inventura_PartneriPoslovnice] FOREIGN KEY ([IDPJ]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
