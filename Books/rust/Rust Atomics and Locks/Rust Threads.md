---
title: Rust Threads
type: implementation
status: seed
created: 2026-08-18
tags:
  - rust
  - concurrency
  - threads
aliases:
  - Threads in Rust
  - std::thread::spawn
  - std::thread::Builder
category: Books/Rust
---

# Threads in Rust

![[Threads]]

Rust can spawn as many [[Threads|threads]] as needed using `std::thread::spawn`.

```rust
use std::thread;

fn main() {
	thread::spawn(f);
	thread::spawn(f);
	
	println!("Hello from main thread");
}

fn f() {
	println!("hello from another thread");
	let id = thread::current().id();
	
	println!("this is my thread id {id:?}");
}
```

The above function spawns `f` in 2 threads, but the main thread exits before the 2 threads have enough time to finish executing. This is because when the main thread is terminated, all threads forked/spawned from it are also cleaned up, whether they have finished executing or not.

## Joining Threads

![[Thread Joining]]

To wait for the spawned threads to finish their execution before we exit from main, we can use the `JoinHandle` returned by the `thread::spawn` function.

```rust
use std::thread;

fn main() {
	let t1 = thread::spawn(f);
	let t2 = thread::spawn(f);

	println!("hello from main thread");
	
	t1.join().unwrap();
	t2.join().unwrap();
}
```

The above change fixes the bug by waiting for `t1` and `t2` to finish.
The call to `join()` returns a `std::thread::Result`, which has an `Err` if the thread panicked or an `Ok<T>` where `T` is the return value from the thread. Calling `.unwrap()` on it will cause the main thread to panic as well.

## Closures and Move Semantics

```rust
use std::thread;

fn main() {
	let list = vec![1, 2, 3];
	thread::spawn(move || {
		for n in &list {
			println!("{n:?}");
		}
	});
}
```

The above example shows a closure being passed to the new thread. It's capturing the surrounding `list` variable via `move` semantics. The ownership of the vector `list` has been transferred to the new thread from `main`.

```rust
use std::thread;

fn main() {
	let list = Vec::from_iter(0..=1000);
	let t1 = thread::spawn(move || {
		let len = list.len();
		let sum = list.iter().sum::<usize>();
		return sum;
	});
	
	let sum = t1.join().unwrap();
	
	println!("{sum:?}");
}
```

The above example shows how to pass data into and out of a thread.

## Thread Builder

`std::thread::spawn` is a shorthand for `std::thread::Builder::new().spawn(f).unwrap()`.
The `Builder` methods let us pass configuration to the thread, such as a stack size and name, which will be available via `std::thread::current().name()`, used in the panic message, and visible in most profiling tools.
It returns a `std::io::Result`; it will indicate an error if the OS failed to spawn a new thread.
