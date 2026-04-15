---
title: LMCache
type: research
status: seed
created: 2026-03-30
updated: 2026-03-30
tags: [LLM, caching, performance, infrastructure]
aliases: [LMCache]
summary: A specialized system for sharing token caches (KV caches) across multiple requests or instances to optimize LLM performance.
entities: []
topics: [Cache Sharing, KV Cache, Inference Optimization]
related: [LLMs/Token Caching.md, LLMs/vLLM.md]
---

# LMCache

**[[LMCache]]** is a specialized framework designed to improve the performance of **[[LLMs]]** by enabling the sharing of **[[Token Caching|KV Caches]]** across multiple instances or user sessions.

### Key Features
- **Shared Cache**: Reuses pre-computed token states for common prompts across different requests.
- **Latency Reduction**: Drastically reduces the "Time to First Token" (TTFT) for recurring queries.

#TODO: Detailed implementation analysis.
