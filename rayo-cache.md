---
type: Project
Gerna: Rust
start: 09-02-2025
tags:
  - project/rust/rayo/cache
  - rmp-serde
---

[Rayo Cache](https://github.com/M0rfes/rayo-cache)

This repo is only for my learning purpose. I don't intend to compete with industry standards such as Reddish.

The idea for this came to me when I considered improving [Tiny Redis](https://github.com/M0rfes/tiny-redis).  [Tiny Redis](https://github.com/M0rfes/tiny-redis) was a learning experiment, but instead of just learning code, I want to polish my skills in low-level design as well. I want to introduce a usable interface right now. I am considering using [REST](https://en.wikipedia.org/wiki/REST)like semantics for querying and mutating my DB, i.e GET to read POST to create.

This is a mono repo using cargo workspaces. we have
1. [[ryon_clinet]]
2. [[ryon_server]]
3. [[rayo_cache_common]]



