CREATE TABLE [dbo].[Brojevi]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Dokument] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Broj] [int] NULL CONSTRAINT [DF__Brojevi__Broj__29E1370A] DEFAULT ((0)),
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Brojevi] ADD CONSTRAINT [aaaaaBrojevi_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
