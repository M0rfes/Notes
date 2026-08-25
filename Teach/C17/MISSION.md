---
title: "Mission: C17 Systems Mastery via CHIP-8 Emulator"
type: mission
topic: C17
created: 2026-08-22
updated: 2026-08-25
tags:
  - teach/c17
  - mission
  - chip-8
---

[[C17|← C17 MOC]] · [[GLOSSARY|📖 Glossary]] · [[RESOURCES|📚 Resources]] · [[NOTES|📝 Teacher Notes]]

# Mission: C17 Systems Mastery via CHIP-8 Emulator

> [!NOTE] Overarching Goal
> Master production-grade ISO C17 systems programming by completing, optimizing, and hardening the [[Emulation/CHIP-8|CHIP-8 Emulator]] codebase into a high-performance, memory-safe, fully-featured native systems application with modern CMake tooling and sanitizers.

---

## 🎯 Why
Transition from Node.js / web development into low-level systems engineering. Building an emulator in C provides hands-on mastery over the core pillars of systems programming:
- **Binary file parsing & endianness reconstruction**: Safe stream processing, boundary validation, and loading ROMs directly into memory at `0x200`.
- **Low-level bitwise manipulation & opcode decoding**: Masking nibbles (`0xF000`, `0x0F00`, `0x0FFF`) to decode and dispatch 35 instructions.
- **Memory architecture & pointer lifetimes**: Struct alignment, tail padding, and memory layout mapped in [[Grill/C Systems Programming|C Knowledge Diagnostics]].
- **High-frequency CPU execution cycles**: Dispatching via function pointer jump tables or [[Coding/Computed Gotos in C (Direct Threaded Code)|direct threaded code]] and 60Hz timer synchronization.
- **Hardware abstraction & pixel framebuffer manipulation**: SDL2 texture streaming and bitwise XOR graphics rendering.
- **Production build systems & diagnostics**: CMake build automation, strict warnings (`-Wall -Wextra -Wpedantic`), [[Thoughts/Defensive Programming|defensive programming]], and dynamic runtime sanitizers (ASan/UBSan).

---

## 🏆 Success Looks Like
- [ ] Transition `chip-8-emu/c` from Makefile to a modern `CMakeLists.txt` with automatic SDL2 finding, strict compiler flags, and ASan/UBSan debug targets.
- [ ] Implement robust ROM loading from disk (`fopen`, `fread`, error handling, size validation, loading to `0x200` as specified in [[Emulation/CHIP-8#Memory|CHIP-8 Memory Specs]]).
- [ ] Build the complete 35-opcode instruction decoding and execution engine using clean C17 idioms (bitmask extraction and function pointer jump tables).
- [ ] Implement 60Hz Delay and Sound timers synchronized with the emulation cycle.
- [ ] Optimize the XOR graphics rendering engine (`DXYN`) and screen buffer with SDL2 texture streaming.
- [ ] Eliminate all potential Undefined Behavior (UB), integer overflow bugs, and pointer bugs, verified with AddressSanitizer.
- [ ] Add an interactive CLI disassembler / debugger mode for stepping through ROM instructions.

---

## ⚙️ Constraints & Environment
- **Project Path**: `/Users/morfes/projects/chip-8-emu/c` (`git@github.com:M0rfes/chip8_emu.git`).
- **Standard**: ISO C17 (`-std=c17`).
- **Platforms**: macOS (Apple Silicon / Clang) & Linux (x86_64 / GCC & Clang).
- **Libraries**: SDL2 for graphics/audio/input.
- **Build System**: CMake.
- **Core Reference**: [[Emulation/CHIP-8|Vault CHIP-8 Specification]].
