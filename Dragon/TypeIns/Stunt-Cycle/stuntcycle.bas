1 REM *** DRAGON VERSION ***
100 'STUNT CYCLE BY PAUL STANLEY REWRITTEN FOR THE DRAGON 32 BY E.A.JACKSON 
105 DIM C(42), R(16), S(16), T(16), U(16), Z(10)
110 GOSUB 395: GOSUB415: GOSUB135 
115 PRINT@486, "PRESS spacebar TO PLAY";
120 A$=INKEY$: IF A$<>CHR$ (32) THEN 120
125 GOTO 200
130 'SCREEN DISPLAY
135 PCLS: DRAW"C2;BM0,25;R250;D4;L250;U4":PAINT(2,27),2,2
140 DRAW "C2; BM0, 100; R250; D4; L250; U4": PAINT (2,102), 2, 2
145 DRAW"C2; BM0, 177; R250; D4; L250; U4": PAINT(2,179),2,2
150 DRAW "C2; BM64, 82; D15; L15; E15": PAINT (62,95),2,2
155 N1=70: N2=(BUS*20)+70: NX=N2: IF BUS>=8 THEN N2=210 
160 FOR N=N1 TO N2 STEP 20: PUT(N, 79) - (N+15, 100), Z, PSET: NEXT N
165 IF BUS=<8 THEN N2=N2+22: N$=STR$(N2): GOTO 190
170 PUT (230, 79)-(245, 100), Z, PSET
175 N2=((BUS-9)*20)+22: N$=STR$ (N2)
180 FOR N=0TO N2-22 STEP 20: PUT (N, 155) - (N+15,175), Z, PSET: NEXT N
185 DRAW "C2; BM" +N$+", 157; D15; R15; H15": PAINT( N2+2,165), 2, 2: RETURN 
190 DRAW "C2; BM" +N$+", 82; D15; R15; H15": PAINT (N2+2,95), 2,2
195 RETURN
200 REM STUNTS
205 SCREEN 1,0
210 WL=0: N=0: V=RND (3)+2: L=6: BUS=BUS+1:IF BUS>15 THEN BUS=15 
215 IF INKEY$="A" THEN V=V+1: IF V>8 THEN GOTO 245
220 IF INKEY$="D" THEN V=V-2: IF V<2 THEN V=2
225 N=N+V: PUT (N,L)-(N+23, L+17), R, PSET
230 IF N>18 AND L>50 THEN GOTO 295
235 IF N<210THEN 215 ELSE PUT (N,L)-(N+23, L+17 ),U, PSET:L=L+75: N=0 
240 IF L<210 THEN 215 ELSE BUS=0: GOTO355
245 REM WHEELIES
250 V=8
255 WL=WL+1:N=N+V: PUT (N,L) - (N+23, L+17),S,PSET :IF WL>16 THEN 285
260 IF INKEY$=CHR$ (65) THEN 275
265 IF N<230 THEN 245 ELSE PUT (N,L)-(N+23,L+17), U, PSET: L=L+75: N=0
270 IF L<210 THEN 245 ELSE BUS=0: GOTO 355
275 REM JUMP SEQUENCE 
280 N=N+V:PUT (N, L-2)-(N+23, L+15), T, PSET
285 IF N<230 THEN 275 ELSE PUT(N, L-2)-(N+23,L +15), U, PSET: L=L+75: N=0
290 IF L<160 THEN 275 ELSE BUS=0:GOTO 355 
295 LN=INT((20*BUS) * (V/8))+99: LX=LN
300 XN=20: IF LN>220 THEN L2=220 ELSE L2=LN 
305 PUT (N,L) - (N+23, L+17), U, PSET
310 FOR N=XN TO L2 STEP V: PUT (N, L-22) - (N+23,L-5), S, PSET: NEXT N: IF LX<210 THEN PUT (N, L-22)-(N+23, L-5), U, PSET 
315 IF L2=LN OR LN<210 THEN 325
320 PUT (N, L-22)-(N+23, L-5), U, PSET: XN=0: L2=LN-210: LN=L2: L=159: GOTO 310
325 PUT (N, L-22)-(N+23, L-5), U, PSET
330 FOR P=N+4 TO 200 STEP V: PUT (P,L)-(P+23,L +17), S, PSET: NEXT P
335 FOR PQ=P TO 230 STEP V: PUT (PQ, L)-(PQ+23, L +17), R, PSET: NEXT PQ
340 PUT (PQ, L)-(PQ+23, L+17),U, PSET 
345 IF BUS>9 THEN NX=NX-20
350 IF LX<NX+32 THEN BUS=0
355 IF BUS=0 THEN PUT (230, L)-(253, L+17), T, PSET: FOR PS=1 TO 50:SCREEN1,RND(2)-1 :NEXT PS 
360 GOSUB 135 
365 GOTO 205
370 PUT (N,L-8) (N+23, L+9), S, PSET: PUT(N, L-8) - (N+23, L+9), U, PSET 
375 FOR P=N+4 TO 232 STEP V:PUT (P,L)-(P+23 , L+17), T, PSET: NEXT P 
380 BUS=0: GOSUB 135
385 GOTO 210
390 PUT ( 232, L)-(255, L+15), T, PSET: BUS=0: PUT (232,L)-(255, L+15), U, PSET: GOTO 200
395 CLS: PRINT@12, "STUNT CYCLE"
400 PRINT@64, CHR$ (159); "THE WORLD RECORD FOR JUMPING OVER BUSES WHILE RIDING A MOTOR -CYCLE STANDS AT 16 BUSES.": PRINT: 
402 PRINT CHR$ (159); "YOU ARE NOW ABOUT TO ATTEMPT TO EQUAL TH IS RECORD. ": PRINT: PRINT CHR$ (159); "USE "; CHR$(97);" TO ACCELERATE." 
405 PRINT CHR$ (159); "USE "; CHR$(100);" TO DECCELERATE." : PRINT: PRINT CHR$ (159); "LAND SAFELY AND DON'T RIDE TOO FAST.";
410 RETURN
415 'USER DEFINED GRAPHICS
420 PMODE 3,1: PCLS
425 FOR B=0TO31: READ C(B): NEXT 
430 FOR B=0TO15: D=1601+ (B*32): POKE D, C(B): POKE D+1,C(B+16): NEXT 
435 GET (0,0)-(23, 17),R,G: PCLS
440 FOR B=0TO31: READ C(B): NEXT
445 FOR B=0TO15: D=1601+ (B*32): POKE D, C(B): POKE D+1,C(B+16): NEXT 
459 GET (0,0)-(23, 17),S,G: PCLS
455 FOR B=0TO31: READ C(B): NEXT
460 FOR B=0TO15: D=1681+ (B*32): POKE D, C(B): POKE D+1,C(B+16): NEXT
465 GET (8, 9)-(23,17),T,G: PCLS
470 GET (0,0)-(23, 17), U,G
475 FOR B=0TO39: READ C(B): NEXTB
480 FOR B=0TO19: D=1536+ (B*32): POKE D, C(B): POKE D+1,C(B+20): NEXTB
485 GET (0,0)-(15,20), Z, G
490 RETURN
495 DATA 3,3,3, 1, 10, 10, 10, 10, 63, 191, 171, 35, 155,152, 168, 168, 192, 64, 64, 64, 0, 128, 160, 40, 8, 170,42, 160, 230, 166, 42, 42
500 DATA 60, 52, 52, 20, 60, 63, 63, 63, 63, 191, 171, 171, 152, 152, 168, 168,0,0,0, 160, 160, 170, 170, 38, 38,42,42,0,0,0,0,0 
505 DATA 168, 168, 152, 152, 171, 171, 191,63,63,63, 63, 60, 20, 52, 52, 60, 0, 0, 0, 0, 0, 42, 42, 38, 38, 170,170, 160, 160,0,0,0 
510 DATA 255, 255, 255, 213, 213, 213, 213, 255, 255, 255,213,213, 215, 215, 255, 255, 255, 191, 160, 160,255, 255, 255, 87, 87, 87, 87, 255, 255, 255, 87, 87,215, 215, 255, 255, 255, 254, 10, 10
