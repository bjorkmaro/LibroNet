CREATE TABLE [dbo].[GlavnaKnjigaDokumenti]
(
[Naziv] [nvarchar] (100) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[RedniBroj] [int] NULL CONSTRAINT [DF__GlavnaKnj__Redni__093F5D4E] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[GlavnaKnjigaDokumenti] ADD CONSTRAINT [aaaaaGlavnaKnjigaDokumenti_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[GlavnaKnjigaDokumenti] ([Naziv]) ON [PRIMARY]
GO
