.model small 
.stack 100h 
.data  
    tbao1 db "Nhap vao ho va ten: $"
    tbao2 db 13,10,"MaSV: AT190512$"
    tbao3 db 13,10,"Khong dung! Nhap lai: $"
    hoten db "TRAN DANG DOANH", "$"     ; ho ten dung de so sanh (viet hoa san)
    input db 100 dup('$')               ; chuoi ho ten da chuyen hoa
    buffer db 100 dup(0)                ; vung nho de nhap chuoi

.code 
main proc
    mov ax, @data
    mov ds, ax

nhap:
    ; hien thong bao nhap ten
    mov ah, 09
    lea dx, tbao1
    int 21h

    ; nhap chuoi bang ham 0Ah
    mov buffer, 98           ; do dai toi da
    mov buffer+1, 0          ; do dai thuc te = 0
    lea dx, buffer
    mov ah, 0Ah
    int 21h

    ; chuyen ky tu thanh chu hoa
    mov cl, buffer+1         ; lay do dai thuc te
    mov ch, 0
    lea si, buffer+2         ; vi tri bat dau chuoi
    lea di, input            ; noi luu chuoi da chuyen
chuyenHoa:
    mov al, [si]
    cmp al, 'a'
    jb khongdoi
    cmp al, 'z'
    ja khongdoi
    sub al, 32               ; chuyen ky tu thanh hoa
khongdoi:
    mov [di], al
    inc si
    inc di
    loop chuyenHoa
    mov byte ptr [di], '$'   ; ket thuc chuoi

    ; so sanh chu input voi hoten
    lea si, input
    lea di, hoten
so_sanh:
    mov al, [si]
    cmp al, '$'
    je dung                 ; neu het chuoi va trung het thi dung
    cmp al, [di]
    jne sai                 ; neu khac bat ky ky tu nao thi sai
    inc si
    inc di
    jmp so_sanh

dung:
    ; xuat ma sinh vien
    mov ah, 09
    lea dx, tbao2
    int 21h
    mov ah, 4Ch             ; ket thuc chuong trinh
    int 21h

sai:
    ; xuat thong bao sai, nhap lai
    mov ah, 09
    lea dx, tbao3
    int 21h
    jmp nhap                ; quay lai nhap lai

main endp 
end main
