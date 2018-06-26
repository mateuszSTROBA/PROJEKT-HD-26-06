

CREATE TABLE [dbo].[nazwa_kanalu_poprawiona](
	[nazwa_kanalu] [varchar](100) NULL,
	[nazwa_c] [varchar](100) NULL,
	[nazwa_h] [varchar](100) NULL)

INSERT INTO kat
SELECT LEFT(CHANNEL_TYM, CHARINDEX('[', CHANNEL_TYM)) AS nazwa_kanalu,REPLACE(SUBSTRING(CHANNEL_TYM, CHARINDEX('[', CHANNEL_TYM), LEN(CHANNEL_TYM)), '[', '')
FROM    DANE_GLOWNE_TYM2
UPDATE [HD_REPOZYTORIUM_GLOWNE].[dbo].nazwa_kanalu_poprawiona
SET nazwa_kanalu = REPLACE (nazwa_kanalu, '[','')
