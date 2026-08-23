---
title: C Extern Storage Class
type: implementation
status: seed
created: 2026-08-23
tags:
  - c
  - memory
  - storage-classes
aliases:
  - C Extern
  - extern in C
category: Books/C
---

# Extern Storage Class in C

![[Variable Linkage]]

Extern modifiers control the visibility of a global variable in a multi-file project. Functions default to extern.

```c
// main.c
int i = 10;

void foo(void);
int main(void) {
	foo(); // will print i = 10;
	return 0;
}

// foo.c
extern int i;
void foo(void) {
	printf("i = %d\n", i);
}
```

This way, foo.c can access i, which is defined and declared in main.c.

```c
void foo(void) {
	extern int i;
	printf("i = %d\n", i);
}
```

extern can be used within a scope to define that we are using a global variable defined in another file.

```c
// main.c
char text[255];
char text2[255][50];

// foo.c
extern char text[];
extern char text2[][50];
```

When using an array, a one-dimensional array doesn't need to specify its size cause the compiler already knows it. But for a multidimensional array the nested sizes need to be defined.

```c
extern int add(int a, int b);
// and
int add(int a, int b);
```

Are effectively the same cause functions default to extern.
