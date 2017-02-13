CREATE TABLE [dbo].[Kvalifikacije]
(
[Naziv] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Skracenica] [nvarchar] (10) COLLATE Croatian_CI_AS NULL,
[Koeficijent] [real] NULL CONSTRAINT [DF__Kvalifika__Koefi__1367E606] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kvalifikacije] ADD CONSTRAINT [aaaaaKvalifikacije_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[Kvalifikacije] ([Naziv]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Skracenica] ON [dbo].[Kvalifikacije] ([Skracenica]) ON [PRIMARY]
GO
