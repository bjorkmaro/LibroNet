CREATE TABLE [dbo].[Logo]
(
[Header] [image] NULL,
[Footer] [image] NULL,
[FooterHeight] [int] NULL CONSTRAINT [DF__Logo__FooterHeig__0F975522] DEFAULT ((0)),
[Text] [ntext] COLLATE Croatian_CI_AS NULL,
[ID] [int] NOT NULL IDENTITY(1, 1)
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
