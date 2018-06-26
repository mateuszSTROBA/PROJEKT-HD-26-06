USE [HDRepozytoriumGlowne]
GO




USE [HDRepozytoriumGlowne]
GO

/****** Object:  Table [dbo].[Channel]    Script Date: 09.05.2018 20:58:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Channel](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [HDRepozytoriumGlowne]
GO

/****** Object:  Table [dbo].[DateTime]    Script Date: 09.05.2018 20:58:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kategorie_kanalow] (
[ID] [smallint] IDENTITY(1,1) NOT NULL,
[nazwa_kanalu] [varchar](50) NULL,
[nazwa_kategorii] [varchar](50) NULL,
CONSTRAINT [PK_KategoriaKanal] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [HDRepozytoriumGlowne]
GO

/****** Object:  Table [dbo].[Description]    Script Date: 09.05.2018 20:58:43 ******/

/****** Object:  Table [dbo].[DateTime]    Script Date: 09.05.2018 20:58:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DateTime](
	[ID] [bigint] NOT NULL,
	[DateTime] [datetime] NULL,
	[MediaDateTime] [varchar](20) NULL,
	[Date] [date] NULL,
	[MediaDate] [date] NULL,
	[Time] [time](7) NULL,
	[MediaTime] [varchar](8) NULL,
	[Hour] [time](7) NULL,
	[MediaHour] [varchar](8) NULL,
	[DateHour] [datetime] NULL,
	[DateMediaHour] [varchar](20) NULL,
	[DayOfMonth] [tinyint] NULL,
	[DayOfWeek] [tinyint] NULL,
	[DayOfYear] [smallint] NULL,
	[WeekOfYear] [tinyint] NULL,
	[Month] [varchar](10) NULL,
	[MonthNumber] [tinyint] NULL,
	[Weekday] [varchar](10) NULL,
 CONSTRAINT [PK_DateTime] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [HDRepozytoriumGlowne]
GO

/****** Object:  Table [dbo].[Description]    Script Date: 09.05.2018 20:58:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Description](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[1stDescription] [varchar](100) NULL,
	[2ndDescription] [varchar](100) NULL,
 CONSTRAINT [PK_Description] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [HDRepozytoriumGlowne]
GO

/****** Object:  Table [dbo].[TargetGroups]    Script Date: 09.05.2018 20:59:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TargetGroups](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
 CONSTRAINT [PK_TargetGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [HDRepozytoriumGlowne]
GO

/****** Object:  Table [dbo].[temp]    Script Date: 09.05.2018 21:39:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[temp](
	[Date] [varchar](50) NULL,
	[Channel] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
	[Start time] [varchar](50) NULL,
	[Duration] [time](7) NULL,
	[Variable Target] [varchar](50) NULL,
	[Total Individuals] [float] NULL,
	[Podgrupa] [float] NULL,
	[A16-49] [float] NULL,
	[M16-49] [float] NULL,
	[A4-15] [float] NULL,
	[A4-9] [float] NULL,
	[start_time2] [time](7) NULL
) ON [PRIMARY]
GO




USE [HDRepozytoriumGlowne]
GO

/****** Object:  Table [dbo].[Fact]    Script Date: 09.05.2018 20:59:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fact](
	[FactID] [bigint] NOT NULL,
	[TargetGroupID] [smallint] NULL,
	[DescriptionID] [bigint] NULL,
	[ChannelID] [smallint] NULL,
	[DateTimeID] [bigint] NULL,
	[AMR] [float] NULL,
	[AMR%] [float] NULL,
	[SHR%] [float] NULL,
	[RCH%] [float] NULL,
	[RCH] [float] NULL,
 CONSTRAINT [PK_Fact] PRIMARY KEY CLUSTERED 
(
	[FactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO




GO

ALTER TABLE [dbo].[Fact]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Channel] FOREIGN KEY([ChannelID])
REFERENCES [dbo].[Channel] ([ID])
GO

ALTER TABLE [dbo].[Fact] CHECK CONSTRAINT [FK_Fact_Channel]
GO

ALTER TABLE [dbo].[Fact]  WITH CHECK ADD  CONSTRAINT [FK_Fact_DateTime] FOREIGN KEY([DateTimeID])
REFERENCES [dbo].[DateTime] ([ID])
GO

ALTER TABLE [dbo].[Fact] CHECK CONSTRAINT [FK_Fact_DateTime]
GO

ALTER TABLE [dbo].[Fact]  WITH CHECK ADD  CONSTRAINT [FK_Fact_Description] FOREIGN KEY([DescriptionID])
REFERENCES [dbo].[Description] ([ID])
GO

ALTER TABLE [dbo].[Fact] CHECK CONSTRAINT [FK_Fact_Description]
GO

ALTER TABLE [dbo].[Fact]  WITH CHECK ADD  CONSTRAINT [FK_Fact_TargetGroups] FOREIGN KEY([TargetGroupID])
REFERENCES [dbo].[TargetGroups] ([ID])
GO

ALTER TABLE [dbo].[Fact] CHECK CONSTRAINT [FK_Fact_TargetGroups]
GO

ALTER TABLE [dbo].[Channel]  WITH CHECK ADD  CONSTRAINT [FK_Channel_kategorie_kanalow] FOREIGN KEY([kategorie_kanalowID])
REFERENCES [dbo].[PK_kategorie_kanalow] ([ID])
GO

ALTER TABLE [dbo].[Channel] CHECK CONSTRAINT [FK_Channel_kategorie_kanalow]
GO


