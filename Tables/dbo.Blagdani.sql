CREATE TABLE [dbo].[Blagdani]
(
[Godina] [int] NULL,
[Mjesec] [int] NOT NULL,
[Dan] [int] NOT NULL,
[ID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Blagdani] ADD CONSTRAINT [PK_Blagdani] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
