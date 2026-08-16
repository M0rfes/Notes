---
created: 2026-08-15
tags:
  - rust
  - concurrency
  - threads
  - statics
  - reference-counting
  - interior-mutability
  - atomics
  - locks
  - mutex
  - rwlock
aliases:
  - Threads in Rust
  - Basics of Rust Concurrency
category: Books/Rust
---
# Threads in Rust

Every program starts with one OS thread, and the thread remains alive as long as the program runs. Once the program stops executing, the thread is cleaned up.
Rust can spawn as many threads as needed using `std::thread::spawn`.

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

`std::thread::spawn` is a shorthand for `std::thread::Builder::new().spawn(f).unwrap()`.
The `Builder` methods let us pass configuration to the thread, such as a stack size and name, which will be available via `std::thread::current().name()`, used in the panic message, and visible in most profiling tools.
It returns a `std::io::Result`; it will indicate an error if the OS failed to spawn a new thread.

## Scoped Threads

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

# Statics

`'static` is a lifetime that says the value will exist till the end of the program, so any value with a static lifetime can be shared across threads.

```rust
static X: [i32; 3] = [1, 2, 3];

thread::spawn(|| dbg!(&X));
thread::spawn(|| dbg!(&X));
```

Any variable defined by static exists before `main` and remains until the program ends.

## Leaking

```rust
use std::thread;

fn main() {
	let x: &'static [i32; 3] = Box::leak(Box::new([1, 2, 3]));
	
	thread::spawn(move || dbg!(x));
	thread::spawn(move || dbg!(x));
}
```

We are moving the static reference using the `move` keyword, not the value. `Box::leak` lets us leak a value on the heap, guaranteeing that no one can free it and that it will exist as long as the program runs.

# Reference Counting

## Rc

`std::rc::Rc` is a smart pointer that gives you a reference-counted value. It keeps a count of all owners and drops the value only when the counter reaches 0. The count goes up by one each time the pointer is cloned with `Rc::clone(&rc)`.
Unlike `Box::new().clone()`, these do not create a new value on the heap; instead, it just increments the counter next to the value. Each time a clone is dropped, the counter is decremented, and if the counter goes to 0, the actual value is dropped.
Note: `Rc` gives a read-only reference; to get a mutable reference, you can either use interior mutability or `Rc::get_mut` or `Rc::make_mut` to get a mutable reference. It only works when there is one reference; to get how many references an `Rc` has, use `Rc::strong_count`.

```rust
use std::rc::Rc;

fn main() {
	let mut num = Rc::new(5);
	if let Some(val) = Rc::get_mut(&mut num) {
		*val = 42;
	}
	
	println!("{num:?}"); // 42
}
```

It's a zero-cost abstraction way of taking a mutable reference from an `Rc`.

`Rc` can't be sent across threads because it's not thread-safe and doesn't implement `Send` and `Sync`, because if two threads try to update the count at once, it will result in inconsistent behaviour.

## Arc

`std::sync::Arc`: `Arc` stands for Atomically Reference Counted; it's the same as `Rc`, with a guarantee that any increment/decrement operation on `Arc` is atomic, i.e., no two threads can simultaneously mutate the count.

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

# Interior Mutability

## Cell

`std::cell::Cell<T>` lets you mutate a value via a shared/read reference to avoid undefined behaviour; it only lets you copy `T` if `T` implements `Copy` or replace `T`.
It can also be used only in a single thread.

```rust
fn f(a: &i32, b: &mut i32) {
	let before = *a;
	*b += 1;
	let after = *a;
	if before != after {
		x(); // never happens
	}
}
```

`x` is never called because Rust guarantees that both `a` and `b` can't reference the same number, as there can't be a read reference `&a` while we have a write reference `&mut b` to the same value.

But with `Cell`:

```rust
use std::cell::Cell;

fn f(a: &Cell<i32>, b: &Cell<i32>) {
	let before = a.get();
	b.set(b.get() + 1);
	let after = a.get();
	if before != after {
		x();
	}
}
```

`x` might be called now, as both `a` and `b` can point to the same value.

Use `cell.take()` when `T` doesn't implement `Copy`.

