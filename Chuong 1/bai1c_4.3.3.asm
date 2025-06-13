;AT190512
.MODEL SMALL
.STACK 100

.DATA
    A DW 300
    B DW 400
    Result DW ?

.CODE
START:
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AX, A
    MOV BX, B
    MUL BX
    
    MOV Result, AX
    
    MOV AH, 4CH
    INT 21h
END START