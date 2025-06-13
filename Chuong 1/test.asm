.MODEL SMALL
.STACK 100h

.DATA
    A     DW 1000h
    B     DW 0010h
    C     DW 001Fh
    D     DW 0030h
    E     DW 300Ah
    KQUA  DW ?          

.CODE
START:
    MOV AX, @DATA
    MOV DS, AX           

    
    MOV AX, A            ; AX = A
    ADD AX, B            ; AX = A + B
    SUB AX, C            ; AX = A + B - C
    ADD AX, D            ; AX = A + B - C + D
    ADD AX, E            ; AX = A + B - C + D + E

    MOV KQUA, AX         

    
    MOV AH, 4Ch
    INT 21h
END START

