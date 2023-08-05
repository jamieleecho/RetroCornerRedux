1 GOSUB4000
10 PCLEAR4:PMODE4,1:PCLS
15 SCREEN1,1
20 DIM AL(6),BL(6),BO(4)
30 DEF FNZ(X)=SGN(X)*SQR(V*V*X*X/((127-AX)*(127-AX)+(95-AY)*(95-AY)))
40 PW=250
50 FORI=0TO7:READA:POKE1536+I*32,A:NEXTI
60 GET(0,0)-(7,7),AL,G

70 FORJ=0TO4:READA:POKE1536+J*32,A:NEXT
80 GET(0,0)-(4,4),BO,G

90 AX=RND(248)-1:AY=RND(178)+5
100 PCLS
110 CIRCLE(127,95),12,5:DRAW"BM127,95;C5S48NUNLNDNR"

120 DRAW"BM131,87;S4D5BD6BLR3D2L3D2R3BL12R3U2NL3U2NL3BU6U5G4R3"
130 DRAW"BM5,1;L4D2NR4D2BE4BR2D4R3U4BR5L3D2NR3D2R3BE4D4R3"
140 LINE(25,1)-(PW,5),PSET,BF

150 SCREEN1,1
160 IF AF=0 THEN GOSUB2000 ELSE GOSUB3000
170 GOSUB 1000
180 FOR J=1 TO 4
190 PE=PEEK(338+J):IF PW<25 THEN PE=255
200 IF 255-PE<>SH(J) THEN SH(J)=1-SH(J):CIRCLE(127,95),16,5*SH(J),1,(J+2)/4,(J+3)/4
210 IF SH(J)=1 THEN PW=PW-2
220 NEXT
230 LINE(PW,1)-(PW+2,5),PRESET
240 GOTO 160

250 DATA 24,126,90,126,126,195,129,129
260 DATA 32,112,248,112,32

1000 LX=AX:LY=AY
1010 IF RND(10)=1 THEN AX=RND(248)-1:AY=RND(178)+5
1020 AX=AX+RND(15)-8:AY=AY+RND(15)-8
1030 IF AX>103 AND AX<144 AND AY>71 AND AY<112 THEN AX=LX:AY=LY
1040 IF AX<0 THEN AX=-AX
1050 IF AX>248 THEN AX=497-AX
1060 IF AY<6 THEN AY=12-AY
1070 IF AY>184 THEN AY=369-AY
1080 PUT(LX,LY)-(LX+7,LY+7),BL,PSET
1090 PUT(AX,AY)-(AX+7,AY+7),AL,PSET
1100 RETURN

2000 IFRND(7)<>1THENRETURN
2010 V=RND(8)+5:DX=FNZ(127-AX):DY=FNZ(95-AY)
2020 IF DX<=0 AND DY>=0 THEN MA=1:GOTO2050
2030 IF DX<=0 AND DY<=0 THEN MA=2:GOTO2050
2040 IF DX>=0 AND DY<=0 THEN MA=3 ELSE MA=4
2050 MX=AX:MY=AY
2060 PUT(MX,MY)-(MX+4,MY+4),BO,OR
2070 AF=1:RETURN

3000 PUT(MX,MY)-(MX+4,MY+4),BL,PSET
3010 MX=MX+DX:MY=MY+DY
3020 IF MX>110 AND MX<140 AND MY>79 AND MY<108THEN GOTO3050
3030 PUT(MX,MY)-(MX+4,MY+4),BO,OR
3040 RETURN
3050 IF SH(MA)=0 THEN FORD=1TO140STEP5:SCREEN1,RND(2)-1:CIRCLE(127,95),D:NEXT:GOTO 3070
3060 AF=0:RETURN
3070 CLS:PRINT@256,"BANG.. YOUR SHIELDS WERE DOWN!"
3080 END

4000 CLS0:TT$="SPACE STATION":TBY$="FROM INPUT MAGAZINE":TD$="VOLUME 1 NO 5"
4010 TV$="":TC$=CHR$(159):GOSUB 9010
4020 GOSUB9930:GOTO9810
4500 RETURN

9010 TM=LEN(TT$):IF LEN(TBY$)>TM THEN TM=LEN(TBY$)
9015 IF LEN(TV$)>TM THEN TM=LEN(TV$)
9017 IF LEN(TD$)>TM THEN TM=LEN(TD$)
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

