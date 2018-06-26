insert into KALENDARZ (date_time,start_time)
select distinct dane.DATE_TYM,dane.start_time2 from DANE_GLOWNE_TYM2 dane

update KALENDARZ
set KALENDARZ_GODZIN_ID = kg.ID
from (select ID, [hour], [minute], [time]  from KALENDARZ_GODZIN ) kg
where 
DATEPART(hh,KALENDARZ.start_time) =kg.[hour] AND
DATEPART(mi,KALENDARZ.start_time)=kg.[minute]

update KALENDARZ
set KALENDARZ_DATY_ID = kd.ID
from (select ID, [data]  from KALENDARZ_DATY ) kd
where 
KALENDARZ.date_time=kd.[data]
select * from KALENDARZ