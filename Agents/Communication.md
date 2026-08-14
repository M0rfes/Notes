---
title: Agent Communication Patterns
type: research
status: seed
created: 2026-04-11
updated: 2026-04-11
tags:
  - multi-agent-systems
  - architecture
  - orchestration
aliases:
  - Agent Communication
  - Agent Orchestration Patterns
summary: An overview of different communication topologies and patterns for multi-agent systems, including linear, hierarchical, and network-based flows.
entities:
  - Agentic RAG
  - Council Pattern
  - Generate-and-Critic Pattern
topics:
  - multi-agent systems
  - orchestration
  - autonomous agents
  - task decomposition
related:
  - "[[Agents]]"
  - "[[Agentic RAG]]"
  - "[[Architecture]]"
  - "[[Router Pattern]]"
---

When running a [[multi-agent system]], we need a way for [[Agents|agents]] to communicate with one another. There are quite a few ways for the agents to talk/pass info to each other.

# Linear
This is when the flow is set to a series of steps, one after another, just a simple workflow like drafting replies to a set of emails or generating captions for images.

# Hierarchical
When we have an agent or an agent harness that orchestrates multiple sub-agents to get a job done. These orchestrators can be deterministic code or another agent.

### Deterministic Orchestrator
- **Generate-and-Critic Pattern**: Your code spawns one model to generate text and an adversarial model to poke holes and give feedback. 
- **Planner Agent**: Implements the generate-and-critic pattern where one model generates a plan to achieve the goal, hands it to the orchestrator, and the orchestrator asks the adversarial model to identify issues with the plan.

### Agent as Orchestrator
- **Decomposition**: A pattern in which a single query is split into multiple subqueries, each handled in parallel. For instance, if the query requires facts from multiple sources (web search, database lookup, internal docs). [[Agentic RAG]] is an example of such a pattern.

# Networks or [[LangGraph|Graph]]
When we have a system with multiple agents communicating, all are free to communicate with each other without depending on a central harness. These are for fully [[autonomous agents]] where they can spawn other agents and work together to achieve a task.

### Council Pattern
- **Multiple Experts**: A single query is sent to multiple specialised agents (e.g., a security expert, a performance expert, and a UX expert).
- **Consensus or Synthesis**: The agents share their findings to reach a consensus, or a final "moderator" agent synthesises their independent responses into a single, comprehensive output.

### Multi-Agent Debate
- **Adversarial Collaboration**: Two or more agents are given a task and are encouraged to critique each other's work over multiple rounds. 
- **Self-Correction**: This iterative peer-review process within the network helps eliminate hallucinations and improve the technical accuracy of the final result.
