.MODEL SMALL
.STACK 100h

.DATA
max  DB 60
len  DB 0
chuoi DB 60 DUP(?)
tbao DB 'Hay go vao 1 chuoi: $'

.CODE
main PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09h
    LEA DX, tbao
    INT 21h

    MOV AH, 0Ah
    LEA DX, max
    INT 21h

    MOV AH, 4Ch
    INT 21h

main ENDP
END main
