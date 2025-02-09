---
type: Project
Gerna: Rust
start: 09-02-2025
tags:
  - project/rust/rayo-cache
  - rmp-serde
dependencies: "[[rayo-cache-down]]"
---
[Rayo Cache](https://github.com/M0rfes/rayo-cache)

This repo is only for my learning purpose. I don't intend to compete with industry standards such as Reddish, etc.

The idea for this came to me when I considered improving [Tiny Redis](https://github.com/M0rfes/tiny-redis).  [Tiny Redis](https://github.com/M0rfes/tiny-redis) was a learning experiment, but instead of just learning code, I want to polish my skills in low-level design as well. I would like to introduce a usable interface right now. I am considering using [REST](https://en.wikipedia.org/wiki/REST)like semantics for querying and mutating my DB, i.e GET to read POST to create.

# In progress syntax

```
GET user
```
This will get you everything in user collection.

```
POST user \
body <JSON_VALUE>
```
This will add value to user collection. And will return the objects ID.

Like REST, we can add user/<id> to read a single user or do operations on a single user.

TODO
1. [ ] Make a query parser
2. [ ] Map `GET` `POST` `PUT` `PATH` `Delete` to Rust enums


