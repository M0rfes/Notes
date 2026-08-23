---
title: Scoped Threads
type: implementation
status: seed
created: 2026-08-18
updated: 2026-08-18
tags:
  - rust
  - concurrency
  - threads
aliases:
  - Scoped Threads in Rust
  - std::thread::scope
category: Books/Rust
---

# Scoped Threads in Rust

![[Scoped Threads]]

`std::thread::scope` is used to spawn threads that finish execution before the scope is exited; this lets us borrow local variables.

```rust
use std::thread;

fn main() {
	let list = Vec::from_iter(0..=1000);
	thread::scope(|s| {
		s.spawn(|| {
			println!("{}", list.len());
		});
		
		s.spawn(|| {
			for n in &list {
				println!("{n}");
			}
		});
	});
}
```

The 2 threads above can reference the `list` because it outlives their scope. All the threads spawned in the callback to `std::thread::scope` will be joined before the function exits. The above code works because both references are read references. If we were to call `list.push(1001)` in any of the threads, the code wouldn't compile because we can only have one mutable reference, while multiple read references are allowed. Note that it doesn't mean we have one mutable reference and multiple read references; we can have only one at a time.
