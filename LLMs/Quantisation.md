---
title: Quantization
type: research
status: seed
created: 2026-03-30
updated: 2026-03-30
tags: [llm, quantization, optimization, model-compression]
aliases: [Quantization, Model Compression]
summary: Techniques for reducing the precision of model weights to decrease memory usage and speed up inference.
entities: [BitNet, AWQ, GPTQ]
topics: [Low-Precision Training, Weight Pruning, 4-bit Quantization, 8-bit Quantization]
related: [LLMs/TurboQuant.md, LLMs/LLMs.md]
---

# Quantization

**[[Quantization]]** is the process of mapping high-precision floating-point numbers (e.g., FP32 or FP16) to lower-precision formats (e.g., INT8, INT4, or even 1.58-bit).

### Purpose
- **Memory Reduction**: Fits larger models into smaller VRAM (e.g., consumer GPUs).
- **Speed**: Improves inference throughput by utilizing specialized low-precision hardware instructions.

### Common Formats
- **GPTQ**: Post-training quantization for weight-only.
- **AWQ**: Activation-aware Weight Quantization.
- **[[TurboQuant]]**: A specialized kernel for fast quantized inference.
- **BitNet**: 1-bit LLMs that utilize binary or ternary weights.

#TODO: Deep dive into the trade-offs between precision and perplexity.
