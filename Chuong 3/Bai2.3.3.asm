.model small
.stack 100h
.data
    Nhap db 13, 10, "Nhap 1 ky tu thuong (a-z): $"
    space   db ' $'     

.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 9
    lea dx, Nhap
    int 21h

    mov ah, 1
    int 21h
    mov bl, al      


    loop_print:
    mov dl, bl
    mov ah, 2
    int 21h         

    
    mov ah, 9
    lea dx, space
    int 21h

    inc bl          
    cmp bl, 'z'+1
    jne loop_print  

    
    mov ah, 4Ch
    int 21h
main endp
end
