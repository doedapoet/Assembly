.model small
.stack 100h

.data
    msg1    db 'Nhap chuoi: $'
    msg2    db 13,10, 'Chuoi: $'
    msg3    db 13,10, 'So ky tu: $'
    buffer  db 100, ?, 100 dup(?)   ; Byte 0: do dai co the nhap max 100
                                    ; Byte 1: so luong ky tu thuc su da nhap
                                    ; Byte 2: vung luu ky tu nhap tu ban phim    
    numStr  db 6 dup('$')             

.code
main:
    mov ax, @data
    mov ds, ax

    lea dx, msg1
    mov ah, 09h
    int 21h

    lea dx, buffer
    mov ah, 0Ah
    int 21h

    mov cl, buffer + 1          ; CL = so ky tu da nhap
    lea si, buffer + 2          ; SI = vi tri bat dau cua chuoi
    add si, cx                  ; SI tro den vi tri sau chuoi ki tu
    mov byte ptr [si], '$'      ; gan ky tu $ ket thuc chuoi
    

    lea dx, msg2
    mov ah, 09h
    int 21h

    lea dx, buffer + 2
    mov ah, 09h
    int 21h

    lea dx, msg3
    mov ah, 09h
    int 21h

    xor ax, ax
    mov al, buffer + 1
    lea di, numStr
    call int_to_str

    lea dx, numStr
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h

int_to_str:
    mov cx, 0
    mov bx, 10
next_digit:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz next_digit
write_digits:
    pop dx
    add dl, '0'
    mov [di], dl
    inc di
    loop write_digits
    mov byte ptr [di], '$'
    ret

end main
