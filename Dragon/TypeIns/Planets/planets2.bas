10 DIM PI,A,B,C,D,A$,B$,C$,D$:CLEAR800:POKE65495,0
20 A=327.95626
30 B=0
40 C=-258.47927
50 D=-135.14322
60 PI=3.14159
70 PMODE 4, 1: PCLS: SCREEN 1,1
80 FOR S=1 TO 50
90 X=RND(255):Y=RND(191)
100 PSET(X,Y,1)
110 NEXT S
120 DRAW"BM128, 96R2U3L2U3R2BF2D4R2U4BR2ND4R2D4"
130 COLOR0,1:DRAWA$:COLOR1,0:GOSUB 220
140 COLOR0,1:DRAWB$:COLOR1,0:GOSUB 250
150 COLOR0,1:DRAWC$:COLOR1,0:GOSUB 280
160 COLOR0,1:DRAWD$:COLOR1,0:GOSUB 310
170 A=A-0.5240327
180 B=B-0.98561
190 C=C-1.6021291
200 D=D-4.0923507
210 FOR DE=1 TO 40: NEXT : GOTO 120
220 A$="BM" + STR$(INT(128+SIN(A/180*PI)*95))+", "+STR$(INT(96+COS(A/180*PI)*95))+"U6R2ND6R2D6BR2NU2R2U2NL2U2NL2BR2ND4R2BR2NR2D2R2D2L2"
230 DRAW A$
240 RETURN
250 B$="BM" + STR$(INT(128+SIN(B/180*PI)*62.687052))+", "+STR$(INT(96+COS(B/180*PI)*62.687852)) + "NR2U3NR2U3R2BF2R2D2L2D2R2NU2BR2U4R2BR2NU2NR2D4R2BR2U4NU2R2D4"
260 DRAW B$
270 RETURN
280 C$="BM" + STR$(INT(128+SIN(C/180*PI)*45.281938))+", "+STR$(INT(96+COS(C/180*PI)*45.281938)) + "BU2NU4FNDEU2NU2BR2R2D2L2NU2D2R2BR2U4R2ND4BR2D4R2NU4BR2R2U2L2U2R2"
290 DRAW C$
300 RETURN
310 D$="BM" + STR$(INT(128+SIN(D/180*PI)*24.231278))+", "+STR$(INT(96+COS(D/180*PI)*24.231278)) + "U6R2ND6R2D6BR2NR2U4R2D2NL2BR2ND2U2R2BR2NR2D4R2BR2NU4R2NU4BR2U4R2BR2D2R2NU2D2L2"
320 DRAW D$
330 RETURN
