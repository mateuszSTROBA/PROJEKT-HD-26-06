USE [HD_DATASTAGE]
GO

/****** Object:  Table [dbo].[dane_glowne_data_stage]    Script Date: 28.05.2018 23:47:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dane_glowne_data_stage](
	[Date] [varchar](50) NULL,
	[Channel] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
	[2nd Description] [varchar](100) NULL,
	[Start time] [varchar](50) NULL,
	[Duration] [varchar](50) NULL,
	[Variable Target] [varchar](50) NULL,
	[Total Individuals] [varchar](50) NULL,
	[Podgrupa] [varchar](50) NULL,
	[A16-49] [varchar](50) NULL,
	[M16-49] [varchar](50) NULL,
	[A4-15] [varchar](50) NULL,
	[A4-9] [varchar](50) NULL,
	[Column 13] [varchar](50) NULL
) ON [PRIMARY]
GO

