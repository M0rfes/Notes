---
title: C Variable Length Array
type: implementation
status: seed
created: 2026-08-28
updated: 2026-08-28
tags:
  - c
  - arrays
  - vla
aliases:
  - C Variable Length Array
  - C VLA
  - VLA in C
category: Books/C
---
# Variable Length Array in C

![[Variable Length Array]]

These features were introduced in C99, which lets you define an array's length using a variable.

```c
#include <stdio.h>

int main(void) {
    int i;
    printf("enter the length of the array: ");
    scanf("%d", &i);

    int array[i];

    return 0;
}
```

The variable doesn't have to be known at compile time.

The feature is optional in C11, i.e. the compiler doesn't have to implement it. To check if your compiler supports it, you can check the `__STDC_NO_VLA__` constant:

```c
#ifdef __STDC_NO_VLA__
    printf("Variable length array not supported\n");
#else
    printf("Variable length array supported\n");
#endif
```

## VLA in Function Arguments

We can use [[Variable Length Array|VLA]] in function arguments:

```c
// C99
void print_matrix(int x, int y, int matrix[x][y]);

// C11
void print_matrix(int, int, int matrix[*][*]);
```

C11 lets you declare a function with only the type of parameters. Also, an array can't be the first parameter; in C99, it will be a compiler error because `x` and `y` would be undefined.
