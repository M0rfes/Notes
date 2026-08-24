---
title: "Mission: C17 Systems Mastery via CHIP-8 Emulator"
type: mission
topic: C17
created: 2026-08-22
updated: 2026-08-22
tags:
  - teach/c17
  - mission
  - chip-8
flastcard: "false"
---
[[C17|← C17 MOC]]

# Mission: C17 Systems Mastery via CHIP-8 Emulator

> [!NOTE] Overarching Goal
> Master production-grade ISO C17 systems programming by completing, optimizing, and hardening the [[../../chip-8-emu/c/|CHIP-8 Emulator]] codebase into a high-performance, memory-safe, fully-featured native systems application with modern CMake tooling and sanitizers.

---

## 🎯 Why
Transition from Node.js / web development into low-level systems engineering. Building an emulator in C provides hands-on mastery over the core pillars of systems programming:
- Binary file parsing and endianness reconstruction.
- Low-level bitwise manipulation and opcode instruction decoding.
- Memory architecture, struct alignment, and pointer lifetimes.
- High-frequency CPU execution cycles and timer synchronization.
- Hardware abstraction, pixel framebuffer manipulation, and SDL2 integration.
- Production build systems (CMake), strict diagnostics (`-Wall -Wextra -Wpedantic`), and memory sanitizers (ASan/UBSan).

---

## 🏆 Success Looks Like
- [ ] Transition `chip-8-emu/c` from Makefile to a modern `CMakeLists.txt` with automatic SDL2 finding, strict compiler flags, and ASan/UBSan debug targets.
- [ ] Implement robust ROM loading from disk (`fopen`, `fread`, error handling, size validation, loading to `0x200`).
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
