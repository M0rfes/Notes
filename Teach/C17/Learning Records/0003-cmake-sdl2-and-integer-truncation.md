---
title: "LR-0003: CMake SDL2 Resolution & Integer Precision Diagnostics"
type: learning-record
topic: "C17"
created: 2026-08-22
status: active
tags:
  - teach/c17
  - learning-record
  - cmake
---

[[../C17|← C17 MOC]] · [[../MISSION|🎯 Mission]] · [[../Lessons/0001-c17-standards-and-modern-toolchain|Lesson 0001]]

# LR-0003: CMake SDL2 Resolution & Integer Precision Diagnostics

Configuring CMake with both `find_package(SDL2)` and `pkg-config` fallback successfully resolves SDL2 headers on macOS (Homebrew `/opt/homebrew/include/SDL2`) and Linux. Enabling `-Wconversion` immediately flagged an implicit integer truncation bug in `src/main.c` where `SDL_Keycode` (32-bit integer) was assigned to `char` (8-bit integer).

---

## 🔍 Evidence
- `CMakeLists.txt` successfully compiled all 7 object files and linked `./build/chip8` with ASan/UBSan instrumentation.
- Compiler emitted `-Wimplicit-int-conversion` on `src/main.c:41:39`.

---

## 🚀 Implications for Curriculum
- Transition to `Lesson 0002`: Safe Binary File I/O & ROM Loading into RAM at `0x200`.
- Teach integer sizing (`int32_t` vs `char` vs `uint8_t`) and avoid implicit narrowing casts.