```rust
use std::cell::Cell;

fn f(vec: &Cell<Vec<i32>>) {
	let mut v = vec.take();
	v.push(4);
	vec.set(v);
}
```

`take` replaces the internal vector with an empty vector.

## RefCell

`std::cell::RefCell` lets you take a mutable reference to the value without cloning it, at a small runtime cost. It maintains a count along with the value, and taking a mutable reference while there are shared references, or vice versa, causes a panic.

```rust
use std::cell::RefCell;

fn f(vec: &RefCell<Vec<i32>>) {
	vec.borrow_mut().push(1);
}
```

But both `Cell` and `RefCell` can't be sent across threads.

# Thread Safety: Send and Sync

## Send

A type `T` is `Send` if its ownership can be transferred to another thread.
e.g., `Arc<T>` is `Send`, but `Rc<T>` is not.

## Sync

A type `T` is `Sync` if its shared reference is of type `Send` (i.e., `T` is `Sync` if `&T` is `Send`).
e.g., `i32` is `Sync`, but `Cell<i32>` is not `Sync`.

All primitive types are `Send` and `Sync`.

## Auto Traits

Auto traits are traits which are implemented for a type if all of its fields implement them.

i.e.

```rust
struct User {
	id: i32,
}
```

Here, `User` is both `Send` and `Sync` because `id` is `Send` and `Sync`.

To opt out, you can add a property that's not `Send` or `Sync`, like a `Cell`:

```rust
use std::cell::Cell;
use std::marker::PhantomData;

struct User {
	id: i32,
	__not_sync: PhantomData<Cell<()>>,
}
```

Now `User` is not `Sync` or `Send`.

Raw pointers like `*const T` and `*mut T` are neither `Send` nor `Sync` as the compiler cannot guarantee thread safety for them.

```rust
struct Org {
	user: *mut usize,
}

unsafe impl Send for Org {}
unsafe impl Sync for Org {}
```

We need to use `unsafe` because the compiler can't guarantee that the value the user references is `Send` or `Sync`.

# Locking: Mutexes and RwLocks

When we share data between threads via a `Mutex` or `RwLock`, unlike with `RefCell`, removing conflicting references doesn't cause a panic; instead, the thread is put to sleep and is woken up when the lock is dropped, so it can try to take a reference.

## Mutex

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

In the above e.g., we spawn 10 threads, all to increment `count` 100 times. Each thread sees the count as 0, 100, 200, ..., 900, runs its execution and drops the guard.
We don't have `unlock` methods on `Mutex` because `lock` returns a `MutexGuard`; it lets us access the internal data like an exclusive reference through the `DerefMut` trait.
Dropping the guard frees the lock via the `Drop` trait.

## Reader-Writer Lock

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

## Lock Poisoning

The call to `unwrap` at the end of each lock call should tell you the locking operation returns a `Result` type. If a thread panics while holding the lock, subsequent calls to lock for read and write will result in errors. The lock still behaves as it should, i.e. putting other threads to sleep, but no data will be returned from the lock.

## Thread Parking

`std::thread::park`
Thread parking lets a thread park itself so it no longer consumes CPU cycles while waiting for other threads to wake it. Other threads can call the `unpark` method on the thread object they get from `spawn` or `std::thread::current()`.

```rust
use std::collections::VecDeque;
use std::sync::Mutex;
use std::thread;
use std::time::Duration;

fn main() {
	let queue = Mutex::new(VecDeque::new());
	
	thread::scope(|s| {
		let t = s.spawn(|| loop {
			let item = queue.lock().unwrap().pop_front();
			if let Some(item) = item {
				dbg!(item);
			} else {
				thread::park();
			}
		});
		
		for i in 0.. {
			queue.lock().unwrap().push_back(i);
			t.thread().unpark();
			thread::sleep(Duration::from_secs(1));
		}
	});
}
```

The main thread keeps pushing a number into the queue every second, then unparks. The thread is in an infinite loop that pops all the elements one by one, and when the queue is empty, it parks itself.

Note: if we call `unpark` before the thread is parked, it immediately resumes and never sleeps. But if we call `unpark` twice and `park` twice, only the first `park` is skipped; the second `park` will still put the thread to sleep.

## Condition Variables

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