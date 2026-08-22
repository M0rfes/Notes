---
title: "C17 Glossary"
type: glossary
topic: "C17"
created: 2026-08-22
tags:
  - teach/c17
  - glossary
---

[[C17|← C17 MOC]]

# C17 Glossary

> [!NOTE] Canonical Language
> Canonical definitions for ISO C17 concepts, memory rules, compiler behaviors, and systems vocabulary.

---

## Language Semantics & Compiler Behaviors

### Undefined Behavior (UB)
Behavior upon use of a non-portable or erroneous construct for which the ISO C standard imposes no requirements; the compiler is free to assume UB never happens and optimize accordingly (which can cause silent miscompilations, crashes, or security vulnerabilities).
- _Avoid_: Random error, crash behavior, compiler glitch

### Implementation-Defined Behavior
Unspecified behavior where each conforming implementation (compiler + OS target) must document how the choice is made (e.g. size of `long`, representation of signed negative numbers).
- _Avoid_: Undefined behavior, portable choice

### Unspecified Behavior
Behavior where the standard provides two or more possibilities and imposes no requirement on which is chosen in any instance (e.g. order of evaluation of function arguments).
- _Avoid_: Undefined behavior

### Sequence Point
A point in the execution sequence at which all side effects of previous evaluations are complete and no side effects from subsequent evaluations have taken place (in C11/C17 formalized as the "sequenced-before" partial order).
- _Avoid_: Execution step, clock tick

---

## Memory Model & Pointer Mechanics

### Strict Aliasing Rule
A compiler optimization rule stating that two pointers of different types (with specific exceptions like `char*`) cannot point to the same memory location, allowing the compiler to reorder reads/writes across them.
- _Avoid_: Pointer collision, duplicate referencing

### Effective Type
The type assigned to an allocated object in memory that governs which pointer types may legitimately read or write to it under strict aliasing rules.
- _Avoid_: Variable type, cast type

### Type Punning
The practice of accessing a block of memory through a pointer of a different type or through a `union` to reinterpret its raw bit representation.
- _Avoid_: Force casting, byte hacking

### Alignment
A requirement that an object of a given type be stored at a memory address that is a multiple of a certain integer value (e.g., a 4-byte integer aligned to an address divisible by 4).
- _Avoid_: Spacing, memory offset

### Struct Padding
Unused bytes inserted automatically by the compiler between struct members or at the end of a struct to ensure each member conforms to its architecture's alignment requirements.
- _Avoid_: Dead space, struct gap

### Flexible Array Member (FAM)
An unbounded array defined as the last member of a struct (e.g. `int data[];`), used in C99/C11/C17 to allocate dynamically sized structures in a single contiguous memory block.
- _Avoid_: Zero-length array (`[0]`), trailing pointer

---

## Diagnostics & Tooling

### AddressSanitizer (ASan)
A fast memory error detector tool (enabled via `-fsanitize=address`) that instruments memory accesses at compile-time to detect out-of-bounds accesses, use-after-free, double-free, and leaks.
- _Avoid_: Valgrind replacement, leak detector

### UndefinedBehaviorSanitizer (UBSan)
A compile-time instrumentation tool (enabled via `-fsanitize=undefined`) that catches undefined behaviors at runtime such as signed integer overflow, null pointer dereference, and misaligned pointers.
- _Avoid_: Linter, static checker
