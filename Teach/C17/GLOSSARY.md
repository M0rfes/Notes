---
title: "C17 Glossary"
type: glossary
topic: "C17"
created: 2026-08-22
updated: 2026-08-25
tags:
  - teach/c17
  - glossary
---

[[C17|← C17 MOC]] · [[MISSION|🎯 Mission]] · [[RESOURCES|📚 Resources]] · [[NOTES|📝 Teacher Notes]]

# C17 Glossary

> [!NOTE] Canonical Language
> Canonical definitions for ISO C17 concepts, memory rules, compiler behaviors, systems architecture, and vault concept mappings.

---

## Language Semantics & Compiler Behaviors

### Undefined Behavior (UB)
Behavior upon use of a non-portable or erroneous construct for which the ISO C standard imposes no requirements; the compiler is free to assume UB never happens and optimize accordingly (which can cause silent miscompilations, crashes, or security vulnerabilities).
- **Vault Concept**: [[Thoughts/Defensive Programming|Concept: Defensive Programming & Invariants]]
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

## Storage Classes, Linkage & Lifetimes

### Variable Linkage
The property of an identifier that determines whether it refers to the same object or function across different translation units (external linkage) or only within the current translation unit (internal linkage).
- **Vault Concept**: [[Coding/Variable Linkage|Concept: Variable Linkage]]
- **Reference**: [[Books/C/Advanced C Programming Course/Storage Classes|Advanced C: Storage Classes]]
- _Avoid_: Scope, pointer exposure

### Internal Linkage
Linkage specified by the `static` keyword at file scope; restricts the identifier's visibility to its own translation unit (`.c` file), preventing name collisions and enforcing modular encapsulation.
- **Vault Concept**: [[Books/C/Advanced C Programming Course/C Static|Concept: C Static]]
- _Avoid_: Private variable, local scope

### External Linkage
Linkage possessed by default file-scope variables and non-static functions, or explicitly declared with `extern`; allows identifiers to be referenced across multiple translation units during the linking phase.
- **Vault Concept**: [[Books/C/Advanced C Programming Course/C Extern|Concept: C Extern]]
- _Avoid_: Public variable, global export

### Automatic Storage Duration
Storage duration where objects are allocated on the function stack frame upon block entry and automatically deallocated upon block exit (`auto` storage class).
- **Vault Concept**: [[Coding/Automatic Storage Duration|Concept: Automatic Storage Duration]]
- **Reference**: [[Books/C/Advanced C Programming Course/C Auto|Concept: C Auto]]
- _Avoid_: Dynamic allocation, heap memory

### Static Storage Duration
Storage duration where an object is allocated in the program's data or BSS segment prior to program startup (`main()`) and persists for the entire program execution lifetime.
- **Vault Concept**: [[Coding/Variable Lifetime|Concept: Variable Lifetime]]
- **Reference**: [[Books/C/Advanced C Programming Course/C Static|Concept: C Static]]
- _Avoid_: Global lifetime, permanent stack

### Register Storage Class
A storage class specifier (`register`) hinting to the compiler that an automatic variable should be stored in a CPU register for fast access; in ISO C, applying the address-of operator (`&`) to a register variable is a compile-time constraint violation.
- **Vault Concept**: [[Coding/Register Storage|Concept: Register Storage]]
- **Reference**: [[Books/C/Advanced C Programming Course/C Register|Concept: C Register]]
- _Avoid_: CPU variable, hardware register

---

## Memory Model, Structs & Pointer Mechanics

