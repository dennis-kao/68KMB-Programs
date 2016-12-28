*-----------------------------------------------------------
* Title      : LED OUTPUT
* Written by : Dennis Kao
* Date       : November 23, 2016
* Description: SWITCHES LEDS USING INPUT FROM A KEYBOARD
*-----------------------------------------------------------

DUART EQU $C001
SRA EQU 2
RBA EQU 6
LF EQU $0A
IPR EQU 13*2
OPR_SET EQU 14*2
OPR_CLR EQU 15*2

  ORG $8000
MAIN CLR D0
  BSR SCAN ;START SCANNING
  TRAP #14

OUT681 MOVE.B D0,OPR_CLR(A0) ;CLR BITS, SET PINS
  NOT.B D0
  MOVE.B D0,OPR_SET(A0) ;SET BITS, CLR PINS
  RTS

SCAN LEA DUART,A0
LOOP MOVE.B SRA(A0),D7 ;MOVE STATUS REGISTER INTO D7
  ANDI.B #1,D7 ;BUFFER EMPTY?
  BEQ LOOP ;YES: CHECK AGAIN
  MOVE.B RBA(A0),D0 ;NO: CHECK CHAR
  CMPI.B #'Q',D0 ;IS IT Q
  BEQ EXIT ;YES: EXIT!
  NOT.B D0
  BSR OUT681 ;PRINT TO LEDs
  BRA LOOP ;PROGRAM ONLY EXITS ON Q
EXIT RTS

  END MAIN




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
