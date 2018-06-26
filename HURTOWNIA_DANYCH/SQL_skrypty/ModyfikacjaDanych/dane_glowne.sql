SET ANSI_WARNINGS  OFF;

DROP TABLE IF EXISTS [HD_REPOZYTORIUM_GLOWNE].[dbo].[DANE_GLOWNE_TYM];

CREATE TABLE [HD_REPOZYTORIUM_GLOWNE].[dbo].[DANE_GLOWNE_TYM]
(
	DATE_TYM datetime,
	CHANNEL_TYM VARCHAR(50),
	DESCRIPTION_TYM VARCHAR(100),
	ND_DESCRIPTION_TYM VARCHAR(100),
	START_TIME_TYM VARCHAR(50),
	DURATION_TYM time(7),
	VARIABLE_TARGET_TYM VARCHAR(50),
	[Total Individuals] float,
	[Podgrupa] float,
	[A16-49] float,
	[M16-49] float,
	[A4-15] float,
	[A4-9] float,
	start_time2 time (0),
	Date2 datetime
);


DECLARE KURSOR CURSOR FOR
  SELECT [MediaDate]
      , [Channel]
      , [Description]
      , [2nd Description]
      , [MediaStartTime]
      , [Duration]
      , [Variable Target]
      , [Total Individuals]
      , [Podgrupa]
      , [A16-49]
      , [M16-49]
      , [A4-15]
      , [A4-9]
	  , [start_time2]
	  , [Date]

FROM [HD_REPOZYTORIUM_GLOWNE].[dbo].[temp]

DECLARE   @MediaDate datetime ,
			@Channel varchar(50) ,
			@Description varchar(100) ,
			@2nd_Description varchar(100) ,
			@MediaStartTime varchar(50) ,
			@Duration time(7) ,
			@VariableTarget varchar(50) ,
			@TotalIndividuals float ,
			@Podgrupa float ,
			@A1649 float,
			@M1649 float ,
			@A415 float ,
			@A49 float,
			@start_time2 time (0),
			@Date datetime,
			


			@Date_tym varchar(50) ,
			@Channel_tym varchar(50) ,
			@Description_tym varchar(100) ,
			@2nd_Description_tym varchar(100) ,
			@Starttime_tym varchar(50) ,
			@Duration_tym time(7) ,
			@VariableTarget_tym varchar(50) ,
			@TotalIndividuals_tym float ,
			@Podgrupa_tym float ,
			@A1649_tym float ,
			@M1649_tym float ,
			@A415_tym float,
			@A49_tym float,
			@start_time2_tym time (0),
			@Date2_tym datetime



OPEN KURSOR
FETCH NEXT FROM KURSOR INTO @MediaDate, @Channel, @Description, @2nd_Description, @MediaStartTime,@Duration,
								@VariableTarget, @TotalIndividuals ,@Podgrupa, @A1649, @M1649, @A415, @A49,@start_time2,@Date
WHILE @@FETCH_STATUS = 0 
		   BEGIN
	IF @MediaDate is null
			  SET @MediaDate = @Date_tym;
			  ELSE 
			  SET @Date_tym = @MediaDate;

	IF @Channel is null
			  SET @Channel = @Channel_tym;
			  ELSE 
			  SET @Channel_tym = @Channel;

	IF @Description is null
			  SET @Description = @Description_tym;
			  ELSE 
			  SET @Description_tym = @Description;

	IF @2nd_Description is null
			  SET @2nd_Description = @2nd_Description_tym;
			  ELSE 
			  SET @2nd_Description_tym = @2nd_Description;

	IF @MediaStartTime is null
			  SET @MediaStartTime = @Starttime_tym;
			  ELSE 
			  SET @Starttime_tym = @MediaStartTime;

	IF @Duration is null
			  SET @Duration = @Duration_tym;
			  ELSE 
			  SET @Duration_tym = @Duration;

	IF @VariableTarget is null
			  SET @VariableTarget = @VariableTarget_tym;
			  ELSE 
			  SET @VariableTarget_tym = @VariableTarget;

	IF LEFT(@MediaStartTime,2) = '24' 
			  BEGIN
		SET @start_time2 = CONVERT(time(7),STUFF(@MediaStartTime,1,2,'00'));
		SET @Date = DATEADD(dd,-1,@MediaDate);
	END
			ELSE IF LEFT(@MediaStartTime,2) = '25' 
			  BEGIN
		SET @start_time2 = CONVERT(time(7),STUFF(@MediaStartTime,1,2,'01'));
		SET @Date = DATEADD(dd,-1,@MediaDate);
	END
			ELSE
			BEGIN
		SET @start_time2 = CONVERT(time(7),@MediaStartTime);
		SET @Date = @MediaDate;
	END







	INSERT INTO [HD_REPOZYTORIUM_GLOWNE].[dbo].[DANE_GLOWNE_TYM]
		(DATE_TYM, CHANNEL_TYM, DESCRIPTION_TYM, ND_DESCRIPTION_TYM, START_TIME_TYM, DURATION_TYM, VARIABLE_TARGET_TYM, [Total Individuals],
		[Podgrupa]
		,[A16-49]
		,[M16-49]
		,[A4-15]
		,[A4-9],start_time2,Date2)
	VALUES
		(@MediaDate, @Channel, @Description, @2nd_Description, @MediaStartTime, @Duration, @VariableTarget, @TotalIndividuals,
			@Podgrupa, @A1649, @M1649, @A415, @A49, @start_time2, @Date);

	FETCH NEXT FROM KURSOR INTO @MediaDate, @Channel, @Description, @2nd_Description, @MediaStartTime,@Duration,
								@VariableTarget, @TotalIndividuals ,@Podgrupa, @A1649, @M1649, @A415, @A49,@start_time2,@Date

END
CLOSE KURSOR
DEALLOCATE KURSOR




SET ANSI_WARNINGS ON;
			
 

