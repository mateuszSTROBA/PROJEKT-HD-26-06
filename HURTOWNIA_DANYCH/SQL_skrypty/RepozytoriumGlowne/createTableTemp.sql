USE [HD_REPOZYTORIUM_GLOWNE]
GO

/****** Object:  Table [dbo].[TableTemp]    Script Date: 14.06.2018 14:05:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TableTemp](
	[DATE_TYM] [datetime] NULL,
	[CHANNEL_TYM] [varchar](50) NULL,
	[DESCRIPTION_TYM] [varchar](100) NULL,
	[ND_DESCRIPTION_TYM] [varchar](100) NULL,
	[START_TIME_TYM] [varchar](50) NULL,
	[DURATION_TYM] [time](7) NULL,
	[VARIABLE_TARGET_TYM] [varchar](50) NULL,
	[TOTAL_INDIVIDUALS_TYM] [float] NULL,
	[PODGRUPA_TYM] [float] NULL,
	[A1649_TYM] [float] NULL,
	[M1649_TYM] [float] NULL,
	[A415_TYM] [float] NULL,
	[A49_TYM] [float] NULL,
	[start_time2] [time](7) NULL,
	[Date2] [datetime] NULL,
	[Channel.ID] [smallint] NULL,
	[Descriptions.ID] [bigint] NULL
) ON [PRIMARY]
GO

