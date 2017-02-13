CREATE TABLE [dbo].[Drzave]
(
[Naziv] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Valuta] [nvarchar] (4) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Drzave] ADD CONSTRAINT [aaaaaDrzave_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[Drzave] ([Naziv]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [ValuteDrzave] ON [dbo].[Drzave] ([Valuta]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Drzave] ADD CONSTRAINT [Drzave_FK00] FOREIGN KEY ([Valuta]) REFERENCES [dbo].[Valute] ([Skracenica]) ON UPDATE CASCADE
GO
