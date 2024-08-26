10 DIMH(16),I(16),A(1),B(1),C(1),P(1),R(1),M(16,11),N(11),X,Y,V,W,D,J,R,L,S,M,Q,HP,VP
20 DIMC$(27),N$(10):GOSUB1140:REM SET UP TEXT
30 FORI=0TO15:H(I)=I*16:NEXT
40 GOSUB730:REM SET UP GRAPHICS
50 GOSUB850:REM TITLE SCREEN
60 GOSUB600:REM INIT GAME
70 GOSUB630:REM INIT LEVEL
80 PCLS:GOSUB410
90 REM GAME LOOP
100 A$=INKEY$:IFA$="P"THENX=X+1ELSEIFA$="O"THENX=X-1
110 IFA$="Q"THENY=Y-1ELSEIFA$="A"THENY=Y+1
120 J=JOYSTK(0):IFJ=0THENX=X-1ELSEIFJ=63THENX=X+1
130 J=JOYSTK(1):IFJ=0THENY=Y-1ELSEIFJ=63THENY=Y+1
140 IFX<0THENX=0ELSEIFX>15THENX=15
150 IFY<1THENY=1ELSEIFY>11THENY=11
160 GOSUB250
170 IF X=V THEN IF Y=W THEN 190
180 PUT(H(X),H(Y))-(H(X)+15,H(Y)+15),A,PSET:PUT(H(V),H(W))-(H(V)+15,H(W)+15),B,PSET:V=X:W=Y
190 GOSUB220:IFM>0THEN100
200 GOSUB940:GOTO50
210 REM CHECK LOCATION
220 Z=M(X,Y):IFZ=0THENRETURN
230 ON Z GOSUB300,330,360
240 RETURN
250 REM DRAW SCREEN UPDATES
260 R=RND(11):IF N(R)>0 THEN N(R)=N(R)-1:O=N(R):M(O,R)=1:PUT(H(O),H(R))-(H(O)+15,H(R)+15),R,PSET
270 IFRND(10)=1THENO=2+RND(14):R=1+RND(9):IF H(O)>0 AND M(O,R)=0 THEN M(O,R)=2:PUT(H(O),H(R))-(H(O)+15,H(R)+15),C,PSET
280 RETURN
290 REM BURN
300 SCREEN1,0:PLAY"T255AEAEAAAAEEA":SCREEN1,1:M=M-1:IFM>0THENGOSUB630
310 GOSUB570:GOSUB400
320 RETURN
330 REM SCORE
340 M(X,Y)=0:S=S+10+X:GOSUB520:PLAY"T255BCD"
350 RETURN
360 REM PORTAL AND NEXT LEVEL
370 L=L+1:PLAY"T30ACEG":GOSUB570
380 GOSUB540:GOSUB640:PUT(0,H(R))-(15,H(R)+15),P,PSET
390 RETURN
400 REM DRAW INTIAL SCREEN
410 LINE(0,15)-(255,15),PSET
420 HP=6:VP=2:O$="LIVES": GOSUB1080
430 HP=84:VP=2:O$="SCORE": GOSUB1080
440 HP=180:VP=2:O$="LEVEL": GOSUB1080
450 PUT(0,H(R))-(15,H(R)+15),P,PSET
460 GOSUB480:GOSUB520:GOSUB540
470 RETURN
480 REM UPDATE LIVES DISPLAY
490 LINE(55,2)-(64,10),PRESET,BF:HP=55:VP=2:N$=MID$(STR$(M),2):GOSUB1110
500 RETURN
510 REM UPDATE SCORE DISPLAY
520 LINE(135,2)-(160,10),PRESET,BF:HP=135:VP=2:N$=MID$(STR$(S),2):FORQ=1TOLEN(N$):DRAW"BM"+STR$(HP)+",2"+N$(ASC(MID$(N$,Q,1))-48):HP=HP+8:NEXT:RETURN
530 REM UPDATE LEVEL DISPLAY
540 LINE(231,2)-(240,10),PRESET,BF:HP=231:VP=2:N$=MID$(STR$(L),2):GOSUB1110
550 RETURN
560 REM CLEAR PLAYFIELD
570 FORCL=16TO192STEP32:LINE(0,CL)-(255,CL+16),PRESET,BF:PLAY"T200BAAA":NEXT
580 FORCL=32TO192STEP32:LINE(0,CL)-(255,CL+16),PRESET,BF:PLAY"T200ABBB":NEXT
590 RETURN
600 REM INIT GAME
610 L=1:S=0:M=3
620 RETURN
630 REM LEVEL SET UP
640 X=5:Y=2:V=1:W=1
650 GOSUB680
660 R=RND(11):M(0,R)=3
670 RETURN
680 REM RESET LEVEL DATA - SCREEN LAYOUT AND LAVA
690 FORJ=0TO16:FORI=0TO11:M(J,I)=0:NEXT:NEXT
700 FORI=0TO11:N(I)=16:NEXT
710 RETURN
720 REM DRAW GFX
730 PMODE0,1:PCLS:SCREEN1,1
740 GET(0,0)-(15,15),B
750 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
760 GET(0,0)-(15,15),A
770 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
780 GET(0,0)-(15,15),R
790 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
800 GET(0,0)-(15,15),C
810 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
820 GET(0,0)-(15,15),P
830 RETURN
840 REM TITLE SCREEN
850 PCLS:LINE(0,176)-(255,176),PSET:LINE(0,15)-(255,15),PSET
860 HP=80:VP=40:O$="CASH@GRAB":GOSUB1080:PLAY"T255AO3AO2GG"
870 HP=70:VP=180:O$="VERSION":GOSUB1080
880 HP=130:VP=180:N$="0":GOSUB1110
890 HP=142:VP=180:N$="1":GOSUB1110:PSET(138,188,1):PLAY"T255AO3AO2GG"
900 HP=110:VP=60:O$="BY":GOSUB1080
910 HP=70:VP=80:O$="DAVY@MITCHELL":GOSUB1080:PLAY"T255AO3AO2GG"
920 FORD=1TO4000:NEXT
930 RETURN
940 REM GAME OVER SCREEN
950 PCLS
960 HP=91:VP=40:O$="GAME@OVER": GOSUB1080
970 FORD=1TO4000:NEXT
980 RETURN
990 REM STICK MAN
1000 DATA24,60,24,126,24,24,36,66
1010 REM LAVA
1020 DATA97,95,204,32,244,31,120,30
1030 REM CASH
1040 DATA0,0,60,24,60,126,126,60
1050 REM PORTAL
1060 DATA126,129,189,165,165,189,129,126
1070 REM DISPLAY TEXT
1080 FORQ=1TOLEN(O$):DRAW"BM"+STR$(HP)+","+STR$(VP)+";"+C$(ASC(MID$(O$,Q,1))-64):HP=HP+8:NEXT
1090 RETURN
1100 REM DISPLAY NUMBERS
1110 FORQ=1TOLEN(N$):DRAW"BM"+STR$(HP)+","+STR$(VP)+";"+N$(ASC(MID$(N$,Q,1))-48):HP=HP+8:NEXT
1120 RETURN
1130 REM LETTER DATA
1140 C$(1)="D8U8R4D4L4R4D4"
1150 C$(2)="R5D8L5U8D4R4"
1160 C$(3)="R4L4D8R4"
1170 C$(4)="D8R3E1U6M-4,-1"
1180 C$(5)="R4L4D4R4L4D4R4"
1190 C$(6)="R4L4D4R4L4D4"
1200 C$(7)="R4L4D8R4U4"
1210 C$(8)="D8U4R4U4D8"
1220 C$(9)="R4L2D8R2L4"
1230 C$(10)="R4L2D8L2"
1240 C$(11)="D8U4M+4,-4M-4,+4M+4,+4"
1250 C$(12)="D8R4"
1260 C$(13)="D8U8M+2,+2M+2,-2D8"
1270 C$(14)="D8U8M+5,+8U8"
1280 C$(15)="D8R4U8L4"
1290 C$(16)="D8U8R4D4L4"
1300 C$(17)="D6R4D2U8L4"
1310 C$(18)="D8U8R4D4L4F4"
1320 C$(19)="R5L5D4R4D4L4"
1330 C$(20)="R4L2D8"
1340 C$(21)="D8R4U8"
1350 C$(22)="D6F2E2U6"
1360 C$(23)="D6F2E2U6D6F2E2U6"
1370 C$(24)="M+4,+8BM+0,-8M-4,+8"
1380 C$(25)="D4R4U4D4L2D4"
1390 C$(26)="R4D2G2G2D2R4"
1400 REM NUMBERS
1410 N$(0)="D8R4U8L4"
1420 N$(1)="BM+2,+0D8"
1430 N$(2)="D2U2R4D4G4R4"
1440 N$(3)="R4D4L4R4D4L4"
1450 N$(4)="D4R4U4D8"
1460 N$(5)="R4L4D4R4D4L4"
1470 N$(6)="R4L4D4R4D4L4U4"
1480 N$(7)="R4D8"
1490 N$(8)="R4D8L4U8D4R4"
1500 N$(9)="R4D8U4L4U4"
1510 RETURN
1520 REM