.MODEL SMALL
.STACK 100h

.DATA
    input DB 'Hay go 1 phim: $'
    output DB 13, 10, 'Ky tu duoc nhan la: $' 
    kytu DB ?
   
.CODE
main proc
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH, 09h
    LEA DX, input
    INT 21h
    
    
    MOV AH, 07h 
    int 21h
             
    MOV kytu, AL
    
    MOV AH, 09h
    LEA DX, output
    INT 21h   
    
    
    MOV DL, kytu
    MOV AH, 02h
    INT 21h
    
    MOV AH, 4Ch
    INT 21h
    
main ENDP
END main
    
    