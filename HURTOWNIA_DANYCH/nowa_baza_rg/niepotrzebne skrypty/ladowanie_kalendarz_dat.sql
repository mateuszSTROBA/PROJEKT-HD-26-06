USE [HD_REPOZYTORIUM_GLOWNE]
GO

INSERT INTO KALENDARZ_DATY ([day_of_month]
      ,[day_of_week]
      ,[day_of_year]
      ,[week_of_year]
      ,[month]
      ,[month_number]
      ,[week_day])
SELECT [DayOfMonth]
      ,[DayOfWeek]
      ,[DayOfYear]
      ,[WeekOfYear]
      ,[Month]
      ,[MonthNumber]
      ,[Weekday]
	  FROM DateTime