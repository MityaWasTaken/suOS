; MityaWasTaken
; main.asm
; suOS (Super Underpowered Operating System)

org 0x7c00
using16

; setting to default video mode 
mov ah, 0003h
int 10h
int 20h

entering:
   ; clearing the entire screen
    mov ah, 00h
    xor al, al
    xor cx, cx
    mov dx, 184fh 
    mov bh, 1fh
    int 10h

    ; changing the background color
    mov ah, 06h
    xor al, al
    xor cx, cx
    mov dx, 184fh 
    mov bh, 1fh
    int 10h
 
output:
    mov ah, 1
    int 16h
    cbw
    int 16h
    mov ah, 0xe
    int 0x10
    jmp output
loop: 
    lodsb
    or al, al
    jz halt
    int 0x10
    jmp loop


; halt routine
halt:
    hlt
    cli

times 510-($-$$) db 0 
dw 0xAA55
