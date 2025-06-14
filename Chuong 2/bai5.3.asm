.MODEL SMALL
.STACK 100h

.DATA
    input DB 'Hay go 1 phim: $'
    output1 DB 13, 10, 'Ky tu ke truoc : $'
    output2 DB 13, 10, 'Ky tu ke sau : $'
    kytu DB ?
    ke_truoc DB ?
    ke_sau DB ?

.CODE
main PROC
    MOV AX, @DATA
    MOV DS, AX

    
    MOV AH, 09h
    LEA DX, input
    INT 21h

    
    MOV AH, 07h
    INT 21h

    
    MOV kytu, AL

    
    MOV AL, kytu
    DEC AL
    MOV ke_truoc, AL

    
    INC AL
    INC AL
    MOV ke_sau, AL

    
    MOV AH, 09h
    LEA DX, output1
    INT 21h

    MOV DL, ke_truoc
    MOV AH, 02h
    INT 21h

  
    MOV AH, 09h
    LEA DX, output2
    INT 21h

    MOV DL, ke_sau
    MOV AH, 02h
    INT 21h

    
    MOV AH, 4Ch
    INT 21h

main ENDP
END main
