---
title: Register Storage
type: concept
status: seed
created: 2026-08-23
updated: 2026-08-23
tags:
  - c
  - memory
  - storage-classes
aliases:
  - Register Storage Class
  - CPU Registers
---
# Register Storage

Register modifiers tell the compiler to place the variable in a CPU register instead of RAM. The compiler still can choose not to do that for the sake of optimisation. It's more like a request. While a whole struct can have a register modifier, one field of a struct can't have the register modifier.
