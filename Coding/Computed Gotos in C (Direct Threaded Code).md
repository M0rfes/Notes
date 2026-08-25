---
title: Computed Gotos in C (Direct Threaded Code)
type: concept
status: seed
created: 2026-08-25
updated: 2026-08-25
tags:
  - c
  - compilers
  - performance
  - virtual-machine
  - interpreters
  - emulation
aliases:
  - Computed Gotos
  - Labels as Values
  - Direct Threaded Code
---

> **Computed Gotos** (also known as "labels as values") are a non-standard [[Teach/C17/C17|C language]] extension, primarily supported by [[Teach/C17/Reference/Modern C17 Toolchain and CMake|compilers like GCC and Clang]]. They allow you to take the memory address of a C label, store it in a pointer, and jump to it dynamically.

This feature is historically the secret weapon behind many high-performance [[Emulation/CHIP-8|Virtual Machines (VMs)]] and [[Teach/C17/Lessons/0001-c17-standards-and-modern-toolchain|interpreters]], such as CPython and various [[Emulation/CHIP-8|game console emulators]], often yielding a 15-25% performance boost over a standard `switch` statement.

## 1. The Syntax

Computed gotos combine two operations:
1. **Taking the address of a label:** Accomplished using the `&&` operator.
2. **Jumping to a pointer:** Accomplished using `goto *pointer;`.

```c
// Create an array mapping opcodes to their label addresses
static void* dispatch_table[] = { &&op_halt, &&op_add, &&op_sub };

// Fetch an opcode (e.g., 1 for op_add)
uint8_t opcode = fetch();

// Jump dynamically based on the index
goto *dispatch_table[opcode];

op_halt:
    return;
op_add:
    // Do addition...
op_sub:
    // Do subtraction...
```

## 2. The Problem: The Central Dispatch Bottleneck

To understand _why_ computed gotos are useful, we first have to look at how a standard interpreter loop is written using an infinite `while` loop and a `switch` statement.

```c
while (running) {
    uint8_t opcode = fetch();
    switch (opcode) {
        case 0x01: 
            // handle add
            break;
        case 0x02:
            // handle sub
            break;
    }
}
```

While modern compilers optimise the switch into a highly efficient O(1) [[Grill/C Systems Programming|jump table]], the CPU's **Branch Predictor** struggles with the overarching loop.
Because every single instruction loops back to the _same_ central `switch` header, the branch target is constantly changing based on the input stream. The CPU cannot confidently predict where the `switch` will jump next.

When the CPU guesses wrong, it suffers a **pipeline stall**. It has to throw away the instructions it pre-fetched, clear its pipeline, and start over from the correct address.

## 3. The Solution: Direct Threaded Code

Computed gotos allow you to implement a pattern called **Direct Threaded Code**. Instead of returning to a central `while` loop to dispatch instructions, _every instruction handles its own dispatching_.

```c
static void* dispatch_table[] = { &&op_halt, &&op_add, &&op_sub };

// A macro makes the code much cleaner to write
#define DISPATCH() goto *dispatch_table[fetch()]

// Initial jump to start the VM
DISPATCH();

op_halt:
    return;
op_add:
    // Handle add...
    
    // Jump directly to the next instruction
    DISPATCH(); 

op_sub:
    // Handle sub...
    DISPATCH();
```

Notice what is missing: **there is no central loop and no `switch` statement.**
This architectural difference is stark. In the diagram below, notice how direct threaded code (bottom) jumps directly from instruction to instruction, bypassing the central `while-switch` bottleneck (top).

## 4. Why It Is Faster

By decentralizing the jumps, computed gotos map incredibly well to how modern CPU hardware works:
1. **Decentralized Prediction:** Instead of one central dispatch point having to predict the entire program's flow, _each opcode_ gets its own jump point. If a `COMPARE` opcode is usually followed by a `JUMP` opcode in your virtual machine, the CPU's branch predictor learns the behavior of that specific path and pre-fetches correctly.
2. **No Bounds Checking:** A C `switch` statement must generate fallback logic (like a hidden `default` bounds check) to satisfy the ISO C standard, even if you don't explicitly write one. Computed gotos bypass this standard, assuming the developer manages the bounds, resulting in fewer executed instructions per cycle.

You can interact with this simulation to see exactly how Direct Threaded Code bypasses the central loop and reduces pipeline prediction misses:

## 5. Drawbacks and Considerations

While powerful, computed gotos come with specific trade-offs:
- **Portability:** Because they are a GNU C extension, they are not part of the standard ISO C specification. Compilers like MSVC (Microsoft Visual C++) do not support them.
- **Code Duplication:** You have to write the fetch-and-dispatch logic at the end of every single label, which is why developers almost universally hide it behind a `DISPATCH()` macro.
- **Control Flow Graph Complexity:** It creates a highly intertwined control flow graph that can make step-through debugging more confusing compared to a standard loop.
