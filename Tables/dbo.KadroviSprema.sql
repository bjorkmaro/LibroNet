CREATE TABLE [dbo].[KadroviSprema]
(
[Naziv] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDZapisa] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KadroviSprema] ADD CONSTRAINT [aaaaaKadroviSprema_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KadroviKadroviSprema] ON [dbo].[KadroviSprema] ([IDZapisa]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[KadroviSprema] ([Naziv], [IDZapisa]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KadroviSprema] ADD CONSTRAINT [KadroviSprema_FK00] FOREIGN KEY ([IDZapisa]) REFERENCES [dbo].[Kadrovi] ([ID]) ON DELETE CASCADE
GO
