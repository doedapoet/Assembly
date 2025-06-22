.model small
.stack 100h
.data
    strNhap db 13, 10, "Nhap 1 ky tu: $"
    strHoa  db 13, 10, "Ky tu HOA$"
    strThuong db 13, 10, "Ky tu thuong$"
.code
main proc
    mov ax, @data
    mov ds, ax

  
    mov ah, 9
    lea dx, strNhap
    int 21h

   
    mov ah, 1
    int 21h         

   
    cmp al, 'A'
    jl laThuong     

    
    cmp al, 'Z'
    jg laThuong     

    
    mov ah, 9
    lea dx, strHoa
    int 21h
    jmp thoat

    
    laThuong:
    mov ah, 9
    lea dx, strThuong
    int 21h

    thoat:
    mov ah, 4Ch
    int 21h

main endp
end
