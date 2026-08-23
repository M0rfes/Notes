---
title: C Static Storage Class
type: implementation
status: seed
created: 2026-08-23
updated: 2026-08-23
tags:
  - c
  - memory
  - storage-classes
aliases:
  - C Static
  - static in C
category: Books/C
---

# Static Storage Class in C

![[Static Lifetime]]

static has different behaviour for local and global variables.

```c
void foo(void) {
	static int i = 0;
	printf("i = %d\n", i);
	i++;
}

int main(void) {
	foo(); //prints i = 0
	foo(); //prints i = 1
	foo(); //prints i = 2
	foo(); //prints i = 3
	
	return 0;
}
```

Local variables with the static modifier retain their value between function executions, unlike auto variables that are allocated on the stack; local static variables are defined in the **data segment** (or BSS segment). They stay from the start to the end of the program.

The whole struct can have the static modifier but individual members can't have a static modifier due to the [[Teach/C17/GLOSSARY#Alignment|alignment rule]].

static variables have to be known at compile time, so
```c
static int i = get_i();
```
will not work.

```c
// main.c
static int i = 10;
static int foo(void) {
	return 10;
}
```
Both the variable i and the function foo are now visible only in main.c, the file where they are defined.
