---
title: Model Context Protocol (MCP)
type: research
status: seed
created: 2026-08-02
updated: 2026-08-02
tags: [llm, mcp, tool-calling, anthropic, protocol]
aliases: [Model Context Protocol, MCP]
summary: A standard protocol by Anthropic built on top of tool calling that exposes JSON-RPC endpoints for LLMs to communicate with external services as plugins.
entities: [Anthropic]
topics: [Tool Calling, JSON-RPC, External Services, Plugins]
related: [Agents/Tool calling.md, Agents/Agents.md, LLMs/Agentic RAG.md, Router Pattern]
---

# Model Context Protocol (MCP)

**MCP** is a protocol built on top of **[[Tool calling]]**.

### Overview
- **Standard by [[Anthropic]]**: Establishes a standard for **[[LLM]]** to communicate with external services.
- **Mechanism**: Exposes **[[JSON-RPC]]** endpoints for the **[[LLM|LLM]]** to call.

### How It Compares to Regular Tool Calls
- **Plugin Architecture**: Unlike regular tool calls which are defined within the [[Harness]], MCPs can be added like plugins.
- **Extensibility**: Adds extra tools and functionality to **[[LLM]]**.