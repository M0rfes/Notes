---
title: Token Caching
type: research
status: seed
created: 2026-03-30
updated: 2026-03-30
tags: [LLM, caching, performance, inference]
aliases: [Token Caching, KV Cache]
summary: A mechanism for reusing previously computed token states to speed up LLM inference and reduce computational costs.
entities: [vLLM, LMCache]
topics: [KV Caching, Inference Optimization, Prompt Caching]
related: [LLMs/LMCache.md, LLMs/vLLM.md, LLMs/Tokenization.md]
---

# Token Caching

**Token Caching** (often referring to **[[KV Cache]]** or **[[Prompt Caching]]**) is a technique used to speed up **[[LLMs|LLM]]** inference by storing the keys and values of previously processed tokens.

### Key Concepts
- **[[KV Cache]]**: Stores the Key and Value vectors for each token in the context window to avoid recomputing them for every new token generated.
- **[[Prompt Caching]]**: Specifically caches the hidden states of common system prompts or long context headers.

### Implementations
- **[[vLLM]]**: Uses PagedAttention to efficiently manage KV caches.
- **[[LMCache]]**: A specialized system for sharing caches across multiple requests or instances.

#TODO: Expand on LMCache vs standard KV caching.
