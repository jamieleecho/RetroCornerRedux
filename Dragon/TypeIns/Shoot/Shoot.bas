5  GOSUB2000
10 CLS:INPUT" ENTER STARTING LEVEL(1/10)";T
20 IF T<1 AND T>10 THEN RUN
30 TI=T*100
40 IF TI<0 OR TI>1000 THEN RUN
50 GOSUB 720:GOSUB 760
60 PMODE4,1:SCREEN1,1:PCLS
70 DRAW"BM105,30;D3F3R1BR10R1E3U3"
80 CIRCLE(108,25),2
90 CIRCLE(120,25),2
100 DRAW"BM115,30;D5BL2U5"
110 CIRCLE(114,41),9,1,.30,.100,1
120 DRAW"BM98,20;R32BL8U10L1U1L4G4E2H2L5D1L1D10"
130 CIRCLE(114,44),4,1,1,0,.5
140 DRAW"BM120,43;D5L1D4L1D2L3D1L2U1L3U2L1U4L1U5"
150 PAINT(119,44),3,3
160 PAINT(119,41),3,3
170 PAINT(121,12),3,3
180 CIRCLE(100,50),7,1,.8,.5,1
190 CIRCLE(129,50),7,1,.8,.5,1
200 FOR A=50 TO 90 STEP 10
210 CIRCLE(115,A),2
220 NEXT
230 LINE(135,50)-(146,70),PSET
240 LINE(85,70)-(95,50),PSET
250 DRAW"BM85,70;L1D2L1R1D2R1BR60UR1U2R1L1U2"
260 LINE(85,74)-(100,95),PSET
270 LINE(145,72)-(130,95),PSET
280 DRAW"BM95,70;U2R1U2R1U2R1D12L1U2L1U2L1U2BR39U2L1U2L1U2L1D12R1U2R1U2R1U2"
290 DRAW"BM102,102;U3R3L1D1L1U7R1U1R1U1L1U1L1U1L6D1R4D11U8L3U4"
300 DRAW"BM105,94;U1R4U1R4U1R4U1R4U1R4U1R4U1R4D4L4D1L4D1L4D1L4D1L4D1L4D1L5"
310 PAINT(106,95)
320 LINE(100,143)-(102,102),PSET
330 LINE(132,143)-(130,95),PSET
340 DRAW"BM115,100;D1D1L2D2L1D1L1D2BR5BU5D1R2D1R1D2D10R1D20L1D10BL9U10L1U20R1U12"
350 DRAW"BM121,150;H4F2E2G4E2U2D4U2L2R4"
360 DRAW"BM115,150;H4F2E2G4E2U2D4U2L2R4"
370 DRAW"BM112,147;D10L5U2L4D1L3D1L3U1L2U1L1U2L1R1U1R2U1R4U1R3U1R2U2R1U1L7U3D3R12"
380 DRAW"BM119,147;D10R5U2R4D1R3D1R3U1R2U2R1U2R1L1U1L2U1L4U1L3U1L2U2L1U1R7U3D3L12"
390 PAINT(110,148)
400 PAINT(121,149)
410 A=RND(1000)+100
420 FOR N=1 TO A:A$=INKEY$:IF A$<>"" THEN 690 ELSE NEXT N
430 GOSUB 550
440 TIMER=0
450 FOR N=1 TO TI:IF INKEY$<>"" THEN 580
460 IF TI=<0 THEN GOTO 800
470 NEXT N
480 FOR N=1 TO 10:PCLS1:PLAY MU$(2):PCLS2:NEXTN
490 CLS:PRINT"             TOO SLOW"
500 PLAY MU$(1)
510 A$=INKEY$
520 PRINT@457,"PRESS ANY KEY"
530 A$=INKEY$:IF A$="" THEN 530
540 RUN
550 DRAW"BM100,80;R2D3L2U3R1U1D1R1D3R1D4L4U4"
560 LINE(98,90)-(105,100),PRESET,BF
570 RETURN
580 TM=TIMER:CLS:PRINT"   BLAM":PRINT"   WELL DONE"
590 M=M+1:PRINT"IT TOOK YOU ";TM;" MICRO SECONDS"
600 PLAY MU$(2)
610 FOR N=1 TO 300:NEXT
620 PRINT"YOU'VE SHOT ";M;"OF THEM"
630 TI=TI-50
640 PLAY MU$(3)
650 PRINT@457,"PRESS ANY KEY"
670 A$=INKEY$:IF A$="" THEN 670
680 GOTO 60
690 CLS:PRINT"    CHEAT"
700 PLAY MU$(1)
710 GOTO 510
720 MU$(1)="T2L10O3CCCO1C"
730 MU$(2)="O2T255L255BAGFEDC"
740 MU$(3)="O3T4L19EC+EC+EO1AA"
750 RETURN
760 CLS
765 PRINT "INSTRUCTIONS":PRINT
771 PRINT "THE AIM OF THE GAME IS TO SHOOT ";INT(TI/50)+1;"MEN BEFORE THEY SHOOT YOU":PRINT
772 PRINT "AFTER EACH MAN YOU WILL BE TOLD HOW MANY MEN YOU HAVE SHOT AND  EACH NEW MAN WILL PULL HIS"
773 PRINT "TRIGGER A BIT QUICKER THAN THE  MAN BEFORE HIM.":PRINT
774 PRINT "YOU PRESS ANY KEY TO SHOOT BUT  DO NOT SHOOT BEFORE HE RAISES HIS GUN!"
774 PRINT "PRESS ANY KEY"
790 IF INKEY$="" THEN 790 ELSE RETURN
800 FOR N=1TO50:IF INKEY$=""THEN NEXT ELSE CLS:PRINT"WELL DONE YOU KILLED THEM ALL":GOTO 820
810 GOTO 490
820 PLAY"T5L202G#L5G#L2G#O3CD#L1G#L2G#G#CDD#"
830 SCREEN1,1
840 IF INKEY$="" THEN 840
850 RUN

