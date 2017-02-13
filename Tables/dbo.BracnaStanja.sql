CREATE TABLE [dbo].[BracnaStanja]
(
[Naziv] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BracnaStanja] ADD CONSTRAINT [aaaaaBracnaStanja_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[BracnaStanja] ([Naziv]) ON [PRIMARY]
GO
