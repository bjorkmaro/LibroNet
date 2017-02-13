CREATE TABLE [dbo].[NacinPlacanja]
(
[Naziv] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[PopustVeleprodaja] [real] NULL CONSTRAINT [DF__NacinPlac__Popus__023D5A04] DEFAULT ((0)),
[PopustMaloprodaja] [real] NULL CONSTRAINT [DF__NacinPlac__Popus__03317E3D] DEFAULT ((0)),
[ID] [int] NOT NULL IDENTITY(1, 1),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[NacinPlacanja] ADD CONSTRAINT [aaaaaNacinPlacanja_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[NacinPlacanja] ([Naziv]) ON [PRIMARY]
GO
