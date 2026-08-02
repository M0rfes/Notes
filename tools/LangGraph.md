---
title: LangGraph
type: reference
status: seed
created: 2026-07-31
updated: 2026-07-31
tags: [agent, langgraph, orchestration, multi-agent]
aliases: [LangGraph]
summary: A graph-based framework for orchestrating stateful, multi-agent workflows with loops, branching, and state persistence.
topics: [Graph Orchestration, State Management, Human-in-the-loop, Cyclic Workflows]
related: [Agents/Agents.md, Agents/Communication.md, LLMs/Agentic RAG.md]
---

# LangGraph

**[[LangGraph]]** is a specialized framework designed to build stateful, multi-actor applications with **[[LLMs|LLMs]]**.

### Key Capabilities
- **Cyclic & Graph Workflows**: Allows loops and conditional edges, making it ideal for [[ReAct]] loops, iterative refinement, and multi-agent debate.
- **State Management**: Uses central state schemas updated deterministically as execution moves across graph nodes.
- **Human-in-the-Loop**: Supports pausing execution for human approval or feedback before resuming node transitions.
- **Time-Travel Debugging**: Enables rewinding state to inspect or fork execution paths during agent testing.