CREATE TABLE [dbo].[kategoria_data_stage_poprawione](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nazwa_kanalu] [varchar](50) NULL,
	[nazwa_kategorii] [varchar](50) NULL
) ON [PRIMARY]
GO
insert into kategoria_data_stage_poprawione
SELECT  REPLACE(nazwa_kanalu, SUBSTRING(nazwa_kanalu, charindex('[', nazwa_kanalu), Charindex(']', nazwa_kanalu)), '') AS nazwa_kanalu, nazwa_kategorii   from kategorie_data_stage;