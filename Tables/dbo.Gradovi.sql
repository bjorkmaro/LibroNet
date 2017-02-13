CREATE TABLE [dbo].[Gradovi]
(
[Sifra] [nvarchar] (4) COLLATE Croatian_CI_AS NULL,
[Naziv] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[upsize_ts] [timestamp] NULL,
[Sifra3] [nchar] (3) COLLATE Croatian_CI_AS NULL,
[Sifra5] [nchar] (5) COLLATE Croatian_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Gradovi] ADD CONSTRAINT [aaaaaGradovi_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[Gradovi] ([Naziv]) ON [PRIMARY]
GO
