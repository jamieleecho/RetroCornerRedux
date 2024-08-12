
5 CLEAR1000
10 DIM S,X,Y,C$,P,P(7,7),G(7,7),S(7,7),M,LE,LY$(10):GOSUB5000
15 FOR BR=1TO31:W$=W$+CHR$(128):NEXT
20 LE=10
30 CLS0:TT$="FLIPPING BITS":TBY$="BY DAVY MITCHELL":TD$="MC-10 PORT AUG 2024"
40 TV$="WWW.ROSETTACODE.ORG":TC$=CHR$(159):GOSUB 9010
50 GOSUB9930
60 L=RND(-TIMER)

100 REM GAME STATE
105 CLS0:GOSUB1000:REM UPDATE STATUS
110 T$="flipping"+CHR$(128)+"bits":TL=0:GOSUB9600
111 L=69:PRINT@L,"board";:PRINT@L+15,"target";
113 BC$=CHR$(255):BX=3:BY=2:BH=10:BW=10:GOSUB9400
114 BC$=CHR$(159):BX=18:BY=2:BH=10:BW=10:GOSUB9400

115 P=3+2+((2+2)*32)
120 PRINT@P-1,"/1234567";
130 PRINT@P+14,"/1234567";
140 PRINT@P+31,"A";:PRINT@P+14+32,"A";
141 PRINT@P+63,"B";:PRINT@P+14+64,"B";
142 PRINT@P+95,"C";:PRINT@P+14+96,"C";
143 PRINT@P+127,"D";:PRINT@P+14+128,"D";
144 PRINT@P+159,"E";:PRINT@P+14+160,"E";
145 PRINT@P+191,"F";:PRINT@P+14+192,"F";
146 PRINT@P+223,"G";:PRINT@P+14+224,"G";

170 GOSUB 800:REM CREATE TARGET
176 GOSUB 900:REM CREATE STARTING POINT
178 PRINT@480,W$;
180 S=132:GOSUB 300
190 S=147:GOSUB 350

200 A$=INKEY$:IFA$=""THEN 200
210 C=VAL(A$):DU=RND(C):IF C>0 AND C<8 THEN GOSUB450:GOTO230
215 R=ASC(A$):IF R>64 AND R<72 THEN R=R-64:GOSUB400:GOTO230
220 IF R=82 THEN GOSUB700:GOTO230
225 GOTO 200
230 M=M+1:S=132:GOSUB300:T$="checking":L=15:GOSUB9600:GOSUB1000:GOSUB650
240 IF W=1 THEN T$="well"+CHR$(128)+"done":TL=15:GOSUB9600:GOSUB9700:LE=LE+1:M=0:W=0:?@480,W$;:GOSUB1000:GOTO170
250 W=0:?@480,W$;

298 GOTO 200
299 GOSUB 9900

300 REM DISPLAY GAME BOARD
305 FOR Y=1TO7
310 FOR X=1TO7
315 IF P(X,Y)=0 THEN PRINT@S+Y*32+X,CHR$(128);:GOTO320
316 PRINT@S+Y*32+X,CHR$(207);
320 NEXT:NEXT
340 RETURN

350 REM DISPLAY TARGET BOARD
355 FOR Y=1TO7
360 FOR X=1TO7
370 IF G(X,Y)=0 THEN PRINT@S+Y*32+X,CHR$(128);:GOTO380
371 PRINT@S+Y*32+X,CHR$(207);
380 NEXT:NEXT
390 RETURN

400 REM INVERT A ROW
410 FOR X=1TO7
415 IF P(X,R)=0 THEN P(X,R)=1:GOTO420
416 P(X,R)=0
420 NEXT
440 RETURN

450 REM INVERT A COLUMN
455 FOR Y=1TO7
465 IF P(C,Y)=0 THEN P(C,Y)=1:GOTO470
466 P(C,Y)=0
470 NEXT
480 RETURN

650 REM CHECK FOR A WIN
655 W=0:FOR Y=1TO7
660 FOR X=1TO7
670 IF G(X,Y)<>P(X,Y) THEN 690
680 NEXT:NEXT:W=1
690 RETURN

700 REM RESTORE STARTING POINT
710 FOR Y=1TO7
720 FOR X=1TO7
730 P(X,Y)=S(X,Y)
740 NEXT:NEXT
750 RETURN

800 REM CREATE TARGET
810 T$="please"+CHR$(128)+"wait":TL=15:GOSUB9600
815 IF LE>9 THEN GOSUB 1200:RETURN
820 BR=1
830 FOR Y=1TO7
840 FOR X=1TO7
850 G(X,Y)=VAL(MID$(LY$(LE),BR,1))
860 BR=BR+1
870 NEXT:NEXT
890 RETURN

