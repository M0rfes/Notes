---
title: Rust Atomics
type: implementation
status: seed
created: 2026-08-18
tags:
  - rust
  - concurrency
  - atomics
aliases:
  - Atomics in Rust
category: Books/Rust
---

# Atomics in Rust

![[Atomic Operations]]

Two [[Threads|threads]] can update an `AtomicI32` without creating an inconsistent state in which both reads return the same value and update it at the same time.

The implementation of atomics and which ones are available depends on the system architecture and OS.

Unlike other types, we don't have an `Atomic<T>`; we only get `AtomicBool`, `AtomicI32`, etc., up to the word size, i.e., `AtomicUsize`.
