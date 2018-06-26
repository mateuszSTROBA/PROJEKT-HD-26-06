USE HD_REPOZYTORIUM_GLOWNE
set language polish
DECLARE @StartTime DATETIME = '31-10-2015 00:00:00' --Starting value of Date Range
DECLARE @EndTime DATETIME = '02-11-2015 23:59:59' --End Value of Date Range


DECLARE @CurrentTime AS DATETIME = @StartTime

WHILE @CurrentTime <= @EndTime
BEGIN 

INSERT INTO [dbo].[DateTime]
SELECT
	CONVERT (char(8),@CurrentTime,112) + REPLACE(CONVERT (varchar(8),@CurrentTime,108),':','') as [ID],
	@CurrentTime	AS [DateTime],
		CASE DATEPART(HH,@CurrentTime)
		WHEN '0' THEN CONVERT (varchar(10),DATEADD(dd,-1,@CurrentTime),105) + ' ' + STUFF(CONVERT(varchar(8),@CurrentTime,108),1,2,'24')
		WHEN '1' THEN CONVERT (varchar(10),DATEADD(dd,-1,@CurrentTime),105) + ' ' + STUFF(CONVERT(varchar(8),@CurrentTime,108),1,2,'25')
		ELSE  CONVERT (varchar(8),@CurrentTime,105) + ' ' + CONVERT(varchar(8),@CurrentTime,108)
	END as [MediaDateTime],
	@CurrentTime AS [Date],
		CASE DATEPART(HH,@CurrentTime)
		WHEN '0' THEN CONVERT (varchar(10),DATEADD(dd,-1,@CurrentTime),105)
		WHEN '1' THEN CONVERT (varchar(10),DATEADD(dd,-1,@CurrentTime),105)
		ELSE CONVERT (varchar(10),@CurrentTime,105)
	END AS [MediaDate],
	DATEPART(HH,@CurrentTime) AS [Hour],
		CASE DATEPART(HH,@CurrentTime)
		WHEN '0' THEN '24'
		WHEN '1' THEN '25'
		ELSE DATEPART(HH,@CurrentTime)
	END AS [MediaHour],
	DATEPART(minute, @CurrentTime) as [minute],
	@CurrentTime AS [DateHour],
	CASE DATEPART(HH,@CurrentTime)
		WHEN '0' THEN CONVERT (varchar(10),DATEADD(dd,-1,@CurrentTime),105) + ' ' + STUFF(CONVERT(varchar(8),@CurrentTime,108),1,2,'24')
		WHEN '1' THEN CONVERT (varchar(10),DATEADD(dd,-1,@CurrentTime),105) + ' ' + STUFF(CONVERT(varchar(8),@CurrentTime,108),1,2,'25')
		ELSE  CONVERT (varchar(10),@CurrentTime,105) + ' ' + CONVERT(varchar(8),@CurrentTime,108)
	END as [DateMediaHour],
	DATEPART(DD, @CurrentTime) as [DayOfMonth],
	DATEPART(DW,@CurrentTime) as [DayOfWeek],
	DATEPART(DY,@CurrentTime) as [DayOfYear],
	DATEPART(WW,@CurrentTime) as [WeekOfYear],
	DATENAME(MM, @CurrentTime) as [Month],
	DATEPART(MM, @CurrentTime) as [MonthNumber],
	DATENAME(DW, @CurrentTime) as [Weekday]
	

SET @CurrentTime = DATEADD(minute,1,@CurrentTime)

END
