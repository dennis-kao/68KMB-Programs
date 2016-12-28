*-----------------------------------------------------------
* Title      : INTEGER-PRINTER* Written by : DENNIS KAO
* Date       : NOV. 16, 2016
* Description: PRINTS OUT AN INTEGER IN D3 TO THE SCREEN
*-----------------------------------------------------------

    ORG $8024
    JMP T5

    ORG $9000
T5  LINK A6,#-8
    CMPI.L #0,8(A6) ; N == 0?
    BNE CONTINUE
    UNLK A6
    RTE
CONTINUE MOVE.L D3,-4(A6) ;remainder, D2
    MOVE.L D3,-8(A6) ;quotient, D1

    MOVE.L -4(A6),D2
    DIVU #10,D2
    SWAP D2
    ANDI.B #%00001111,D2
    ORI.B #%00110000,D2 ;APPENDS 0011 TO REMAINDER
    MOVE.L #0,-4(A6) ;CLEAR IT
    MOVE.B D2,-4(A6)

    MOVE.L -8(A6),D1
    DIVU #10,D1
    MOVE.L #0,-8(A6) ;CLEAR IT
    MOVE.W D1,D5
    MOVE.L D5,D1
    MOVE.L D1,-8(A6)

    MOVE.L -8(A6),-(SP)
    MOVE.L -8(A6),D6
    TRAP #5
    MOVE.L D3,D0
    TRAP #1
    UNLK A6
    RTS

    ORG    $8000
START: MOVE.L #123,D3
    TRAP #5
    RTS
    END    START


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
