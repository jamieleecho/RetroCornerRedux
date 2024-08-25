10 DIMH(16),I(16),A(1),B(1),C(1),P(1),R(1),M(16,11),N(11),X,Y,V,W,D,J,R,L,S,M,Q
20 DIMC$(27),N$(10):GOSUB1110:REM SET UP TEXT
30 FORI=0TO15:H(I)=I*16:NEXT
40 GOSUB700:REM SET UP GRAPHICS
50 GOSUB820:REM TITLE SCREEN
60 GOSUB570:REM INIT GAME
70 GOSUB600:REM INIT LEVEL
80 PCLS:GOSUB410
90 REM GAME LOOP
100 A$=INKEY$:IFA$="P"THENX=X+1ELSEIFA$="O"THENX=X-1
110 IFA$="Q"THENY=Y-1ELSEIFA$="A"THENY=Y+1
120 J=JOYSTK(0):IFJ=0THENX=X-1ELSEIFJ=63THENX=X+1
130 J=JOYSTK(1):IFJ=0THENY=Y-1ELSEIFJ=63THENY=Y+1
140 IFX<0THENX=0ELSEIFX>15THENX=15
150 IFY<1THENY=1ELSEIFY>11THENY=11
160 GOSUB270
170 IF X=V THEN IF Y=W THEN 190
180 PUT(H(X),H(Y))-(H(X)+15,H(Y)+15),A,PSET:PUT(H(V),H(W))-(H(V)+15,H(W)+15),B,PSET:V=X:W=Y
190 GOSUB240
200 IFM>0THEN100
210 GOSUB910
220 GOTO50
230 REM CHECK LOCATION
240 Z=M(X,Y):IFZ=0THENRETURN
250 ON Z GOSUB320,340,370
260 RETURN
270 REM DRAW SCREEN UPDATES
280 R=RND(11):IF N(R)>0 THEN N(R)=N(R)-1:O=N(R):M(O,R)=1:PUT(H(O),H(R))-(H(O)+15,H(R)+15),R,PSET
290 IFRND(10)=1THENO=2+RND(14):R=1+RND(9):IF O>0 AND M(O,R)=0 THEN M(O,R)=2:PUT(H(O),H(R))-(H(O)+15,H(R)+15),C,PSET
300 RETURN
310 REM BURN
320 SCREEN1,0:PLAY"T255AEAEAAAAEEA":SCREEN1,1:M=M-1:IFM>0THENGOSUB600:LINE(0,16)-(255,192),PRESET,BF:GOSUB400
330 RETURN
340 REM SCORE
350 M(X,Y)=0:S=S+10:GOSUB520:PLAY"T255BCD"
360 RETURN
370 REM PORTAL
380 GOTO70
390 RETURN
400 REM DRAW INTIAL SCREEN
410 LINE(0,15)-(255,15),PSET
420 HP=6:VP=2:O$="LIVES": GOSUB1050
430 HP=84:VP=2:O$="SCORE": GOSUB1050
440 HP=180:VP=2:O$="LEVEL": GOSUB1050
450 PUT(0,H(R))-(15,H(R)+15),P,PSET
460 GOSUB480:GOSUB520:GOSUB550
470 RETURN
480 REM UPDATE LIVES DISPLAY
490 LINE(55,2)-(64,10),PRESET,BF:HP=55:VP=2:N$=MID$(STR$(M),2):GOSUB1080
500 RETURN
510 REM UPDATE SCORE DISPLAY
520 LINE(135,2)-(160,10),PRESET,BF:HP=135:VP=2:N$=MID$(STR$(S),2):GOSUB1080
530 RETURN
540 REM UPDATE LEVEL DISPLAY
550 LINE(231,2)-(240,10),PRESET,BF:HP=231:VP=2:N$=MID$(STR$(L),2):GOSUB1080
560 RETURN
570 REM INIT GAME
580 L=1:S=0:M=3
590 RETURN
600 REM LEVEL SET UP
610 X=5:Y=2:V=1:W=1
620 GOSUB650
630 R=RND(11):M(0,R)=3
640 RETURN
650 REM RESET LEVEL DATA - SCREEN LAYOUT AND LAVA
660 FORJ=0TO16:FORI=0TO11:M(J,I)=0:NEXT:NEXT
670 FORI=0TO11:N(I)=16:NEXT
680 RETURN
690 REM DRAW GFX
700 PMODE0,1:PCLS:SCREEN1,1
710 GET(0,0)-(15,15),B
720 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
730 GET(0,0)-(15,15),A
740 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
750 GET(0,0)-(15,15),R
760 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
770 GET(0,0)-(15,15),C
780 FORL=0TO7:READD:POKE1536+(L*16),D:NEXT
790 GET(0,0)-(15,15),P
800 RETURN
810 REM TITLE SCREEN
820 PCLS:LINE(0,176)-(255,176),PSET:LINE(0,15)-(255,15),PSET
830 HP=80:VP=40:O$="CASH@GRAB":GOSUB1050:PLAY"T255AO3AO2GG"
840 HP=70:VP=180:O$="VERSION":GOSUB1050
850 HP=130:VP=180:N$="0":GOSUB1080
860 HP=142:VP=180:N$="1":GOSUB1080:PSET(138,188,1):PLAY"T255AO3AO2GG"
870 HP=110:VP=60:O$="BY":GOSUB1050
880 HP=70:VP=80:O$="DAVY@MITCHELL":GOSUB1050:PLAY"T255AO3AO2GG"
890 FORD=1TO4000:NEXT
900 RETURN
910 REM GAME OVER SCREEN
920 PCLS
930 HP=91:VP=40:O$="GAME@OVER": GOSUB1050
940 FORD=1TO4000:NEXT
950 RETURN
960 REM STICK MAN
970 DATA24,60,24,126,24,24,36,66
980 REM LAVA
990 DATA97,95,204,32,244,31,120,30
1000 REM CASH
1010 DATA0,0,60,24,60,126,126,60
1020 REM PORTAL
1030 DATA126,129,189,165,165,189,129,126
1040 REM DISPLAY TEXT
1050 FORQ=1TOLEN(O$):DRAW"BM"+STR$(HP)+","+STR$(VP)+";"+C$(ASC(MID$(O$,Q,1))-64):HP=HP+8:NEXT
1060 RETURN
1070 REM DISPLAY NUMBERS
1080 FORQ=1TOLEN(N$):DRAW"BM"+STR$(HP)+","+STR$(VP)+";"+N$(ASC(MID$(N$,Q,1))-48):HP=HP+8:NEXT
1090 RETURN
1100 REM LETTER DATA
1110 C$(1)="D8U8R4D4L4R4D4"
1120 C$(2)="R5D8L5U8D4R4"
1130 C$(3)="R4L4D8R4"
1140 C$(4)="D8R3E1U6M-4,-1"
1150 C$(5)="R4L4D4R4L4D4R4"
1160 C$(6)="R4L4D4R4L4D4"
1170 C$(7)="R4L4D8R4U4"
1180 C$(8)="D8U4R4U4D8"
1190 C$(9)="R4L2D8R2L4"
1200 C$(10)="R4L2D8L2"
1210 C$(11)="D8U4M+4,-4M-4,+4M+4,+4"
1220 C$(12)="D8R4"
1230 C$(13)="D8U8M+2,+2M+2,-2D8"
1240 C$(14)="D8U8M+5,+8U8"
1250 C$(15)="D8R4U8L4"
1260 C$(16)="D8U8R4D4L4"
1270 C$(17)="D6R4D2U8L4"
1280 C$(18)="D8U8R4D4L4F4"
1290 C$(19)="R5L5D4R4D4L4"
1300 C$(20)="R4L2D8"
1310 C$(21)="D8R4U8"
1320 C$(22)="D6F2E2U6"
1330 C$(23)="D6F2E2U6D6F2E2U6"
1340 C$(24)="M+4,+8BM+0,-8M-4,+8"
1350 C$(25)="D4R4U4D4L2D4"
1360 C$(26)="R4D2G2G2D2R4"
1370 REM NUMBERS
1380 N$(0)="D8R4U8L4"
1390 N$(1)="BM+2,+0D8"
1400 N$(2)="D2U2R4D4G4R4"
1410 N$(3)="R4D4L4R4D4L4"
1420 N$(4)="D4R4U4D8"
1430 N$(5)="R4L4D4R4D4L4"
1440 N$(6)="R4L4D4R4D4L4U4"
1450 N$(7)="R4D8"
1460 N$(8)="R4D8L4U8D4R4"
1470 N$(9)="R4D8U4L4U4"
1480 RETURN
1490 REM