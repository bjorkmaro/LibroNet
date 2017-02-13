CREATE TABLE [dbo].[CjeniciCijene]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDCjenika] [int] NULL CONSTRAINT [DF__CjeniciCi__IDCje__69C6B1F5] DEFAULT ((0)),
[IDArtikla] [int] NULL CONSTRAINT [DF__CjeniciCi__IDArt__6ABAD62E] DEFAULT ((0)),
[OsnovnaCijena] [float] NULL,
[Porez] [float] NULL,
[PP] [float] NULL,
[Cijena] [float] NULL CONSTRAINT [DF__CjeniciCi__Cijen__6BAEFA67] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CjeniciCijene] ADD CONSTRAINT [aaaaaCjeniciCijene_PK] PRIMARY KEY NONCLUSTERED  ([ID]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ArtikliCjeniciCijene] ON [dbo].[CjeniciCijene] ([IDArtikla]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [CjeniciCjeniciCijene] ON [dbo].[CjeniciCijene] ([IDCjenika]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CjeniciCijene] WITH NOCHECK ADD CONSTRAINT [CjeniciCijene_FK00] FOREIGN KEY ([IDArtikla]) REFERENCES [dbo].[Artikli] ([ID])
GO
ALTER TABLE [dbo].[CjeniciCijene] WITH NOCHECK ADD CONSTRAINT [CjeniciCijene_FK01] FOREIGN KEY ([IDCjenika]) REFERENCES [dbo].[Cjenici] ([ID]) ON DELETE CASCADE ON UPDATE CASCADE
GO
