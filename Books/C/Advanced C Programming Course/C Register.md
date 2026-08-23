---
title: C Register Storage Class
type: implementation
status: seed
created: 2026-08-23
updated: 2026-08-23
tags:
  - c
  - memory
  - storage-classes
aliases:
  - C Register
  - register in C
category: Books/C
---

# Register Storage Class in C

![[Register Storage]]

Register modifiers tell the compiler to place the variable in a CPU register instead of RAM. The compiler still can choose not to do that for the sake of optimisation. It's more like a request. While a whole struct can have a register modifier, one field of a struct can't have the register modifier.

```c
int main(void) {
	register int i = 10; // is in one of the CPU registers
	return 0;
}
```

## No Address Rule

You cannot take the address/reference of a register variable, as it has no address while in a register.

```c
int main(void) {
	register int i = 10; // is in one of the CPU registers
	int* ptr_i = &i; // not allowed will cause an error
	return 0;
}
```

While putting the address in a register works:

```c
int main(void) {
	int i = 10;
	register int* ptr_i = &i; // allowed
	return 0;
}
```

register has scope, lifetime, and visibility; register can't be global.
