.model small 
.stack 100 
.data  
    tbao1 db "Nhap vao ma sinh vien: $"
    tbao2 db 10,13,"Ho va ten: Tran Dang Doanh$"
    tbao3 db 10,13,"Khong dung! Nhap lai: $"
    masv db "AT190512"
    input db 100 dup('$') 

.code 
    main proc
        mov ax, @data
        mov ds, ax
              
        nhap:
            mov ah, 09
            lea dx, tbao1
            int 21h
          
        mov ah, 0ah
        lea dx, input
        int 21h
        
        mov cx, 0
        lea si, input+2
        mov cl, input+1
        chuyenHoa:
            cmp [si], 'a'
            jb next
            cmp [si], 'z'
            ja next
            sub [si], 32
            inc si
        next:
            Loop chuyenHoa
        
        mov cx, 8
        lea si, input+2
        lea di, masv
        sosanh:
            mov al, [si]
            cmp al, [di]
            jne nhaplai
            inc si
            inc di
            Loop sosanh
        
        xuat:
            mov ah, 09 
            lea dx, tbao2
            int 21h
            mov ah, 4ch
            int 21h
            
        nhaplai: 
            mov ah, 09 
            lea dx, tbao3
            int 21h
            jmp nhap
                      
    main endp 
end main