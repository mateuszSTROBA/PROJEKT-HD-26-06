WHILE EXISTS(select NULL from sys.databases where name='HD_REPOZYTORIUM_GLOWNE')
BEGIN
    DECLARE @SQL varchar(max)
    SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
    FROM MASTER..SysProcesses
    WHERE DBId = DB_ID(N'HD_REPOZYTORIUM_GLOWNE') AND SPId <> @@SPId
    EXEC(@SQL)
    DROP DATABASE [HD_REPOZYTORIUM_GLOWNE]
END
GO

