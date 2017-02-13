CREATE TABLE [dbo].[KadroviRadnaMjesta]
(
[Naziv] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDZapisa] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KadroviRadnaMjesta] ADD CONSTRAINT [aaaaaKadroviRadnaMjesta_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [KadroviKadroviRadnaMjesta] ON [dbo].[KadroviRadnaMjesta] ([IDZapisa]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RadnoMjestoKadroviRadnaMjesta] ON [dbo].[KadroviRadnaMjesta] ([Naziv]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[KadroviRadnaMjesta] ([Naziv], [IDZapisa]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[KadroviRadnaMjesta] ADD CONSTRAINT [KadroviRadnaMjesta_FK00] FOREIGN KEY ([IDZapisa]) REFERENCES [dbo].[Kadrovi] ([ID]) ON DELETE CASCADE
GO
ALTER TABLE [dbo].[KadroviRadnaMjesta] ADD CONSTRAINT [KadroviRadnaMjesta_FK01] FOREIGN KEY ([Naziv]) REFERENCES [dbo].[RadnoMjesto] ([Naziv]) ON UPDATE CASCADE
GO
