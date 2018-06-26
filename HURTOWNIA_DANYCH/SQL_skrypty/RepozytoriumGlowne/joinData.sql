INSERT INTO Fact(DescriptionID,ChannelID,DateTimeID,[Total Individuals],[Podgrupa],[A16-49],[M16-49],[A4-15],[A4-9])

SELECT a.[Descriptions.ID],a.[Channel.ID],b.ID,a.TOTAL_INDIVIDUALS_TYM,a.PODGRUPA_TYM,a.A1649_TYM,a.M1649_TYM,a.A415_TYM,a.A49_TYM
 FROM TableTemp as a JOIN DateTime as b 
ON a.DATE_TYM + CONVERT(datetime,a.start_time2) <= b.DateTime
AND b.DateTime <= a.DATE_TYM + CONVERT(datetime,a.start_time2) + CONVERT(datetime,a.DURATION_TYM)

