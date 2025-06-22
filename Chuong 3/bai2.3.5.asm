.model small
.stack 100h
.data
    msg1 db 'Nhap chuoi: $'
    msg2 db 13,10,'Chu thuong -> hoa: $'
    msg3 db 13,10,'Chu hoa -> thuong: $'
    buffer db 100,?,100 dup(?)     ; Cho phep nhap toi da 100 ky tu
    temp1  db 100 dup('$')         ; Luu chuoi hoa
    temp2  db 100 dup('$')         ; Luu chuoi thuong

.code
main:
    mov ax, @data
    mov ds, ax

    ; Nhap chuoi
    lea dx, msg1
    mov ah, 09h
    int 21h

    lea dx, buffer
    mov ah, 0Ah
    int 21h

    ; Duyet tung ky tu
    mov cl, buffer + 1
    xor ch, ch
    lea si, buffer + 2
    lea di, temp1
    lea bx, temp2

next_char:
    mov al, [si]
    ; lowercase -> UPPER
    cmp al, 'a'
    jb skip_upper
    cmp al, 'z'
    ja skip_upper
    sub al, 32
skip_upper:
    mov [di], al

    ; original -> lowercase
    mov al, [si]
    cmp al, 'A'
    jb skip_lower
    cmp al, 'Z'
    ja skip_lower
    add al, 32
skip_lower:
    mov [bx], al

    inc si
    inc di
    inc bx
    loop next_char

    ; Gan dau ket thuc '$'
    mov byte ptr [di], '$'
    mov byte ptr [bx], '$'

    lea dx, msg2
    mov ah, 09h
    int 21h
    lea dx, temp1
    mov ah, 09h
    int 21h

    lea dx, msg3
    mov ah, 09h
    int 21h
    lea dx, temp2
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h
end main
