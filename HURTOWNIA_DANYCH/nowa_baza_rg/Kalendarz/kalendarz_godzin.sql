USE HD_REPOZYTORIUM_GLOWNE
set language polish
DECLARE @StartTime DATETIME = '31-10-2015 00:00:00' --Starting value of Date Range
DECLARE @EndTime DATETIME = '08-11-2015 23:59:59' --End Value of Date Range


DECLARE @CurrentTime AS DATETIME = @StartTime

WHILE @CurrentTime <= @EndTime
BEGIN 

INSERT INTO [dbo].[KALENDARZ_GODZIN] ([hour],[media_hour],[date_hour],[date_media_hour],[minute]) 
SELECT
	
DATEPART(HH,@CurrentTime) AS [Hour],
CASE DATEPART(HH,@CurrentTime)
		WHEN '0' THEN '24'
		WHEN '1' THEN '25'
		ELSE DATEPART(HH,@CurrentTime)
	END AS [MediaHour],
    @CurrentTime AS [DateHour],
	
    CASE DATEPART(HH,@CurrentTime)
		WHEN '0' THEN CONVERT (varchar(10),DATEADD(dd,-1,@CurrentTime),105) + ' ' + STUFF(CONVERT(varchar(8),@CurrentTime,108),1,2,'24')
		WHEN '1' THEN CONVERT (varchar(10),DATEADD(dd,-1,@CurrentTime),105) + ' ' + STUFF(CONVERT(varchar(8),@CurrentTime,108),1,2,'25')
		ELSE  CONVERT (varchar(10),@CurrentTime,105) + ' ' + CONVERT(varchar(8),@CurrentTime,108)
	END as [DateMediaHour],
    	DATEPART(minute, @CurrentTime) as [minute]
    SET @CurrentTime = DATEADD(minute,1,@CurrentTime)

END

  UPDATE KALENDARZ_GODZIN
  SET time =CAST(date_hour AS time)
FROM KALENDARZ_GODZIN