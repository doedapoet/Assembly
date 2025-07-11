    ; doc noi dung
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100h
.data
    tb1 db 'Nhap ten tep tin: $'
    tb2 db 10,13, 'Noi dung tep tin: $'
    error db 10,13, 'Ten tep tin khong ton tai!$'
    tenfile db 100 dup(?)
    thefile dw ?
    nd db 100 dup('$')
.code
main proc
    mov ax, @data
    mov ds, ax
    
    inchuoi tb1
    mov si, 0
    mov tenfile[si], 'e'
    inc si
    mov tenfile[si], ':'
    inc si
    mov tenfile[si], '\'
    inc si
    nhap:
        mov ah, 1
        int 21h
        cmp al, 13
        je mofile
        mov tenfile[si], al
        inc si
        jmp nhap
    mofile:
        mov ah, 3dh  ; Mo 1 tep tin 
        lea dx, tenfile
        mov al, 2  ; 2=Che do mo tep tin de ghi
        int 21h
        mov thefile, ax
        jc err 
        
    mov ah, 3fh ; 3fh: Doc du lieu tu mot tep tin da mo
    lea dx, nd
    mov cx, 99 ; So luong toi da ma nd co the chua
    mov bx, thefile
    int 21h    
    jc err
    inchuoi tb2
    inchuoi nd
    jmp exit 
       
    err:
    inchuoi error  
    
    exit:
    mov ah, 4ch
    int 21h
main endp
end    