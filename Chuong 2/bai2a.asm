CSEG SEGMENT
ASSUME CS: CSEG
start: 
    mov ah, 02h 
    mov dl, 'B' 
    int 21h 
    mov ah, 08h 
    int 21h
    mov ah, 4Ch   
    int 21h
CSEG ENDS
END start
             