Mode 4
Color 0,5
Dim HIT(6,4)
1 BX=120
BY=150
R=0
L=0
PX=160
PY=210
VELX=0
VELY=0
PUNTOS=0
VIDAS=3
For I=0 To 3
  For J=0 To 5
    HIT(J,I)=1
  Next J
Next I
5 Cls
A$=Inkey$
If A$="D" Then
  R=1
  L=0
EndIf
If A$="A" Then
  R=0
  L=1
EndIf
If Asc(A$)=32 And VELX=0 And VELY=0 Then
  VELX=4+Rnd*3
  VELY=3+Rnd*3
EndIf
BX=BX+VELX
BY=BY+VELY
If VIDAS=3 And VELX=0 And VELY=0 Then Print @(40,100) "PULSA ESPACIO PARA EMPEZAR"
If VELX<>0 And VELY<>0 Then
  Print @(95,100) "PUNTOS: " PUNTOS
  Print @(97,115) "VIDAS: " VIDAS
EndIf
If R=1 Then PX=PX+4
If L=1 Then PX=PX-4
If PX+30>240 Then PX=210
If PX<0 Then PX=0
For I=0 To 3
  For J=0 To 5
    X=J*40+7
    Y=I*15+5
    If BX+3>X And BX-3<X+25 And BY+3>Y And BY-3<Y+7 And HIT(J,I) Then
      VELY=-VELY
      HIT(J,I)=0
      PUNTOS=PUNTOS+40*VIDAS
    EndIf
    If HIT(J,I)=1 Then Line (X,Y)-(X+25,Y+7),7,B
  Next J
Next I
Line (PX,PY)-(PX+30,PY+6),7,B
Circle (BX,BY),3,7,F
If BX+3+VELX>PX And BX-3+VELX<PX+30 And BY+3+VELY>PY And BY-3-VELY<PY+6 Then
VELY=-VELY
EndIf
If BY>225 Then
  VELX=0
  VELY=0
  BX=120
  BY=150
  R=0
  L=0
  PX=160
  PY=210
  VIDAS=VIDAS-1
EndIf
If VIDAS<=0 Then GoTo 1
If BX+3>240 Or BX-3<0 Then VELX=-VELX
If BY-3<0 Then VELY=-VELY
Pause 60
GoTo 5

