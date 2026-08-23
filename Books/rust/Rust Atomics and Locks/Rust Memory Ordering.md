---
title: Memory Ordering
type: implementation
status: seed
created: 2026-08-18
updated: 2026-08-18
tags:
  - rust
  - concurrency
  - atomics
  - memory-ordering
aliases:
  - Memory Ordering in Rust
  - std::sync::atomic::Ordering
category: Books/Rust
---

# Memory Ordering in Rust

![[Coding/Concurrency/Memory Ordering]]

All atomic operations take in an `Ordering` parameter `std::sync::atomic::Ordering`, which controls what guarantees we get about the relative ordering of operations.

```rust
use std::thread;
use std::sync::atomic::AtomicBool;
use std::sync::atomic::Ordering::Relaxed;

fn main() {
	static STOP: AtomicBool = AtomicBool::new(false);
	
	let bgt = thread::spawn(|| {
		while !STOP.load(Relaxed) {
			some_work();
		}
	});
	
	for line in std::io::stdin().lines() {
		match line.unwrap().as_str() {
			"help" => println!("{}", help()),
			"stop" => break,
			cmd => println!("unknown command {cmd:?}"),
		}
	}
	
	STOP.store(true, Relaxed);
	
	bgt.join().unwrap();
}
```

The above code runs an infinite loop on a background thread till the user enters a stop command.

> [!NOTE]
> If `some_work()` is blocking and/or takes a while to finish, entering stop might not immediately stop the program; it will keep running until the last call to `some_work` completes.
