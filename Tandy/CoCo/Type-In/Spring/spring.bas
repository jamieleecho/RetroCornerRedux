10 REM TANDY(EXTENDED)-SPRING
20 PCLEAR 4:PMODE 4,1:PCLS:SCREEN 1,0
30 REM STARTING POSITION AND SPRINGCONSTANTS
40 X=RND(255)
50 Y=RND(191)
60 AX=RND(50)+5
70 AY=RND(50)+5
80 LINE -(X,Y),PRESET
90 REM CALCULATE VELOCITY AND DISPLACEMENT
100 VX=VX+(128-X)/AX
110 X=X+VX
120 VY=VY+(95-Y)/AY
130 Y=Y+VY
140 LINE-(X,Y),PSET
145 IFINKEY$=" "THEN PCLS:GOTO 40
150 GOTO 100