900 REM CREATE STARTING POINT
910 FOR Y=1TO7
920 FOR X=1TO7
930 P(X,Y)=G(X,Y)
940 NEXT:NEXT
945 FOR MU=1TOLE+3
950 C=RND(7):GOSUB 450
960 R=RND(7):GOSUB 400
970 NEXT
980 FOR Y=1TO7:FOR X=1TO7:S(X,Y)=P(X,Y):NEXT:NEXT
990 RETURN

1000 REM UPDATE STATUS
1010 PRINT@448,W$;:
1020 PRINT@451,"level"+STR$(LE);:?@456,CHR$(128);
1030 PRINT@467,"moves"+STR$(M);:?@472,CHR$(128);
1090 RETURN

1200 REM CREATE RANDOM PATTERN.
1210 FOR Y=1TO7
1220 FOR X=1TO7
1230 G(X,Y)=0
1240 NEXT:NEXT
1310 N=10+RND(15)
1320 FORX=1TON
1330 G(RND(7),RND(7))=1
1340 NEXT
1350 RETURN

5000 REM DATA FOR TARGET PATTERNS.
5010 LY$(1)="0000000010001000000000000000000000001000100000000"
5020 LY$(2)="0000000011111000000000000000000000001111100000000"
5030 LY$(3)="0000000011111001000100100010010001001111100000000"
5040 LY$(4)="1000001010001000101000001000001010001000101000001"
5050 LY$(5)="0000000110001100000001100011000000011000110000000"
5060 LY$(6)="1010101010101010101010101010101010101010101010101"
5070 LY$(7)="1111111111111100000000101010111111111111110000000"
5080 LY$(8)="0001000001110000111001111111001110000111000001000"
5090 LY$(9)="1111111100100110010011001001100100110010011111111"
5900 RETURN
5998 END
5999 REM ------LIBRARY LIVES HERE------

9000 REM TITLE SCREEN
9001 REM TT$ = PROGRAM NAME
9002 REM TBY$ = AUTHOR
9003 REM TD$ = DATE
9004 REM TV$ = VERSION
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

9200 REM VERTICAL LINE
9201 REM LC$ = CHARACTER FOR LINE
9202 REM LX,LY = POSITION 
9203 REM LL = LENGTH
9210 LZ=LY+LL-1
9220 FOR BR=LY TO LZ:?@LX+(BR*32),LC$;:NEXT
9240 RETURN

9300 REM HORIZONTAL LINE
9301 REM LC$ = CHARACTER FOR LINE
9302 REM LX,LY = POSITION 
9304 REM LL = LENGTH
9310 LO$=""
9320 FOR BR=1TOLL:LO$=LO$+LC$:NEXT
9330 ?@LX+(LY*32),LO$;
9340 RETURN

9400 REM BOX OUTLINE
9403 REM BX,BY = BOX POSITION
9404 REM BH,BW = BOX HEIGHT & WIDTH
9405 REM BC$ = CHARACTER FOR BOX EDGE
9410 BR$="":FOR BR=1TOBW:BR$=BR$+BC$:NEXT
9420 ?@BX+((BY+1)*32),BR$;
9430 ?@BX+((BY+BH)*32),BR$;
9440 BH=BH-1:BY=BY+1:BW=BW-1
9450 FOR BQ=1TOBH:?@BX+((BY+BQ)*32),BC$;:?@BX+BW+((BY+BQ)*32),BC$;:NEXT
9460 RETURN

9500 REM FILLED BOX
9503 REM BX,BY = BOX POSITION
9504 REM BH,BW = BOX HEIGHT & WIDTH
9505 REM BC$ = CHARACTER FOR BOX
9510 BR$="":FOR BR=1TOBW:BR$=BR$+BC$:NEXT
9530 FOR BQ=1TOBH:?@BX+((BY-1+BQ)*32),BR$;:NEXT
9540 RETURN

9600 REM CENTER TEXT. TL = vertical line number.
9610 PRINT@(32-LEN(T$))/2+32*TL,T$;
9620 RETURN

9700 REM DELAY
9710 FORDZ=1TO1000:NEXT:RETURN

9800 REM WAIT FOR ANY KEY
9810 WA$=INKEY$:IF WA$="" THEN 9810
9820 RETURN

9900 REM ANY KEY PROMPT AT BOTTOM OF SCREEN.
9910 ?@483,"PRESS ANY KEY TO CONTINUE";:GOSUB9810:RETURN

9920 REM INVERTED ANY KEY PROMPT AT BOTTOM OF SCREEN.
9930 BC$=CHR$(128):?@483,"press"+BC$+"any"+BC$+"key"+BC$+"to"+BC$+"continue";:GOSUB9810:RETURN

9950 REM LOWER CASE TEXT
9960 TL=LEN(T$):O$=""
9970 FORBR=1TOTL:C$=MID$(T$,BR,1):BH=ASC(C$):IF BH<91 AND BH>64 THEN C$=CHR$(BH+32)
9971 IFBH=32THENC$=CHR$(128)
9975 O$=O$+C$
9979 NEXT
9980 T$=O$
9999 RETURN