### Alignment
A hardware/ABI requirement that an object of a given type be stored at a memory address that is an exact multiple of its size or natural alignment boundary (e.g. a 4-byte `uint32_t` aligned to a multiple of 4).
- **Vault Concept**: [[Grill/C Systems Programming#Round 6: Struct Layout & Alignment|Diagnostic: Struct Memory Layout & Alignment]]
- _Avoid_: Spacing, memory offset

### Struct Padding and Tail Padding
Unused padding bytes inserted automatically by the compiler between struct members (internal padding) and at the end of a struct (tail padding) to ensure members and contiguous array elements maintain natural alignment boundaries.
- **Vault Concept**: [[Grill/C Systems Programming#Round 6: Struct Layout & Alignment|Diagnostic: Struct Padding & Tail Padding]]
- _Avoid_: Dead space, struct gap

### Array Decay
The implicit conversion in C where an expression of array type (`T[N]`) is rewritten by the compiler to a pointer to its first element (`T*`) in almost all expression contexts (except `sizeof`, `_Alignof`, and `&`).
- **Vault Concept**: [[Grill/C Systems Programming#Round 4: Array Decay & `sizeof` Mechanics|Diagnostic: Array Decay]]
- _Avoid_: Pass by reference, array pointer

### Strict Aliasing Rule
A compiler optimization rule stating that two pointers of different types (with specific exceptions like `char*` and `uint8_t*`) cannot point to the same memory location, allowing the compiler to reorder reads/writes across them.
- _Avoid_: Pointer collision, duplicate referencing

### Effective Type
The type assigned to an allocated object in memory that governs which pointer types may legitimately read or write to it under strict aliasing rules.
- _Avoid_: Variable type, cast type

### Type Punning
The practice of accessing a block of memory through a pointer of a different type or through a `union` to reinterpret its raw bit representation.
- _Avoid_: Force casting, byte hacking

### Flexible Array Member (FAM)
An unbounded array defined as the last member of a struct (e.g. `int data[];`), used in C99/C11/C17 to allocate dynamically sized structures in a single contiguous memory block.
- _Avoid_: Zero-length array (`[0]`), trailing pointer

---

## CPU Architecture & Virtual Machine Execution

### Endianness & Big-Endian Opcode Packing
The byte ordering of multi-byte numbers in memory. In big-endian systems (such as CHIP-8 opcodes), the most significant byte is stored at the lowest memory address; 16-bit opcodes are reconstructed via `(mem[PC] << 8) | mem[PC + 1]`.
- **Vault Concept**: [[Emulation/CHIP-8#Fetch|Concept: CHIP-8 Fetch]]
- **Reference**: [[Grill/C Systems Programming#Round 7: Bitwise Operations & Endianness|Diagnostic: Bitwise Operations & Endianness]]
- _Avoid_: Byte flipping, reverse reading

### Jump Table
An array of code addresses or function pointers indexed directly by an integer opcode or event type to achieve $O(1)$ instruction dispatch without branch misprediction cascades.
- **Vault Concept**: [[Grill/C Systems Programming#Round 9: Function Pointers & Jump Tables (Knowledge Frontier)|Diagnostic: Function Pointers & Jump Tables]]
- _Avoid_: Multi-switch, branching ladder

### Direct Threaded Code (Computed Gotos)
An interpreter dispatch technique utilizing compiler extensions (such as GNU C `&&label` and `goto *ptr`) where every opcode instruction routine handles its own dispatching directly to the next handler, eliminating the central loop switch and reducing CPU branch predictor pipeline stalls.
- **Vault Concept**: [[Coding/Computed Gotos in C (Direct Threaded Code)|Concept: Computed Gotos in C (Direct Threaded Code)]]
- _Avoid_: Multi-threading, threaded execution

---

## Diagnostics & Tooling

### AddressSanitizer (ASan)
A fast memory error detector tool (enabled via `-fsanitize=address`) that instruments memory accesses at compile-time to detect out-of-bounds accesses, use-after-free, double-free, and leaks.
- **Vault Concept**: [[Reference/Modern C17 Toolchain and CMake|Reference: Modern C17 Toolchain & CMake]]
- _Avoid_: Valgrind replacement, leak detector

### UndefinedBehaviorSanitizer (UBSan)
A compile-time instrumentation tool (enabled via `-fsanitize=undefined`) that catches undefined behaviors at runtime such as signed integer overflow, null pointer dereference, and misaligned pointers.
- **Vault Concept**: [[Reference/Modern C17 Toolchain and CMake|Reference: Modern C17 Toolchain & CMake]]
- _Avoid_: Linter, static checker
