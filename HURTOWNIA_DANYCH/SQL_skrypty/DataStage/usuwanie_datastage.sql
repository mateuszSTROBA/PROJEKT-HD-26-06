WHILE EXISTS(select NULL from sys.databases where name='HD_DATASTAGE')
BEGIN
    DECLARE @SQL varchar(max)
    SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
    FROM MASTER..SysProcesses
    WHERE DBId = DB_ID(N'HD_DATASTAGE') AND SPId <> @@SPId
    EXEC(@SQL)
    DROP DATABASE [HD_DATASTAGE]
END
GO

