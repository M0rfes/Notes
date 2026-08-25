---
title: "C17 Teacher Notes"
type: notes
topic: "C17"
created: 2026-08-22
updated: 2026-08-25
tags:
  - teach/c17
  - notes
  - chip-8
---

[[C17|← C17 MOC]] · [[MISSION|🎯 Mission]] · [[GLOSSARY|📖 Glossary]] · [[RESOURCES|📚 Resources]]

# Teacher Notes & Project Context: CHIP-8 in C17

## Active Codebase Inspection
- **Repository**: `/Users/morfes/projects/chip-8-emu/c` (`git@github.com:M0rfes/chip8_emu.git`)
- **Specification Reference**: [[Emulation/CHIP-8|Vault CHIP-8 Specifications & Opcode Reference]]
- **Diagnostic Baseline**: [[Grill/C Systems Programming|C Systems Diagnostic Session]]
- **Current Modules**:
  - `include/chip8.h` / `src/chip8.c`: Main `Chip8` composite struct (`Memory`, `Registers`, `Stack`, `Keyboard`, `Screen`).
  - `include/memory.h` / `src/memory.c`: 4KB RAM buffer (`0x000` to `0xFFF`) with getter/setter.
  - `include/registers.h` / `src/registers.c`: 16 general-purpose 8-bit registers (`V0`-`VF`), 16-bit index register `I`, program counter `PC`, delay/sound timers.
  - `include/stack.h` / `src/stack.c`: 16-level call stack and stack pointer `SP`.
  - `include/screen.h` / `src/screen.c`: 64x32 2D boolean pixel matrix.
  - `include/keyboard.h` / `src/keyboard.c`: 16-key keypad state and translation from SDL keys.
  - `src/main.c`: SDL2 window creation, event loop, and primitive per-pixel drawing loop.
  - `Makefile`: Basic Clang build with `-Wall -Wextra -Wpedantic -std=c17`.

---

## Key Pedagogical Objectives on this Codebase

1. **Toolchain Upgrade**:
   - Modern `CMakeLists.txt` with `find_package(SDL2 REQUIRED)`, compile commands export for clangd, and `-fsanitize=address,undefined` (as detailed in [[Reference/Modern C17 Toolchain and CMake|Toolchain Reference]]).

2. **Binary ROM Loader (I/O & Memory Safety)**:
   - Replace hardcoded test state with safe binary file reading, file size validation, and loading into RAM at offset `0x200` ([[Reference/Standard IO and Binary File Streams|Standard I/O Reference]]).
   - Ground in [[Thoughts/Defensive Programming|Defensive Programming]] and strict error return values.

3. **Opcode Fetch-Decode-Execute Engine**:
   - Fetching 16-bit big-endian instructions from memory (`(mem[PC] << 8) | mem[PC + 1]`) following [[Grill/C Systems Programming#Round 7: Bitwise Operations & Endianness|Bitwise Opcode Reconstruction]].
   - Bitwise nibble masking (`0xF000`, `0x0F00`, `0x00F0`, `0x000F`, `0x00FF`, `0x0FFF`) mapped to 35 opcodes.
   - Implementing function pointer dispatch tables vs switch structures vs [[Coding/Computed Gotos in C (Direct Threaded Code)|direct threaded code]].

4. **Performance & Architecture Refactoring**:
   - Streamline SDL2 rendering using `SDL_Texture` streaming or a 32-bit pixel buffer instead of individual `SDL_RenderFillRect` calls per set pixel.
   - Refactor pass-by-value struct instances to clean pointer-based initializers (`void chip8_init(Chip8 *chip8)`).
   - Ensure const-correctness and eliminate `assert` in favor of defensive error codes for runtime failures.
