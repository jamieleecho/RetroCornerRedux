110 GOSUB 1100 
120 PRINT ".......ZOMBIES"
130 T=2:GOSUB 1400:GOSUB 2800 
140 PRINT: PRINT " ******************"
150 FOR I=1 TO 13: PRINT " *................*" : NEXT I
160 PRINT " ******************";
170 DIM Q(8,2) 
180 DIM Z(4,2) 
190 FOR I=1 TO 4:N=14:GOSUB 1300: Z(I,1)=R+1: N=13: GOSUB 1300: Z(I,2)=R+1 
200 X=Z(I,1): Y=Z(I,2): GOSUB 1700: PRINT "Z"; 
210 NEXT I 
220 FOR I=1 TO 8: N=15:GOSUB 1300: Q(I,1)=R+1: N=13: GOSUB 1300:Q(I,2)=R+1 
230 X=Q(I,1): Y=Q(I,2): GOSUB 1700: PRINT "*";
240 NEXT I 
250 N=15:GOSUB 1300:A=R+1: N=13: GOSUB 1300: B=R+1: X=A: Y=B 
260 GOSUB 1700: PRINT "H"; :N=4 
270 GOSUB 1500: GOSUB 3100: G=GG-48: IF G<1 OR G>9 THEN 270 
280 X=A:Y=B:GOSUB 1700: PRINT "."; 
290 D=INT((G-4)/3) :C=G-3*D-5:A=A+C:B=B+D 
300 IF A=1 OR A=18 OR B=0 OR B=15 THEN 320 
310 GOTO 330 
320 M$="YOU'RE.IN.THE.SWAMP": GOTO 480 
330 F=0: FOR I=1 TO 8: IF A=Q(I,1) AND B=Q(I,2) THEN F=1 
340 NEXT I: IF F=1 THEN M$="YOU'RE.IN.QUICKSAND": IF F=1 THEN 480 
350 FOR I=1 TO 4: IF A=Z(I, 1) AND B=Z(I,2) THEN F=1 
360 NEXT I: IF F=1 THEN M$="YOU'RE.CAUGHT!": IF F=1 THEN 480 
370 X=A: Y=B:GOSUB 1700: PRINT "H";: Z=50:GOSUB 2400: T=0.5:GOSUB 1400
380 FOR I=1 TO 4: IF Z(I,1)=0 THEN 460 
390 T=0.5: GOSUB 1400: X=Z(I,1): Y=Z(I,2): GOSUB 1700: PRINT ".";:F=0 
400 X=X+SGN(A-X): Y=Y+SGN(B-Y): F=0: FOR J=1 TO 8: IF X=Q(J, 1) AND Y=Q(J,2) THEN F=1 
410 NEXT J: IF F<>1 THEN 430 
420 N=N-1: Z(I,1)=0: Z=35: GOSUB 2400: GOTO 460 
430 GOSUB 1700: PRINT "Z";:Z(I,1)=X: Z(I,2)=Y: Z=20:GOSUB 2400 
440 IF X=A AND Y=B THEN M$="CAUGHT!": GOTO 480 
450 GOSUB 1700: PRINT "Z";:Z(I,1)=X: Z(I,2)=Y 
460 NEXT I: IF N>O THEN 270 
470 M$="YOU'VE.MADE.IT.!" 
480 X=1:Y=15:GOSUB 1700: PRINT M$; 
490 T=4:GOSUB 1400:GOSUB 2800: PRINT: PRINT: STOP

1000 REM DRAGON SUBROUTINES 
1100 W=32: D=16: F=8:GOSUB 1200: RETURN 
1200 CLS: PRINT @ 256,"";: RETURN 
1300 R=RND(N): RETURN 
1400 FOR Z=1 TO 650*T: NEXT Z:RETURN 
1500 G$=INKEY$: IF G$="" THEN 1500 
1510 RETURN 
1600 K$=INKEY$: RETURN 
1700 PRINT @32*Y+X, "";: RETURN 
1800 PRINT TAB(X); : RETURN 
1900 PRINT CHR$(94);: RETURN 
2000 PRINT CHR$(9); : RETURN 
2100 INPUT K: RETURN 
2200 INPUT K$: RETURN 
2300 CLS: RETURN 
2400 SOUND Z, 1: RETURN 
2500 R$=CHR$(R+64): RETURN 
2600 P$=MID$(K$, P, 1): RETURN 
2700 GOSUB 2600: A=ASC(P$) : RETURN 
2800 CLS: RETURN 
2900 DIM V$(26): RETURN 
3000 DIM W$(60): RETURN 
3100 GG=ASC(G$): RETURN

