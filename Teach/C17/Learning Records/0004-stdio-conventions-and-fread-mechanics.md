---
title: "LR-0004: Standard I/O Return Conventions & fread Parameters"
type: learning-record
topic: "C17"
created: 2026-08-22
updated: 2026-08-25
status: active
tags:
  - teach/c17
  - learning-record
  - stdio
---

[[Teach/C17/C17|← C17 MOC]] · [[Teach/C17/MISSION|🎯 Mission]] · [[Teach/C17/Reference/Standard IO and Binary File Streams|Standard I/O Reference]]

# LR-0004: Standard I/O Return Conventions & `fread` Parameters

Clarified low-level C standard I/O semantics: `fseek` uses the Unix status return convention where `0` indicates success and non-zero indicates error. `fread` parameter separation (`size` of single element vs `nmemb` count) enables structured record-based reading where the return value represents the count of complete records transferred rather than raw bytes.

---

## 🔍 Evidence
- Investigated `fseek` return guarantees (`!= 0`) and decomposed the 4 parameters of `fread` for both raw byte buffers and structured record arrays.
- Corroborated with [[Thoughts/Defensive Programming|Defensive Programming Invariants]] to avoid silent stream errors.

---

## 🚀 Implications for Curriculum
- Documented canonical rules in [[Teach/C17/Reference/Standard IO and Binary File Streams|Standard I/O Reference]].
- Applied directly in [[Teach/C17/Lessons/0002-binary-file-io-and-rom-loading|Lesson 0002: Safe Binary File I/O & ROM Loading into Memory at 0x200]].
- Solid foundation set for binary file parsing and memory buffer manipulation in [[Emulation/CHIP-8|CHIP-8 Emulation]].
