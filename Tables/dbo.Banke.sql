CREATE TABLE [dbo].[Banke]
(
[Naziv] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Sjediste] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[Broj] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[SWIFT] [nvarchar] (50) COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1),
[IDPartnera] [int] NULL,
[upsize_ts] [timestamp] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Banke] ADD CONSTRAINT [aaaaaBanke_PK] PRIMARY KEY NONCLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [PartneriBanke] ON [dbo].[Banke] ([IDPartnera]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Naziv] ON [dbo].[Banke] ([Naziv]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Banke] WITH NOCHECK ADD CONSTRAINT [Banke_FK00] FOREIGN KEY ([IDPartnera]) REFERENCES [dbo].[Partneri] ([ID])
GO
