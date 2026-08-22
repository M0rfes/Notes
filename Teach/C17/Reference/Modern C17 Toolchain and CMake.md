---
title: "Modern C17 Toolchain and CMake Reference"
type: reference
topic: "C17"
created: 2026-08-22
tags:
  - teach/c17
  - reference
  - cmake
  - toolchain
---

[[../C17|← C17 MOC]] · [[../MISSION|🎯 Mission]]

# Modern C17 Toolchain & CMake Reference

> [!NOTE] Production Standards
> Professional C projects require strict compiler diagnostics, automated address/undefined behavior sanitizers, and standard build automation.

---

## 1. Production `CMakeLists.txt` Template (C17)

```cmake
cmake_minimum_required(VERSION 3.20)
project(c17_systems_project C)

# Enforce ISO C17 Standard
set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF) # Disable non-standard compiler extensions

# Export compile commands for clangd / LSP
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Source and Target Configuration
add_executable(app src/main.c)

# Strict Compiler Warnings
target_compile_options(app PRIVATE
    -Wall
    -Wextra
    -Wpedantic
    -Wshadow
    -Wconversion
    -Wdouble-promotion
    -Wformat=2
    -Wundef
    -Wstrict-prototypes
    -Wmissing-prototypes
)

# Debug & Sanitizer Configuration
option(ENABLE_SANITIZERS "Enable ASan and UBSan" ON)
if(ENABLE_SANITIZERS AND CMAKE_BUILD_TYPE MATCHES "Debug")
    target_compile_options(app PRIVATE -fsanitize=address,undefined -fno-omit-frame-pointer -g)
    target_link_options(app PRIVATE -fsanitize=address,undefined)
endif()
```

---

## 2. CLI Build & Run Workflow

```bash
# 1. Configure debug build with Ninja or Make
cmake -B build -DCMAKE_BUILD_TYPE=Debug

# 2. Compile targets
cmake --build build

# 3. Execute with live Sanitizer detection
./build/app
```

---

## 3. Essential Compiler Diagnostic Flags

| Flag | Purpose | Why it matters in C17 |
| :--- | :--- | :--- |
| `-Wall -Wextra -Wpedantic` | Baseline warning suite | Catches non-standard extensions and common errors. |
| `-Wshadow` | Variable shadowing | Prevents inner scope variables from hiding outer scope variables. |
| `-Wconversion` | Implicit type conversions | Prevents silent truncations (e.g. `uint64_t` into `uint32_t`). |
| `-Wstrict-prototypes` | Enforce empty parameter prototypes | In C, `void foo()` means *unspecified arguments*; `void foo(void)` is required. |
| `-fsanitize=address` | AddressSanitizer (ASan) | Catches buffer overflows, use-after-free, double-frees at runtime. |
| `-fsanitize=undefined` | UndefinedBehaviorSanitizer (UBSan) | Catches signed overflow, null pointer dereferencing, alignment faults. |
