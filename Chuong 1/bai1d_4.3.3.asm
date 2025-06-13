; AT190512 

.MODEL SMALL
.STACK 100h

.DATA
    A DW 1000
    B  DW 100
    Result   DW ?
    Remainder DW ?

.CODE
START:
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, A
    XOR DX, DX       ; xoa phan du
    MOV BX, B
    DIV BX

    MOV Result, AX
    MOV Remainder, DX

    MOV AH, 4CH
    INT 21h
END START
