
USE HD_DATASTAGE
GO
ALTER TABLE dbo.kategorie_data_stage
   ADD Id INT IDENTITY
ALTER TABLE dbo.grupy_docelowe_data_stage
   ADD Id INT IDENTITY
SELECT F1 as nazwa_kanalu,F2 as nazwa_kategorii INTO kategorie_poprawione  FROM kategorie_data_stage;

ALTER TABLE dbo.kategorie_poprawione
   ADD Id INT IDENTITY
   DROP TABLE IF EXISTS kategorie_data_stage
   CREATE TABLE [HD_DATASTAGE].[dbo].kategorie_data_stage (
		id int IDENTITY(1,1),
		nazwa_kanalu VARCHAR(50),
		nazwa_kategorii VARCHAR(50));
   INSERT INTO kategorie_data_stage

SELECT nazwa_kanalu, nazwa_kategorii FROM kategorie_poprawione;

DROP TABLE IF EXISTS [HD_DATASTAGE].[dbo].kategorie_poprawione
