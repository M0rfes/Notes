---
title: C17 Resources
type: resources
topic: C17
created: 2026-08-22
updated: 2026-08-25
tags:
  - teach/c17
  - resources
flashcard: "false"
---

[[C17|← C17 MOC]] · [[MISSION|🎯 Mission]] · [[GLOSSARY|📖 Glossary]] · [[NOTES|📝 Teacher Notes]]

# C17 Resources

> [!NOTE] Curation Standards
> Only high-trust ISO standards, authoritative systems literature, official documentation, and curated practitioner communities are listed here.

---

## 📚 Knowledge (Primary Sources & Textbooks)

- [ISO C17 Standard Draft (N2176)](https://www.open-std.org/jtc1/sc22/wg14/www/docs/n2176.pdf)
  - **Use for**: The ultimate authoritative specification for language semantics, grammar, and standard library guarantees.
- [Book: _Modern C_ by Jens Gustedt (Inria)](https://modernc.gforge.inria.fr/)
  - **Use for**: Idiomatic modern C (C11/C17/C23), type safety, memory models, modularity, and avoiding historical antipatterns.
- [Book: _Effective C_ by Robert C. Seacord](https://nostarch.com/Effective_C)
  - **Use for**: Professional defensive programming, dynamic memory security, integer conversion safety, and undefined behavior prevention.
- [SEI CERT C Coding Standard](https://wiki.sei.cmu.edu/confluence/display/c/SEI+CERT+C+Coding+Standard)
  - **Use for**: Comprehensive rules and security guidelines to avoid software vulnerabilities.
- [Beej's Guide to C Programming](https://beej.us/guide/bgc/) & [Beej's Guide to Network Programming](https://beej.us/guide/bgnet/)
  - **Use for**: Practical systems programming, socket communication, and POSIX system calls.
- [Cppreference C Reference](https://en.cppreference.com/w/c)
  - **Use for**: Quick, searchable standard library API lookup and behavior guarantees.

---

## 🌐 Vault Knowledge Connections

### Emulation & VM Specifications
- [[Emulation/CHIP-8|CHIP-8 Hardware Specifications & Instruction Set]]: Reference for memory map, timer rates, keypad layout, and opcode decoding logic.
- [[Coding/Computed Gotos in C (Direct Threaded Code)|Computed Gotos & Direct Threaded Code]]: C compiler extension for branch-prediction-friendly interpreter dispatch.

### C Language Storage Classes & Scoping
- [[Books/C/Advanced C Programming Course/Storage Classes|Advanced C: Storage Classes Hub]]: Core reference on scope, linkage, and lifetime.
- [[Books/C/Advanced C Programming Course/C Static|Advanced C: Static Storage Class]]: Internal linkage across translation units and persistent local state.
- [[Books/C/Advanced C Programming Course/C Extern|Advanced C: Extern Storage Class]]: External symbol resolution in multi-file C programs.
- [[Books/C/Advanced C Programming Course/C Register|Advanced C: Register Storage Class]]: CPU register hint semantics and `&` constraint violations.
- [[Books/C/Advanced C Programming Course/C Auto|Advanced C: Auto Storage Class]]: Automatic storage duration and stack frames.
- [[Coding/Variable Linkage|Concept: Variable Linkage]]: Multi-file symbol visibility rules.
- [[Coding/Variable Scope|Concept: Variable Scope]]: Block vs File vs Function Prototype scopes.
- [[Coding/Variable Lifetime|Concept: Variable Lifetime]]: Stack vs Static Data Segment object duration.
- [[Coding/Register Storage|Concept: Register Storage]]: Register optimization requests.
- [[Coding/Automatic Storage Duration|Concept: Automatic Storage Duration]]: Stack allocation mechanics.

### Diagnostic Benchmarks & Software Design
- [[Grill/C Systems Programming|Grilling Diagnostic: C Systems Programming Knowledge]]: Stress-tested diagnostic covering storage classes, array decay, sizeof units, struct alignment, big-endian bitwise packing, and jump tables.
- [[Thoughts/Defensive Programming|Defensive Programming & Runtime Invariants]]: Defensive error checking, pointer validation, and deterministic crash prevention.
- [[Thoughts/Function Abstration|Function Abstraction & Local Reasoning]]: Deep modularity and interface isolation.

### Advanced Memory Models & Concurrency (Comparative Study)
- [[Coding/Concurrency/Concurrency|Concurrency Fundamentals]]
- [[Coding/Concurrency/Mutex|Mutex Architecture & Invariants]]
- [[Coding/Concurrency/Memory Ordering|CPU Memory Ordering & Memory Barriers]]
- [[Books/rust/Rust Atomics and Locks/Basics of Rust Concurrency|Mara Bos - Concurrency & Low-Level Memory Notes]]

---

## 👥 Wisdom (Communities & Practice)

- [Reddit: r/C_Programming](https://reddit.com/r/C_Programming)
  - **Use for**: Code reviews, performance analysis, systems architecture questions, and compiler edge cases.
- [Stack Overflow (C Tag)](https://stackoverflow.com/questions/tagged/c)
  - **Use for**: Specific diagnostic questions and ISO standard clause interpretation.
- [Lobste.rs Systems Tag](https://lobste.rs/t/c)
  - **Use for**: High-signal engineering discussions on native systems software.
- [EmuDev Discord & /r/EmuDev](https://reddit.com/r/EmuDev)
  - **Use for**: Emulator developer test suites, timing edge cases, and test ROM verification.

---

## ⚠️ Knowledge Gaps

- *None currently identified. C17 toolchain and ISO specifications are fully standardized.*

---

## 👤 Learner Preferences

- Background in Node.js with working familiarity with Go and Rust.
- Prefers deep, rigorous understanding of the memory model, low-level mechanics, and job-readiness over surface-level tutorials.
- Targets macOS and Linux using CMake, Clang, and GCC.
