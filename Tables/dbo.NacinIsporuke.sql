CREATE TABLE [dbo].[NacinIsporuke]
(
[Naziv] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NacinIsporuke] ADD CONSTRAINT [aaaaaNacinIsporuke_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[NacinIsporuke] ([Naziv]) ON [PRIMARY]
GO
