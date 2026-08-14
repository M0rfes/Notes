---
title: Agents
type: research
status: seed
created: 2026-04-01
updated: 2026-04-01
tags: [research, ai, agents]
aliases: [AI Agents, Autonomous Agents]
summary: An exploration of what defines an AI agent, focusing on the transition from simple chatbots to autonomous systems using reasoning, tools, and frameworks like ReAct.
entities: [LLM, ReAct, Copilot, CloudCode, Codex, Playwright, MCP]
topics: [Reasoning Engine, Deterministic Code, Workflows, Autonomous Agents, Sub-agents]
related: [LLMs/LLMs.md, LLMs/Router Pattern.md]
---

In short, an **Agent** is an [[LLM|LLM]] with [[Tool calling|tools]]. But when does an LLM with a tool go from a chatbot that can look up stuff on the web or in a database and become an agent that can automate almost anything?

It all starts from a workflow where we use the LLM as a **reasoning agent**, and most of the work is done by deterministic code.

> **Example:** If we have a list of customer emails, you can write a workflow that uses the LLM to generate a personalised email based on customer data and craft it. And your code can send the email. Put it behind a scheduler, and you have an automated outreach service that will send emails.

When we start chaining together workflows, we get agents. Your agent can be fully automated or very narrow, which depends on the tools and harness you build around the LLM.

### The ReAct Framework
The most popular framework to build agents is to use [[ReAct]] (different than react.js). It stands for **Reason and Act**. It's when your workflow can affect the environment, observe the effects, reason about it, and decide to either stop (when the goal has been reached) or trigger another loop of ReAct.

### Multi-Agent Workflows & Patterns
A less narrow agent would be something like a social media post engine. We can use two LLMs: one to generate and another to critique. 

1. Our harness (deterministic code) reads content from a file containing the research outline.
2. You prompt the **Generation LLM** to generate a post.
3. You ask the **Critique LLM** to generate feedback or output a `NO_FEEDBACK` token. 
4. Your harness takes the feedback and the draft, and prompts the Generation LLM to generate a new post. 

This loop continues until you receive a `NO_FEEDBACK` token or the harness reaches a set number of tries. This is a form of **Self-Reflective / Corrective** workflow.

Other common patterns include:
- **[[Router Pattern]]**: The LLM acts as a dispatcher, classifying the query and routing it to the most relevant index or tool (e.g., "Documentation Index" vs. "Web Search").
- **Query Decomposition**: Breaking down complex questions into simpler sub-queries executed in parallel or sequence.

### Application: Agentic RAG
The evolution of [[RAG]] has led to **[[Agentic RAG]]**. Instead of a fixed "retrieve-then-generate" pipeline, the agent uses a reasoning loop to decide how to find, evaluate, and use information. It can choose between `semantic_search()`, `keyword_search()`, or even `web_search()` depending on the need.

### Fully Autonomous Agents
This takes us to fully [[Autonomous Agents|autonomous agents]] the likes of [[Copilot]], [[CloudCode]], [[Codex]], etc. They focus on code generation but are fully autonomous and can be used to do almost anything as long as you can give them tools to bridge it with text.

For example, these agents let you create sub-agents just by using text. You can simulate both the email engine and the post engine with a fully autonomous agent. Your agent can spawn sub-agents: one acting as the harness and others acting as the generation and critique agents. Add [[Playwright]], [[MCP]], and they can post for you.

### Ecosystem & Frameworks
Modern agent development relies on specialised frameworks:
- **[[LangGraph]]**: Graph-based state management for complex, cyclical workflows.
- **[[CrewAI]]**: Role-based agent teams (e.g., Researcher, Editor, Publisher).
- **[[Model Context Protocol|MCP]]**: A standardised protocol for connecting agents to tools and data sources.

**An agent is a system that enables LLMs to affect the world and achieve a goal.**
