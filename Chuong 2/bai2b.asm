.MODEL SMALL
.STACK 100h

.DATA
    tbao DB 'Hay go vao 1 phim: $'

.CODE
main PROC
    MOV AX, @DATA
    MOV DS, AX

    
    MOV AH, 09h
    LEA DX, tbao
    INT 21h

    
    MOV AH, 01h
    INT 21h

   
    MOV AH, 4Ch
    INT 21h
main ENDP
END main

