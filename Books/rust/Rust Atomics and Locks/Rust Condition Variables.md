---
title: Condition Variables
type: implementation
status: seed
created: 2026-08-18
tags:
  - rust
  - concurrency
  - condvar
aliases:
  - Condition Variables in Rust
  - std::sync::Condvar
category: Books/Rust
---

# Condition Variables in Rust

![[Condition Variables]]

`std::sync::Condvar`

`Condvar` can be used to notify one or more threads of an event if the data is protected by a mutex.

```rust
use std::collections::VecDeque;
use std::sync::{Condvar, Mutex};
use std::thread;
use std::time::Duration;

fn main() {
	let queue = Mutex::new(VecDeque::new());
	let not_empty = Condvar::new();
	
	thread::scope(|s| {
		s.spawn(|| {
			loop {
				let mut q = queue.lock().unwrap();
				let item = loop {
					if let Some(item) = q.pop_front() {
						break item;
					} else {
						q = not_empty.wait(q).unwrap();
					}
				};
				drop(q);
				dbg!(item);
			}
		});
		for i in 0.. {
			let mut q = queue.lock().unwrap();
			q.push_back(i);
			not_empty.notify_one();
			thread::sleep(Duration::from_secs(1));
		}
	});
}
```

`Condvar` takes the `MutexGuard`, unlocks it, and goes to sleep, and when a notification is received, it locks the `Mutex` and returns the guard.
We can use `notify_one` or `notify_all` to notify a single thread or all threads.
