
SELECT dane.CHANNEL_TYM as nazwa_kanalu, kat.ID, grupy.ID
-- LEFT JOIN oraz LEFT OUTER JOIN oznaczają dokładnie to samo
FROM dbo.kategoria kat RIGHT JOIN dbo.grupy_mediowe grupy ON kat.nazwa_kanalu=grupy.nazwa_kanalu RIGHT JOIN
dbo.DANE_GLOWNE_TYM2 dane ON grupy.nazwa_kanalu=dane.CHANNEL_TYM 

