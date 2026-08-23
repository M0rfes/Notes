---
title: TypeScript Satisfies
type: code-example
status: seed
created: 2026-02-15
updated: 2026-08-22
tags:
  - typescript
  - type-system
  - pattern-matching
aliases:
  - TypeScript Satisfies
  - Exhaustive Switch
summary: Demonstration of using the TypeScript 'satisfies' operator with switch statements to achieve exhaustive pattern matching.
entities:
  - TypeScript
topics:
  - Satisfies Operator
  - Exhaustive Matching
  - Switch Statements
  - Type Safety
related: []
---
# TypeScript Satisfies Operator

This demonstrates how we can use the `satisfies` operator in [[TypeScript]] with a `switch` statement to achieve exhaustive matching.

### Demo
![satisfies-15-02-2026.png](images/satisfies-15-02-2026.png)

```typescript
type Role = 'admin' | 'editor' | 'viewer' | "superadmin";

function setRole(role: Role) {
    switch (role) {
    case 'admin':
        console.log('You have full access.');
        break;
    case 'editor':
        console.log('You can edit content.');
        break;
    case 'viewer':
        console.log('You can view content.');
        break;
    default:
        // This will give an error if a role (like 'superadmin') is unhandled
        console.log(`Unknown role. ${role satisfies never}`);
    }
}
```

### Explanation
The above code should give a compilation error:
```bash
Type '"superadmin"' does not satisfy the expected type 'never'.
```

This ensures that whenever a new `Role` is added, the compiler forces us to handle it in the `switch` statement. This is similar to exhaustive pattern matching in languages like **Rust**. It provides a safety net that is much better than discovering unhandled cases in runtime logs.
