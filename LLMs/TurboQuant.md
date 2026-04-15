---
title: TurboQuant
type: research
status: seed
created: 2026-03-30
updated: 2026-03-30
tags: [LLM, quantization, performance, inference]
aliases: [TurboQuant]
summary: A specialized inference kernel optimized for fast, quantized LLM execution.
entities: []
topics: [Low-Precision Inference, GPU Kernel, Quantization]
related: [LLMs/Quantisation.md, LLMs/vLLM.md]
---

# TurboQuant

**[[TurboQuant]]** is an optimized inference kernel designed for extremely fast **[[Quantization|quantized]]** **[[LLMs|LLM]]** inference on GPUs.

### Key Features
- **Optimized Kernels**: Hand-tuned CUDA kernels for specific low-precision operations.
- **Minimal Overhead**: Reduces the compute overhead of de-quantizing weights on the fly.

#TODO: Compare TurboQuant with other kernels like BitsAndBytes or AutoGPTQ.
