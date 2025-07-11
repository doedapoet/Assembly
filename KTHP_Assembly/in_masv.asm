; nhap vao masv, hien thi ten cua minh

inchuoi macro chuoi
    mov ah, 9
    lea dx, chuoi
    int 21h
endm

.model small
.stack 100h
.data
    tb1 db 'Nhap ma SV: $'
    hoten db 10,13,'Ten SV: Tran Dang Doanh$'
    tb2 db 10,13,'Thong tin sai!$'
    masvhoa db 'AT190512'
    masvthuong db 'at190512'
    str db 100 dup('$')
.code
    main proc
        mov ax, @data
        mov ds, ax
        mov es, ax ; Su dung cung mot khong gian bo nho
    
        inchuoi tb1
        mov ah, 0Ah
        lea dx, str
        int 21h
        
        cmp str+1, 8 ; so sanh do dai chuoi nhap vao, +1 loai bo enter, xuongdong
        jne err 
    
        ; so sanh chuoi nhap vao voi masvhoa
        cld  ; xoa co DF trong thanh ghi EFlags, dam bao chuoi duoc thuc hien tu trai sang phai
        mov cx, 8  ; thanh ghi cx khai bao so byte can so sanh 
        lea si, masvhoa
        lea di, str+2 ; bo qua byte do dai toi da va do dai thuc te
        repe cmpsb ; so sanh cac bit trong bo nho tai SI va DI cho den khi cx=0
        je ketqua
        
        ; so sanh chuoi nhap vao voi masvthuong
        cld
        mov cx, 8
        lea si, masvthuong
        lea di, str+2
        repe cmpsb
        je ketqua
        
        err:
        inchuoi tb2
        jmp exit
        
        ketqua:
            inchuoi hoten
        
        exit:
            mov ah, 4ch
            int 21h    
    main endp
end