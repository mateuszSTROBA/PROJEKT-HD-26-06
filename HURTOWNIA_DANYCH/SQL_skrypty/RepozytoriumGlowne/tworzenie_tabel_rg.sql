


USE [HD_REPOZYTORIUM_GLOWNE]
GO

/****** Object:  Table [dbo].[Channel]    Script Date: 19.06.2018 11:12:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Channel](
	[ID] [int] NOT NULL,
	[Name] [varchar](50) NULL,
	[kategoriaID] [int] NULL,
	[grupy_medioweID] [int] NULL,
 CONSTRAINT [PK_Channel] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[DateTime]    Script Date: 09.05.2018 20:58:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DateTime](
	[ID] [varchar](16) NOT NULL,
	[DateTime] [datetime] NULL,
	[MediaDateTime] [varchar](19) NULL,
	[Date] [date] NULL,
	[MediaDate] [varchar](10) NULL,
	[Time] [time](7) NULL,
	[MediaTime] [varchar](8) NULL,
	[Hour] [varchar](2) NULL,
	[MediaHour] [varchar](2) NULL,
	[DateHour] [datetime] NULL,
	[DateMediaHour] [varchar](19) NULL,
	[DayOfMonth] [tinyint] NULL,
	[DayOfWeek] [tinyint] NULL,
	[DayOfYear] [smallint] NOT NULL,
	[WeekOfYear] [tinyint] NULL,
	[Month] [varchar](15) NULL,
	[MonthNumber] [tinyint] NULL,
	[Weekday] [varchar](15) NULL,
 CONSTRAINT [PK_DateTime] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [HD_REPOZYTORIUM_GLOWNE]
GO

/****** Object:  Table [dbo].[Description]    Script Date: 09.05.2018 20:58:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Description](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[1stDescription] [varchar](100) NULL,
	[2ndDescription] [varchar](100) NULL
 CONSTRAINT [PK_Description] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [HD_REPOZYTORIUM_GLOWNE]
GO
/****** Object:  Table [dbo].[kategoria]    Script Date: 19.06.2018 11:13:11 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[kategoria](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nazwa_kanalu] [varchar](50) NULL,
	[nazwa_kategorii] [varchar](50) NULL,
 CONSTRAINT [PK_kategoria] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grupy_mediowe]    Script Date: 19.06.2018 11:13:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[grupy_mediowe](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nazwa_kanalu] [varchar](50) NULL,
	[nazwa_grupy] [varchar](50) NULL,
 CONSTRAINT [PK_grupy_mediowe] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TargetGroups]    Script Date: 09.05.2018 20:59:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TargetGroups](
	[ID] [smallint] IDENTITY(1,1) NOT NULL,
	[Nazwa] [varchar](50) NULL,
	[Kod] [varchar](50) NULL,
 CONSTRAINT [PK_TargetGroups] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [HD_REPOZYTORIUM_GLOWNE]
GO

/****** Object:  Table [dbo].[temp]    Script Date: 09.05.2018 21:39:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[temp](
	[MediaDate] [datetime] NULL,
	[Channel] [varchar](50) NULL,
	[Description] [varchar](100) NULL,
	[2nd Description] [varchar](100) NULL,
	[MediaStartTime] [varchar](50) NULL,
	[Duration] [time](7) NULL,
	[Variable Target] [varchar](50) NULL,
	[Total Individuals] [float] NULL,
	[Podgrupa] [float] NULL,
	[A16-49] [float] NULL,
	[M16-49] [float] NULL,
	[A4-15] [float] NULL,
	[A4-9] [float] NULL,
	[start_time2] [time](7) NULL,
	[Date] [datetime] NULL
) ON [PRIMARY]
GO




USE [HD_REPOZYTORIUM_GLOWNE]
GO

/****** Object:  Table [dbo].[Fact]    Script Date: 29.05.2018 00:38:18 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Fact](
	[FactID] [bigint] IDENTITY(1,1) NOT NULL,
	[TargetGroupID] [smallint] NULL,
	[2ndDescriptionID] [bigint] NULL,
	[DescriptionID] [bigint] NULL,
	[ChannelID] [int] NULL,
	[DateTimeID] [varchar](16) NULL,
	[Total Individuals] [float] NULL,
	[Podgrupa] [float] NULL,
	[A16-49] [float] NULL,
	[M16-49] [float] NULL,
	[A4-15] [float] NULL,
	[A4-9] [float] NULL,
 CONSTRAINT [PK_Fact] PRIMARY KEY CLUSTERED 
(
	[FactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
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


ALTER TABLE [dbo].[Channel]  WITH CHECK ADD  CONSTRAINT [FK_Channel_grupy_mediowe] FOREIGN KEY([grupy_medioweID])
REFERENCES [dbo].[grupy_mediowe] ([ID])
GO

ALTER TABLE [dbo].[Channel] CHECK CONSTRAINT [FK_Channel_grupy_mediowe]
GO

ALTER TABLE [dbo].[Channel]  WITH CHECK ADD  CONSTRAINT [FK_Channel_kategoria] FOREIGN KEY([kategoriaID])
REFERENCES [dbo].[kategoria] ([ID])
GO

ALTER TABLE [dbo].[Channel] CHECK CONSTRAINT [FK_Channel_kategoria]
GO


