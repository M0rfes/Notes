---
title: Rust Arc
type: implementation
status: seed
created: 2026-08-18
tags:
  - rust
  - concurrency
  - reference-counting
  - smart-pointers
  - atomics
aliases:
  - Arc in Rust
  - std::sync::Arc
category: Books/Rust
---

# Arc in Rust

![[Atomic Reference Counting]]

`std::sync::Arc`: `Arc` stands for Atomically Reference Counted; it's the same as `Rc`, with a guarantee that any increment/decrement operation on `Arc` is [[Atomic Operations|atomic]], i.e., no two [[Threads|threads]] can simultaneously mutate the count.

To get the count of references, use `std::sync::Arc::strong_count` and `std::sync::Arc::get_mut` to get a mutable reference.

```rust
use std::sync::Arc;

fn main() {
	let mut num = Arc::new(45);
	if let Some(val) = Arc::get_mut(&mut num) {
		*val = 42;
	}
	
	println!("{num:?}");
}
```
