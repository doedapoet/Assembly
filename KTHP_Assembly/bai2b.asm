; tinh tong cac phan tu trong chuoi
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi so: $'
    tb2 db 13,10,'Tong chuoi so: $'
    x dw ?
    y dw ?
    kq dw ?
    soam db ?
.code
    main proc
        mov ax, @data
        mov ds, ax
        
        inchuoi tb1
        mov soam, 0
        nhapso:
            mov x, 0
            mov y, 0
            mov bx, 10
            nhap:
                mov ah, 1
                int 21h
                xor ah,ah
                cmp al, 13
                je tong
                cmp al, ','
                je tong
                cmp al, ' '
                je tong
                cmp al, '-'
                je am 
                sub al, 30h ; chuyen ky tu sang so
                mov y, ax
                mov ax, x
                mul bx
                add ax, y
                mov x, ax
                jmp nhap
        tong:
            mov bl, al  ; luu gia tri cuoi cung vao bl
            mov ax, x
            cmp soam,1  ; neu kp so am nhay toi cong
            jne cong
            mov soam, 0
            neg ax      ; dao dau so am
            cong:
            add kq, ax
            cmp bl, 13
            je ketqua
            jmp nhapso
        am:
            mov soam, 1 ; bao hieu so tiep theo la so am   
            jmp nhapso
        ketqua:
            inchuoi tb2
            cmp kq, 0
            jnl kt    ; Nhay neu khong nho hon
            neg kq    ; Dao dau neu ket qua la so am
            mov ah, 2
            mov dl, '-'
            int 21h
            kt: 
            mov cx, 0
            mov bx, 10
            mov ax, kq
            chia:
                xor dx, dx
                div bx
                push dx
                inc cx
                cmp al, 0
                je xuat
                jmp chia
            xuat:
                pop dx
                add dl, 30h ; chuyen so ve ky tu
                mov ah, 2
                int 21h
                loop xuat
        mov ah, 4ch
        int 21h
    main endp
end