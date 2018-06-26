 DROP TABLE IF EXISTS [DataStage].[dbo].[grupy_mediowe_poprawione]; 

CREATE TABLE [HD_DATASTAGE].[dbo].[grupy_mediowe_poprawione] (
id int IDENTITY(1,1),
nazwa_kanalu VARCHAR(50),
nazwa_grupy VARCHAR(50));


DECLARE kursor CURSOR FOR
SELECT [F1],
       [F2]
  FROM [HD_DATASTAGE].[dbo].[grupy_mediowe_data_stage]
  DECLARE @F1 VARCHAR(50), @TV VARCHAR(50)
  DECLARE @F2 VARCHAR(50)
  
  OPEN kursor 
  
FETCH NEXT FROM kursor INTO @F1, @TV
WHILE @@FETCH_STATUS = 0 
   BEGIN 
	  IF @F1 IS NULL
	  SET @F2 = @TV;
	  ELSE 

	  INSERT INTO [HD_DATASTAGE].[dbo].[grupy_mediowe_poprawione] (nazwa_kanalu, nazwa_grupy)
		VALUES (@TV, @F2);
      FETCH NEXT FROM kursor INTO @F1, @TV 
	  
   END 
CLOSE kursor 
DEALLOCATE kursor

IF OBJECT_ID('[HD_DATASTAGE].[dbo].[grupy_mediowe_data_stage]', 'U') IS NOT NULL 
  DROP TABLE [HD_DATASTAGE].[dbo].[grupy_mediowe_data_stage]; 

CREATE TABLE [HD_DATASTAGE].[dbo].[grupy_mediowe_data_stage] (
id int IDENTITY(1,1),
nazwa_kanalu VARCHAR(50),
nazwa_grupy VARCHAR(50));

INSERT INTO [HD_DATASTAGE].[dbo].[grupy_mediowe_data_stage] (nazwa_kanalu, nazwa_grupy)
SELECT nazwa_kanalu, nazwa_grupy FROM [HD_DATASTAGE].[dbo].[grupy_mediowe_poprawione] 

IF OBJECT_ID('[HD_DATASTAGE].[dbo].[[grupy_mediowe_poprawione]]', 'U') IS NOT NULL 
  DROP TABLE [HD_DATASTAGE].[dbo].[grupy_mediowe_poprawione]; 