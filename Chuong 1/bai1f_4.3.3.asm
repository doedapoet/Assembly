; AT190512 

.MODEL SMALL
.STACK 100h

.DATA
    AHigh DW 3AB4h  
    ALow  DW 5Eh    
    B      DW 0A1h
    Quotient     DW ?
    Remainder    DW ?

.CODE
START:
    MOV AX, @DATA
    MOV DS, AX

    MOV DX, AHigh
    MOV AX, ALow
    MOV BX, B
    DIV BX

    MOV Quotient, AX
    MOV Remainder, DX

    MOV AH, 4CH
    INT 21h
END START
