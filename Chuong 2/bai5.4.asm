.MODEL SMALL
.STACK 100h

.DATA
    max DB 30       
    len DB 0       
    ten DB 30 DUP(?) 

    input DB 'Hay nhap ten cua ban: $'
    output DB 13, 10, 'Xin chao $'

.CODE
main PROC
    MOV AX, @DATA
    MOV DS, AX

    
    MOV AH, 09h
    LEA DX, input
    INT 21h

  
    MOV AH, 0Ah
    LEA DX, max
    INT 21h

   
    MOV AH, 09h
    LEA DX, output
    INT 21h

   
    MOV AL, len
    MOV AH, 0
    MOV CX, AX
  

in_ten:
    MOV AL, ten[SI]
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    INC SI
    LOOP in_ten

    
    MOV AH, 4Ch
    INT 21h

main ENDP
END main
