.MODEL SMALL
.STACK 100h

.DATA 
    chuoi DB 'kma', 10, 13, 'attt$'
    
.CODE
main PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 09h
    LEA DX, chuoi
    INT 21h
    
    MOV AH, 08h
    INT 21h
    
    MOV AX, 4Ch
    INT 21h 
    
main ENDP
END main