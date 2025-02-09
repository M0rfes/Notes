---
type: Project
Gerna: Rust
start: 09-02-2025
tags:
  - project/rust/rayo/cache
---

[Rayo Cache](https://github.com/M0rfes/rayo-cache)

This repo is only for my learning purpose. I don't intend to compete with industry standards such as Reddish.

The idea for this came to me when I considered improving [Tiny Redis](https://github.com/M0rfes/tiny-redis).  [Tiny Redis](https://github.com/M0rfes/tiny-redis) was a learning experiment, but instead of just learning code, I want to polish my skills in low-level design as well. I want to introduce a usable interface right now. I am considering using [REST](https://en.wikipedia.org/wiki/REST)like semantics for querying and mutating my DB, i.e GET to read POST to create.

This is a mono repo using cargo workspaces. we have


# 1. Common
#project/rust/rayo/cache/common 
## Dependencies
[[rmp-serde]]
[[serde]]
[[serde_json]]
[[thiserror]]


The idea behind Common is to abstract all operations related to parsing a string into a Rust data type and a Rust data time to string.

This will also hold the parser logic for [[ryon_clinet]] and other common utils

# 2. Server
#project/rust/rayo/cache/server 
## Dependencies
[[bytes]]
[[chrono]]
[[clap]]
[[dashmap]]
[[futures]]
[[tokio]]
[[tokio-util]]
[[tracing]]
[[tracing-subscriber]]
[[ulid]]
[[rayo_cache_common]]
[[thiserror]]

# 3. Client 
#project/rust/rayo/cache/client    

## Dependencies
[[clap]]
[[tokio]]
[[tracing]]
[[tracing-subscriber]]
[[rayo_cache_common]]

##
In progress syntax

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
2. [ ] Make a query parser
3. [ ] Map `GET` `POST` `PUT` `PATH` `Delete` to Rust enums
