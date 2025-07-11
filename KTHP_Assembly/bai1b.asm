; tinh n!
inchuoi MACRO chuoi    
    mov ah, 09h
    lea dx, chuoi
    int 21h
endm                   

.model small
.stack 100h
.data
    coso dw 10
    xdong db 10,13,'$' 
    tb1 db 'Nhap n thoa man 0<n<=8: $'
.code
  main proc
    mov ax, @data
    mov ds, ax  
    
    inchuoi tb1
    
    mov ah, 1
    int 21h  
    
    sub al, '0' ; chuyen ky tu sang so 
    mov cx, 0   ; bien dem
    mov cl, al  ; bien lap
    
    inchuoi xdong
           
    mov ax, 1   
    mov bx, 1
    
    giaithua:
        mul bx  ; ax = ax*bx   
        inc bx
        cmp bx, cx 
        jle giaithua  ; bx<=cx tiep tuc lap 
    
    xor cx, cx      
    lappush:
        xor dx, dx
        div coso   ; 8 bit: thuong luu trong AL, du AH; 16 bit thuong luu trong AX, du DX
        add dx, 30h ; chuyen so sang ky tu
        push dx  ; day ky tu vao ngan xep
        inc cx
        cmp ax, 0
        jne lappush
    
    print:
        pop dx
        mov ah, 2
        int 21h
        loop print  
               
    mov ah, 4Ch
    int 21h 
  main endp  

end main