CREATE TABLE [dbo].[KadroviGrupaPoslova]
(
[Naziv] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDZapisa] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KadroviGrupaPoslova] ADD CONSTRAINT [aaaaaKadroviGrupaPoslova_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KadroviKadroviGrupaPoslova] ON [dbo].[KadroviGrupaPoslova] ([IDZapisa]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[KadroviGrupaPoslova] ([Naziv], [IDZapisa]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KadroviGrupaPoslova] ADD CONSTRAINT [KadroviGrupaPoslova_FK00] FOREIGN KEY ([IDZapisa]) REFERENCES [dbo].[Kadrovi] ([ID]) ON DELETE CASCADE
GO
