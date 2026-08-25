---
title: "LR-0002: CHIP-8 Codebase Audit & Architecture Baseline"
type: learning-record
topic: "C17"
created: 2026-08-22
updated: 2026-08-25
status: active
tags:
  - teach/c17
  - learning-record
  - chip-8
---

[[Teach/C17/C17|← C17 MOC]] · [[Teach/C17/MISSION|🎯 Mission]] · [[Teach/C17/GLOSSARY|📖 Glossary]]

# LR-0002: CHIP-8 Codebase Audit & Architecture Baseline

The learner has established a multi-module C17 project for a CHIP-8 emulator at `/Users/morfes/projects/chip-8-emu/c` with modular headers and source files for memory, registers, stack, keyboard, screen, and an SDL2 event loop.

---

## 🔍 Evidence
- Inspected `/Users/morfes/projects/chip-8-emu/c` containing `include/` headers and `src/` implementations with `-std=c17` Makefile.
- Core data structures (`Memory`, `Registers`, `Stack`, `Screen`, `Keyboard`, `Chip8`) match the requirements in [[Emulation/CHIP-8|CHIP-8 Specifications]].

---

## 🚀 Implications for Curriculum
- Ground all forthcoming lessons in completing and hardening the CHIP-8 emulator.
- Immediate priorities:
  1. **Lesson 0001 / Toolchain Refactor**: Modern CMake with SDL2 resolution and Address/UndefinedBehavior sanitizers ([[Teach/C17/Reference/Modern C17 Toolchain and CMake|Toolchain Reference]]).
  2. **Lesson 0002**: Safe Binary File I/O & ROM Loading (Loading ROMs to `0x200` with boundary checks, documented in [[Teach/C17/Reference/Standard IO and Binary File Streams|Standard I/O Reference]]).
  3. **Lesson 0003**: 16-Bit Big-Endian Opcode Fetching & Bitwise Instruction Decoding ([[Grill/C Systems Programming#Round 7: Bitwise Operations & Endianness|Bitwise Diagnostics]]).
  4. **Lesson 0004**: Instruction Execution & Dispatch Tables (Jump tables vs [[Coding/Computed Gotos in C (Direct Threaded Code)|direct threaded code]]).
  5. **Lesson 0005**: 60Hz Timers, Cycle Throttling & Fast SDL Texture Streaming.
