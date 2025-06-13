; AT190512 

.MODEL SMALL
.STACK 100h

.DATA
    A DW 15h
    B DW 250
    Result   DW ?

.CODE
START:
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, A
    MOV BX, B
    MUL BX         ; AX = AX * BX 

    MOV Result, AX 

    MOV AH, 4CH
    INT 21h
END START
