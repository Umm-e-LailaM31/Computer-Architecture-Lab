global _WinMain@16
extern _AllocConsole@0
extern _GetStdHandle@4
extern _WriteFile@20

section .data
message db "Direct-mapped cache conflict\r\nTwo addresses mapping to the same cache line can conflict\r\n"
message_len equ $-message
written dd 0

section .text
_WinMain@16:
    push ebp
    mov ebp, esp
    call _AllocConsole@0
    push dword -11
    call _GetStdHandle@4
    push dword 0
    push dword written
    push dword message_len
    push dword message
    push eax
    call _WriteFile@20
    xor eax, eax
    mov esp, ebp
    pop ebp
    ret 16
