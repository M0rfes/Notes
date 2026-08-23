---
title: Static Lifetime
type: concept
status: seed
created: 2026-08-18
updated: 2026-08-18
tags:
  - concurrency
  - memory
aliases:
  - Statics
  - Static Variables
---

# Static Lifetime

A static lifetime means the value will exist until the end of the program, so any value with a static lifetime can be shared across [[Threads|threads]].

Any variable declared static exists before main and remains in scope until the program ends. Values can also be leaked on the heap to guarantee they exist for the program's entire duration.
