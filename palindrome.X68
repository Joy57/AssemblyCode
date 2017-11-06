 *-----------------------------------------------------------
* Title :
* Written by :
* Date :
* Description:
*-----------------------------------------------------------
  ORG $1000
START: ; first instruction of program

mainLoop 
    MOVE.B #14,D0
    LEA enterStrMsg,A1
    TRAP #15

    LEA input, A1
    Move.b #2,D0
    TRAP #15

    MOVE.B D1, D5
    MOVE.W A1, A2
    ADD.W D1, A2
    CMP D2, D1             ; #$24,(A1)
    BNE loopPal

loopPal
    MOVE.B -(A2),D3 ;right 
    MOVE.B (A1)+,D4 ;left
    CMP D3,D4       ;compare characters the at ends of the string
    BNE notPalindr
    SUB.B #1,D5   
    CMP #0,D5
    BHI loopPal  
    BSR isPalindr   

    STOP #$2000   

isPalindr
    MOVE.B #14,D0
    LEA paliMsg,A1   
    TRAP #15
                ;BRA mainLoop
    SIMHALT ; halt simulator


notPalindr
    MOVE.B #14,D0
    LEA notPaliMsg,A1
    TRAP #15
                    ;BRA mainLoop

    SIMHALT ; halt simulator

CR EQU $0D
LF EQU $0A


enterStrMsg dc.b CR,LF,'Enter string: ',0
notPaliMsg dc.b CR,LF,'Is not palindrome! ',0
paliMsg dc.b CR,LF,'is palindrome! ',0


input ds.b $2000
* Put variables and constants here

    END START ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
