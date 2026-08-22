---
title: Lock Poisoning
type: implementation
status: seed
created: 2026-08-18
tags:
  - rust
  - concurrency
  - locks
aliases:
  - Lock Poisoning in Rust
category: Books/Rust
---

# Lock Poisoning in Rust

![[Lock Poisoning]]

The call to `unwrap` at the end of each lock call should tell you the locking operation returns a `Result` type. If a thread panics while holding the lock, subsequent calls to lock for read and write will result in errors. The lock still behaves as it should, i.e. putting other threads to sleep, but no data will be returned from the lock.
