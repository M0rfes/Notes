---
title: Rust Statics and Leaking
type: implementation
status: seed
created: 2026-08-18
tags:
  - rust
  - concurrency
  - statics
  - memory
aliases:
  - Statics in Rust
  - Box::leak
category: Books/Rust
---

# Statics in Rust

![[Static Lifetime]]

`'static` is a lifetime that says the value will exist till the end of the program, so any value with a static lifetime can be shared across [[Threads|threads]].

```rust
static X: [i32; 3] = [1, 2, 3];

thread::spawn(|| dbg!(&X));
thread::spawn(|| dbg!(&X));
```

Any variable defined by static exists before `main` and remains until the program ends.

## Leaking with Box::leak

```rust
use std::thread;

fn main() {
	let x: &'static [i32; 3] = Box::leak(Box::new([1, 2, 3]));
	
	thread::spawn(move || dbg!(x));
	thread::spawn(move || dbg!(x));
}
```

We are moving the static reference using the `move` keyword, not the value. `Box::leak` lets us leak a value on the heap, guaranteeing that no one can free it and that it will exist as long as the program runs.
