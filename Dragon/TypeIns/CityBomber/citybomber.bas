5 GOSUB 2000
10 CLS 3 : PRINT @233, "CITY BOMBER";
20 PRINT @419,"   SELECT SKILL LEVEL   ";
30 PRINT @419, "(1-HARD 2-MEDIUM 3-EASY)";
40 SKILL = VAL(INKEY$):IF SKILL<1 OR SKILL >3 THEN 40
50 GOSUB 1000
100 FOR LEVEL = 0 TO 14 : FOR TRY = 1 TO SKILL
110 FOR CLM = 0 TO 31
120 PPOS = LEVEL*32 +CLM
130 IF PEEK(1024+PPOS)<>175 THEN 500
140 PRINT @PPOS,A1$;:IF CLM>0 THEN PRINT @PPOS-1,A2$;:IF CLM>1 THEN PRINT @PPOS-2,A3$;:IF CLM>2 THEN PRINT @PPOS-3,CHR$(175);
150 IF BPOS<>0 THEN PRINT @BPOS,CHR$(175);:BPOS=BPOS+32:IF BPOS>479 THEN BPOS=0
160 IF BPOS=0 AND LEVEL<15 AND INKEY$<>"" THEN BPOS=PPOS+32
170 IF BPOS<>0 THEN PRINT @BPOS,"*";
180 IF LEVEL=14 THEN FOR W=1 TO CLM*10:NEXTW
190 NEXT CLM
200 PRINT @PPOS-2,STRING$(3,175);
210 IF BPOS=0 THEN 240 ELSE PRINT @BPOS,CHR$(175);
220 IF BPOS<448 THEN BPOS=BPOS+32:PRINT @BPOS,"*"; ELSE BPOS=0
230 FOR DLY=1 TO 25:NEXT
240 FOR W=1472 TO 1503:IF PEEK(W)<>175 THEN 250 ELSE NEXT W:TRY = SKILL+1:GOTO250
250 REM FOR DLY=1TO1000:NEXT
260 IF LEVEL=14 THEN TRY=SKILL+1
270 NEXT TRY
280 NEXT LEVEL
300 FOR J=1 TO 5
310 CLS RND(4)
320 PRINT @234,"WELL DONE";
330 FOR W=1TO250:NEXT W
340 NEXT J:GOTO 10
500 FOR J=1 TO 10
510 CLS RND(4)
520 PRINT @237,"CRASH";
530 FOR W=1TO250:NEXT W
540 NEXT J:GOTO10
1000 CLS 3
1010 PRINT @ 480,STRING$(32,175);
1020 FOR BDG = 4 TO 31
1030 BCOL = 16
1040 ROOF = RND(8) + 6
1050 FOR J = 14 TO ROOF STEP-1
1060 PRINT @J*32 + BDG,CHR$(143+BCOL);
1070 NEXT J
1080 NEXT BDG
1090 A1$=CHR$(172):A2$=CHR$(168):A3$=CHR$(166)
1100 RETURN

2000 CLS0:TT$="CITY BOMBER":TBY$="JOHN SHARP & DAVID BOLTON":TD$="BOOK TYPE-IN"
2010 TV$="THE POWER OF THE DRAGON":TC$=CHR$(175):GOSUB 9010
2020 GOSUB9930:GOTO9810
2500 RETURN

9010 TM=LEN(TT$):IF LEN(TBY$)>TM THEN TM=LEN(TBY$)
9020 BH=7:BW=TM+2:BY=3:BX=(30-BW)/2+1:BC$=CHR$(143):GOSUB9510
9030 BH=9:BW=TM+4:BY=1:BX=(32-BW)/2:BC$=TC$:GOSUB9410
9040 ?@(BY+1)*32 + ((32-LEN(TT$))/2),TT$;
9050 ?@(BY+3)*32 + ((32-LEN(TBY$))/2),TBY$;
9060 ?@(BY+5)*32 + ((32-LEN(TD$))/2),TD$;
9070 ?@(BY+7)*32 + ((32-LEN(TV$))/2),TV$;
9100 RETURN

9410 BR$=""
9420 BR$=STRING$(BW,BC$)
9430 ?@BX+((BY+1)*32),BR$;
9435 ?@BX+((BY+BH)*32),BR$;
9437 BH=BH-1:BY=BY+1:BW=BW-1
9440 FOR BQ=1TOBH:?@BX+((BY+BQ)*32),BC$;:?@BX+BW+((BY+BQ)*32),BC$;:NEXT
9499 RETURN

9510 BR$=""
9520 FOR BR=1TOBW:BR$=BR$+BC$:NEXT
9530 FOR BQ=1TOBH:?@BX+((BY-1+BQ)*32),BR$;:NEXT
9599 RETURN

9810 WA$=INKEY$:IF WA$="" THEN 9810
9820 RETURN

9930 BC$=CHR$(128):?@483,"press"+BC$+"any"+BC$+"key"+BC$+"to"+BC$+"continue";:GOSUB9810:RETURN
