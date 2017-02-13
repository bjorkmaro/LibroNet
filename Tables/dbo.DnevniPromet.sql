CREATE TABLE [dbo].[DnevniPromet]
(
[Datum] [datetime] NULL,
[OsnovicaNultaStopa] [float] NULL,
[Osnovica] [float] NULL,
[Osnovica5] [float] NULL,
[Osnovica10] [float] NULL,
[PDV] [float] NULL,
[PDV5] [float] NULL,
[PDV10] [float] NULL,
[PP] [float] NULL,
[UkupniIznos] [float] NULL,
[DatumURAIRA] [datetime] NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[URAIRA] [int] NULL,
[IDNacinaPlacanja] [int] NULL,
[IDPJ] [int] NULL,
[Neoporezivo] [float] NULL CONSTRAINT [DF_DnevniPromet_Neoporezivo] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DnevniPromet] ADD CONSTRAINT [PK_DnevniPromet] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DnevniPromet] ADD CONSTRAINT [FK_DnevniPromet_NacinPlacanja] FOREIGN KEY ([IDNacinaPlacanja]) REFERENCES [dbo].[NacinPlacanja] ([ID])
GO
ALTER TABLE [dbo].[DnevniPromet] ADD CONSTRAINT [FK_DnevniPromet_PartneriPoslovnice] FOREIGN KEY ([IDPJ]) REFERENCES [dbo].[PartneriPoslovnice] ([ID])
GO
