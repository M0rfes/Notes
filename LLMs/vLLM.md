---
title: "vLLM: High-Throughput LLM Serving"
type: research
status: seed
created: 2026-03-30
updated: 2026-07-31
tags: [llm, vllm, inference, performance, infrastructure]
aliases: [vLLM, vLLM Serving]
summary: A high-throughput and memory-efficient inference engine for LLMs, featuring PagedAttention.
entities: [vLLM, Berkeley]
topics: [PagedAttention, KV Cache, Throughput, Inference Engine]
related: [LLMs/Token Caching.md, LLMs/LMCache.md, LLMs/Speculative Decoding.md, Quantisation, TurboQuant]
---

# vLLM

**[[vLLM]]** is a library for high-throughput and memory-efficient **[[LLM|LLM]]** serving and inference.

### Key Innovations
- **[[PagedAttention]]**: A new attention algorithm that manages attention keys and values ([[Token Caching|KV cache]]) more efficiently, similar to virtual memory paging in operating systems.
- **Dynamic Batching**: Optimizes hardware utilization by grouping requests on the fly.

[GitHub Repository](https://github.com/vllm-project/vllm)
