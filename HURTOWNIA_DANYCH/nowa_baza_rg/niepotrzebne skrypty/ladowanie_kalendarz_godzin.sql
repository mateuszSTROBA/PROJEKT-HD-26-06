USE [HD_REPOZYTORIUM_GLOWNE]
GO

INSERT INTO KALENDARZ_GODZIN([hour]
      ,[media_hour]
      ,[date_hour]
      ,[date_media_hour]
      ,[minute])
SELECT [Hour]
      ,[MediaHour]
      ,[DateHour]
      ,[DateMediaHour]
	  ,[minute]
	  FROM DateTime

