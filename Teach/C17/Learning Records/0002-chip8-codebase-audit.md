---
title: "LR-0002: CHIP-8 Codebase Audit & Architecture Baseline"
type: learning-record
topic: "C17"
created: 2026-08-22
updated: 2026-08-22
status: active
tags:
  - teach/c17
  - learning-record
  - chip-8
---
[[../C17|← C17 MOC]] · [[../MISSION|🎯 Mission]]

# LR-0002: CHIP-8 Codebase Audit & Architecture Baseline

The learner has established a multi-module C17 project for a CHIP-8 emulator at `/Users/morfes/projects/chip-8-emu/c` with modular headers and source files for memory, registers, stack, keyboard, screen, and an SDL2 event loop.

---

## 🔍 Evidence
- Inspected `/Users/morfes/projects/chip-8-emu/c` containing `include/` headers and `src/` implementations with `-std=c17` Makefile.
- Core data structures (`Memory`, `Registers`, `Stack`, `Screen`, `Keyboard`, `Chip8`) are already laid out.

---

## 🚀 Implications for Curriculum
- Ground all forthcoming lessons in completing and hardening the CHIP-8 emulator.
- Immediate priorities:
  1. **Lesson 0001 / Toolchain Refactor**: Modern CMake with SDL2 resolution and Address/UndefinedBehavior sanitizers.
  2. **Lesson 0002**: Safe Binary File I/O & ROM Loading (Loading ROMs to `0x200` with boundary checks).
  3. **Lesson 0003**: 16-Bit Big-Endian Opcode Fetching & Bitwise Instruction Decoding.
  4. **Lesson 0004**: Instruction Execution & Dispatch Tables (Jump tables vs nested switches).
  5. **Lesson 0005**: 60Hz Timers, Cycle Throttling & Fast SDL Texture Streaming.
