---
title: LLMs
type: index
status: active
created: 2026-03-30
updated: 2026-07-26
tags:
  - llm
  - moc
  - research
  - ai
aliases: [Large Language Models, AI Notes]
summary: Central hub for all notes related to Large Language Models (LLMs), including architecture, retrieval, and optimization.
entities: []
topics: [Retrieval-Augmented Generation, Tokenization, Quantization, Performance Optimization]
related: [LLMs/RAG.md, LLMs/Tokenization.md, LLMs/Encoder.md, LLMs/decoder.md]
---
# Large Language Models (LLMs) MOC

A central index for exploring concepts, architectures, and strategies related to **[[LLM]]**.

## Core Concepts
- **[[Tokenization]]**: Character, word, and sub-word (BPE) techniques.
- **[[Encoder]]** / **[[decoder]]**: Feature extraction (bidirectional) vs autoregressive generation (causal).
- **[[Needle-in-a-Haystack]]**: Benchmarking long-context retrieval and biases.

## Retrieval-Augmented Generation (RAG)
- **[[RAG|RAG Overview]]**: Modalities (Text, Hybrid, Full Multimodal).
- **[[RAG Strategies MOC]]**: (Candidate MOC)
  - **[[Re-ranking]]**: Two-stage retrieval for precision.
  - **[[Agentic RAG]]**: Autonomous tool selection.
  - **[[Knowledge Graphs]] (GraphRAG)**: Relational retrieval.
    - **[[Microsoft GraphRAG]]**
    - **[[LightRAG]]**

## Performance & Optimization
- **[[Quantization]]**: Model compression (GPTQ, AWQ, 1.58-bit).
  - **[[TurboQuant]]**: Fast quantized kernels.
- **[[Token Caching]]**: Reusing [[Token Caching|KV caches]] for speed.
- **[[Speculative Decoding]]**: Draft model generation with target validation.
- **Serving Engines**:
  - **[[vLLM]]**: High-throughput serving with PagedAttention.
  - **[[LMCache]]**: Shared cache infrastructure.

## Multimodal Models
- **[[MLLM]]**: Multimodal LLMs capable of processing images, audio, and video.
- **[[HYMMRag]]**: Hybrid Multimodal RAG.
- **[[FMMRag]]**: Full Multimodal RAG.
