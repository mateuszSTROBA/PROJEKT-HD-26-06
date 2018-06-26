WHILE EXISTS(select NULL from sys.databases where name='HDRepozytoriumGlowne')
BEGIN
    DECLARE @SQL varchar(max)
    SELECT @SQL = COALESCE(@SQL,'') + 'Kill ' + Convert(varchar, SPId) + ';'
    FROM MASTER..SysProcesses
    WHERE DBId = DB_ID(N'HDRepozytoriumGlowne') AND SPId <> @@SPId
    EXEC(@SQL)
    DROP DATABASE [HDRepozytoriumGlowne]
END
GO

