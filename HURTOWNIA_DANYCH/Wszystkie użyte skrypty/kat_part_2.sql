DELETE FROM [HD_DATASTAGE].[dbo].kategorie_data_stage
WHERE nazwa_kanalu IS NULL;
UPDATE HD_DATASTAGE.[dbo].kategorie_data_stage
SET nazwa_kanalu =  REPLACE(nazwa_kanalu, SUBSTRING(nazwa_kanalu, charindex('[', nazwa_kanalu), Charindex(']', nazwa_kanalu)), '')   from kategorie_data_stage;