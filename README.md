# Win64 Egg Hunter Research

This repository documents my ongoing research into implementing reliable **Egg Hunters** for Windows x64 environments.

### Project Scope
Developing position-independent shellcode (PIC) for Win64 presents unique challenges compared to x86, particularly regarding **stability** and **memory fault handling**.

### Current Implementation: `egghunter_research.asm`
This version focuses on the core search logic:
- **Efficient Scanning:** Uses page-alignment (4096 bytes) to speed up memory traversal.
- **Double-Tagging:** Implements an 8-byte signature to avoid false positives during scanning.
- **Correction Logic:** Includes proper pointer adjustment (`add rdx, 8`) to ensure the execution flow jumps directly to the payload, bypassing the EGG signature.

### Technical Disclaimer
This is a **research-oriented** stub. In real-world scenarios, direct memory access can trigger `STATUS_ACCESS_VIOLATION`. Future iterations will explore SEH (Structured Exception Handling) or PEB-based function resolution to create a crash-proof hunter.

---
*For educational and authorized security testing purposes only.*
