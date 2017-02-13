CREATE TABLE [dbo].[KadroviNazivPoslova]
(
[Naziv] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDZapisa] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KadroviNazivPoslova] ADD CONSTRAINT [aaaaaKadroviNazivPoslova_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KadroviKadroviNazivPoslova] ON [dbo].[KadroviNazivPoslova] ([IDZapisa]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[KadroviNazivPoslova] ([Naziv], [IDZapisa]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KadroviNazivPoslova] ADD CONSTRAINT [KadroviNazivPoslova_FK00] FOREIGN KEY ([IDZapisa]) REFERENCES [dbo].[Kadrovi] ([ID]) ON DELETE CASCADE
GO
