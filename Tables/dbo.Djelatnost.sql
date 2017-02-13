CREATE TABLE [dbo].[Djelatnost]
(
[Sifra] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[Naziv] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Djelatnost] ADD CONSTRAINT [aaaaaDjelatnost_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[Djelatnost] ([Naziv]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Sifra] ON [dbo].[Djelatnost] ([Sifra]) ON [PRIMARY]
GO
