---
created: 2026-08-18
tags:
  - rust
  - concurrency
  - atomics
  - memory-ordering
  - lazy-initialization
  - race-condition
aliases:
  - Atomics
  - Rust Atomics
category: Books/Rust
---
# Atomics

The word _atomic_ comes from the Greek word _ἄτομος_, meaning an indivisible item that can't be cut into further smaller parts. Similarly, atomic operations are the smallest operations on data that either happen or don't happen; there is no half-done state.

Two [[Basics of Rust Concurrency|threads]] can update `AtomicI32` without an inconsistent state where both read the same value and update it at the same time.

The implementation of atomics and which ones are available depends on the system architecture and OS.

Unlike other types, we don't have an `Atomic<T>`; we only get `AtomicBool`, `AtomicI32`, etc., up to the word size, i.e `AtomicUsize`.

## Memory Ordering

All atomic operations take in an `Ordering` parameter `std::sync::atomic::Ordering`, which controls what guarantees we get about the relative ordering of operations.

> [!NOTE]
> The CPU might decide to perform operations out of order, i.e., group all assignments together even if, in the code, they are not in that order. So T1 might see V1 V2 V3 getting assigned but T2 might see V2 V3 V1 in that order.

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

## Lazy Initialization

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

If X is supposed to be a constant that doesn't change throughout the run of the program, we can calculate it; it takes time and compute. We would prefer the first thread to call it, calculate it, and store the value for later use. The above code looks correct but has one flaw. If two threads call `get_x`, they will both see `x == 0` and restart the computation, whichever finishes first. It's called a race condition. To fix this, we have `std::sync::Once` and `std::sync::OnceLock`; these are atomic operations.

### `Once`

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

### `OnceLock`

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
