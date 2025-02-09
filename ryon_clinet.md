---
type: Project
Gerna: Rust
start: 09-02-2025
tags:
  - projuct/rust/ryon/cache/clinent
---
# Dependencies
[[clap]]
[[tokio]]
[[tracing]]
[[tracing-subscriber]]
[[rayo_cache_common]]

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