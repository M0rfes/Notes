---
title: Lazy Initialization
type: implementation
status: seed
created: 2026-08-18
tags:
  - rust
  - concurrency
  - atomics
  - lazy-initialization
aliases:
  - Lazy Initialization in Rust
  - std::sync::Once
  - std::sync::OnceLock
category: Books/Rust
---

# Lazy Initialization in Rust

![[Lazy Initialization]]

```rust
use std::sync::atomic::AtomicU64;
use std::sync::atomic::Ordering::Relaxed;

fn get_x() -> u64 {
	static X: AtomicU64 = AtomicU64::new(0);
	let mut x = X.load(Relaxed);
	if x == 0 {
		x = calculate_x();
		X.store(x, Relaxed);
	}
	x
}
```

If X is supposed to be a constant that doesn't change throughout the run of the program, we can calculate it; it takes time and compute. We would prefer the first thread to call it, calculate it, and store the value for later use. The above code looks correct but has one flaw. If two threads call `get_x`, they will both see `x == 0` and restart the computation, whichever finishes first. It's called a [[Race Conditions|race condition]]. To fix this, we have `std::sync::Once` and `std::sync::OnceLock`; these are atomic operations.

## `Once`

```rust
use std::sync::Once;
use std::thread;

static INIT: Once = Once::new();

fn init() {
	INIT.call_once(|| {
		println!("in init");
	});
}

fn main() {
	thread::scope(|s| {
		s.spawn(|| {
			init(); // prints "in init"
		});
		
		s.spawn(|| {
			init(); // does nothing; sleeps till first thread finishes
		});
	});
}
```

## `OnceLock`

```rust
use std::sync::OnceLock;
use std::thread;

#[derive(Clone)]
struct Config {}

static GLOBAL_CONFIG: OnceLock<Config> = OnceLock::new();

fn get_config() -> Config {
	todo!();
}

fn main() {
	thread::scope(|s| {
		s.spawn(|| {
			let config = GLOBAL_CONFIG.get_or_init(|| get_config()).clone(); // load the config if not loaded
		});

		s.spawn(|| {
			let config = GLOBAL_CONFIG.get_or_init(|| get_config()).clone(); // sleeps till the first thread loads the config
		});
	});
}
```
