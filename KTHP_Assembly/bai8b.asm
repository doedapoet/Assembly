    ; doi thuong thanh hoa
inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm
.model small
.stack 100h
.data
    string db 255 dup ('$')  
    msg1 db 'Nhap 1 chuoi: $'
    msg2 db 10, 13, 'Chuyen hoa thanh thuong: $'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    inchuoi msg1
    mov ah, 0Ah
    lea dx, string
    int 21h 
    
    inchuoi msg2
    lea si, string + 2
     
    hoa_thanh_thuong:
        mov dl, [si]
        cmp dl, 'A' 
        jb in_thuong
        cmp dl, 'Z'
        ja in_thuong 
        add dl, 32  

    in_thuong:
        mov ah, 2
        int 21h
        
        inc si
        cmp [si], '$'
        jne hoa_thanh_thuong 
    mov ah, 4ch    
    int 21h
main endp
end
