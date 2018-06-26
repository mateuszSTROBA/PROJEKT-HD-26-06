
INSERT INTO FAKTY (GRUPY_DOCELOWE_ID,OPIS_ID,KANAL_ID,KALENDARZ_ID,AMR,[AMR%],[SHR%],[RCH%],RCH)
  select  distinct  gd.ID,op.ID,kan.ID, kal.ID,dg.AMR,dg.[AMR %],dg.[SHR %],dg.[RCH%],dg.RCH
  from DANE_GLOWNE_TYM2 dg left join KALENDARZ kal
  on dg.DATE_TYM=kal.date_time 
  AND dg.start_time2=kal.start_time

  left join KANAL kan ON dg.CHANNEL_TYM=kan.nazwa_kanalu 
  left join GRUPY_DOCELOWE gd ON dg.grupa_charakterystyk = gd.kod_grupy 
  left join OPIS op ON dg.DESCRIPTION_TYM=op.pierwszy_opis AND  dg.ND_DESCRIPTION_TYM=op.drugi_opis
  AND dg.start_time2=op.start_time_opis AND dg.DURATION_TYM=op.duration_opis

 