CREATE TABLE [dbo].[MjestaTroska]
(
[Naziv] [nvarchar] (255) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MjestaTroska] ADD CONSTRAINT [PK_MjestaTroska] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
