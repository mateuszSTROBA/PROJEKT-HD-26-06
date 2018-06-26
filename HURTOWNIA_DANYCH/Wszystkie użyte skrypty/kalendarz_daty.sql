USE HD_REPOZYTORIUM_GLOWNE
set language polish
DECLARE @StartTime DATETIME = '31-10-2015 00:00:00' --Starting value of Date Range
DECLARE @EndTime DATETIME = '08-11-2015 23:59:59' --End Value of Date Range


DECLARE @CurrentTime AS DATETIME = @StartTime

WHILE @CurrentTime <= @EndTime
BEGIN 

INSERT INTO [dbo].[KALENDARZ_DATY]
SELECT
	DATEPART(DD, @CurrentTime) as [DayOfMonth],
	DATEPART(DW,@CurrentTime) as [DayOfWeek],
	DATEPART(DY,@CurrentTime) as [DayOfYear],
	DATEPART(WW,@CurrentTime) as [WeekOfYear],
	DATENAME(MM, @CurrentTime) as [Month],
	DATEPART(MM, @CurrentTime) as [MonthNumber],
	DATENAME(DW, @CurrentTime) as [Weekday],
	

    @CurrentTime	AS [data],
	CASE DATEPART(HH,@CurrentTime)
		WHEN '0' THEN CONVERT (varchar(10),DATEADD(dd,-1,@CurrentTime),105)
		WHEN '1' THEN CONVERT (varchar(10),DATEADD(dd,-1,@CurrentTime),105)
		ELSE CONVERT (varchar(10),@CurrentTime,105)
	END AS [MediaDate],
	DATEPART(YEAR,@CurrentTime) as [Year]

    SET @CurrentTime = DATEADD(minute,1,@CurrentTime)

END