2000 CLS0:TT$="SHOOT":TBY$="DUNCAN ROWLAND":TD$="MAGAZINE TYPE-IN"
2010 TV$="DRAGON USER SEPT 1984":TC$=CHR$(159):GOSUB 9010
2030 GOSUB9930:GOTO9810
2500 RETURN

9010 TM=LEN(TT$):IF LEN(TBY$)>TM THEN TM=LEN(TBY$)
9015 IF LEN(TV$)>TM THEN TM=LEN(TV$)
9020 BH=7:BW=TM+2:BY=3:BX=(30-BW)/2+1:BC$=CHR$(143):GOSUB9510
9030 BH=9:BW=TM+4:BY=1:BX=(32-BW)/2:BC$=TC$:GOSUB9410
9040 ?@(BY+1)*32 + ((32-LEN(TT$))/2),TT$;
9050 ?@(BY+3)*32 + ((32-LEN(TBY$))/2),TBY$;
9060 ?@(BY+5)*32 + ((32-LEN(TD$))/2),TD$;
9070 ?@(BY+7)*32 + ((32-LEN(TV$))/2),TV$;
9100 RETURN

9410 BR$=STRING$(BW,BC$)
9430 ?@BX+((BY+1)*32),BR$;
9435 ?@BX+((BY+BH)*32),BR$;
9437 BH=BH-1:BY=BY+1:BW=BW-1
9440 FOR BQ=1TOBH:?@BX+((BY+BQ)*32),BC$;:?@BX+BW+((BY+BQ)*32),BC$;:NEXT
9499 RETURN

9510 BR$=STRING$(BW,BC$)
9530 FOR BQ=1TOBH:?@BX+((BY-1+BQ)*32),BR$;:NEXT
9599 RETURN

9610 PRINT@(32-LEN(T$))/2+32*TL,T$;
9620 RETURN

9710 FORDZ=1TO5000:NEXT:RETURN

9810 WA$=INKEY$:IF WA$="" THEN 9810
9820 RETURN

9930 BC$=CHR$(128):?@483,"press"+BC$+"any"+BC$+"key"+BC$+"to"+BC$+"continue";:GOSUB9810:RETURN
