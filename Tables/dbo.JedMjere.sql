CREATE TABLE [dbo].[JedMjere]
(
[Naziv] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Skracenica] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[JedMjere] ADD CONSTRAINT [aaaaaJedMjere_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[JedMjere] ([Naziv]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Skracenica] ON [dbo].[JedMjere] ([Skracenica]) ON [PRIMARY]
GO
