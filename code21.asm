global _main
extern _printf
section .data
format1 db "AH = 0x%02X, AL = 0x%02X-> AX = 0x%04X", 10, 0
format2 db "Full EAX after packing = 0x%08X", 10, 0
section .text
_main:
xor eax, eax
mov ah, 0x12 ; AH is bits 8-15
mov al, 0x34 ; AL is bits 0-7
movzx ecx, ax
movzx edx, ah
movzx ebx, al
push ecx ; Value of AX
push ebx ; Value of AL
push edx ; Value of AH
push format1
call _printf
add esp, 16
shl eax, 16
mov ah, 0x56
mov al, 0x78
push eax
push format2
call _printf
add esp, 8
xor eax, eax
ret