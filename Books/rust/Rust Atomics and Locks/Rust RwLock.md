---
title: Rust RwLock
type: implementation
status: seed
created: 2026-08-18
tags:
  - rust
  - concurrency
  - locks
  - rwlock
aliases:
  - RwLock in Rust
  - std::sync::RwLock
category: Books/Rust
---

# Reader-Writer Lock in Rust

![[Reader-Writer Lock]]

`std::sync::RwLock`

Where a mutex only lets you take exclusive access even when a shared reference would have been enough, an `RwLock` lets us have one exclusive `&mut T` or multiple shared `&T` references; it does this by `Deref` and `DerefMut` traits. It's a thread-safe version of `RefCell`. `RwLock` is good for data that is read more often than it's written to.

It has `read` and `write` methods that return `RwLockReadGuard` and `RwLockWriteGuard`, respectively. `RwLockReadGuard` only implements `Deref`, and `RwLockWriteGuard` implements both `DerefMut` and `Deref`.

```rust
use std::sync::{Arc, RwLock};
use std::thread;

fn main() {
	let vec = Arc::new(RwLock::new(vec![1, 2, 3]));
	
	let vec1 = vec.clone();
	let t1 = thread::spawn(move || {
		let read_guard = vec1.read().unwrap();
		for n in &read_guard {
			println!("{n}");
		}
	});
		
	let vec2 = vec.clone();	
	let t2 = thread::spawn(move || {
		let mut write_guard = vec2.write().unwrap();
		write_guard.push(4);
	});
	
	t1.join().unwrap();
	t2.join().unwrap();
}
```

We need `Arc` in the above example so we can move the reference to other threads.

```rust
use std::sync::RwLock;
use std::thread;

fn main() {
	let vec = RwLock::new(vec![1, 2, 3]);
	
	thread::scope(|s| {
		s.spawn(|| {
			let read_guard = vec.read().unwrap();
			for n in &read_guard {
				println!("{n}");
			}
		});
				
		s.spawn(|| {
			let mut write_guard = vec.write().unwrap();
			write_guard.push(4);
		});
	});
}
```

Here we don't need `Arc` because a scoped thread finishes execution before the main function ends, so we can drop `vec`.
