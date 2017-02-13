CREATE TABLE [dbo].[Franco]
(
[Naziv] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Franco] ADD CONSTRAINT [aaaaaFranco_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[Franco] ([Naziv]) ON [PRIMARY]
GO
