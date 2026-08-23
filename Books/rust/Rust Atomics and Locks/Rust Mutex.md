---
title: Rust Mutex
type: implementation
status: seed
created: 2026-08-18
updated: 2026-08-18
tags:
  - rust
  - concurrency
  - locks
  - mutex
aliases:
  - Mutex in Rust
  - std::sync::Mutex
category: Books/Rust
---

# Mutex in Rust

![[Mutex]]

When we share data between threads via a `Mutex` or `RwLock`, unlike with `RefCell`, removing conflicting references doesn't cause a panic; instead, the thread is put to sleep and is woken up when the lock is dropped, so it can try to take a reference.

`std::sync::Mutex`
A mutex works as an exclusive reference, i.e. only one thread can hold the lock.

```rust
use std::sync::Mutex;

fn main() {
	let count = Mutex::new(0);
	
	thread::scope(|s| {
		for n in 0..10 {
			s.spawn(|| {
				let mut guard = count.lock().unwrap();
				for _ in 0..100 {
					*guard += 1;
				}
			});
		}
	});
	assert_eq!(count.into_inner().unwrap(), 1000);
}
```

In the above example, we spawn 10 threads, all to increment `count` 100 times. Each thread sees the count as 0, 100, 200, ..., 900, runs its execution and drops the guard.

We don't have `unlock` methods on `Mutex` because `lock` returns a `MutexGuard`; it lets us access the internal data like an exclusive reference through the `DerefMut` trait.
Dropping the guard frees the lock via the `Drop` trait.
