
 DROP TABLE IF EXISTS [HD_DATASTAGE].[dbo].[kategorie_poprawione]; 

CREATE TABLE [HD_DATASTAGE].[dbo].[kategorie_poprawione] (
id int IDENTITY(1,1),
nazwa_kanalu VARCHAR(50),
nazwa_kategorii VARCHAR(50));


DECLARE kursor CURSOR FOR
SELECT [F1],
       [F2]
  FROM [HD_DATASTAGE].[dbo].[kategorie_data_stage]
  DECLARE @F1 VARCHAR(50)
	DECLARE @F2 VARCHAR(50)
  
  
  OPEN kursor 
  
FETCH NEXT FROM kursor INTO @F1, @F2
WHILE @@FETCH_STATUS = 0 
   BEGIN 
	  IF @F1 IS  NULL
    DELETE FROM [kategorie_poprawione] WHERE CURRENT OF KURSOR
		  ELSE 
	  INSERT INTO [HD_DATASTAGE].[dbo].[kategorie_poprawione] (nazwa_kanalu, nazwa_kategorii)
		VALUES (@F1, @F2);
      FETCH NEXT FROM kursor INTO @F1, @F2 
	
	  
   END 
CLOSE kursor 
DEALLOCATE kursor

  DROP TABLE IF EXISTS [HD_DATASTAGE].[dbo].[kategorie_data_stage]; 

CREATE TABLE [HD_DATASTAGE].[dbo].[kategorie_data_stage] (
id int IDENTITY(1,1),
nazwa_kanalu VARCHAR(50),
nazwa_kategorii VARCHAR(50));

INSERT INTO [HD_DATASTAGE].[dbo].[kategorie_data_stage] (nazwa_kanalu, nazwa_kategorii)
SELECT nazwa_kanalu, nazwa_kategorii FROM [HD_DATASTAGE].[dbo].[kategorie_poprawione] 

  DROP TABLE IF EXISTS [HD_DATASTAGE].[dbo].[kategorie_poprawione]; 