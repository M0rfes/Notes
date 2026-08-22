---
title: Latency Throughput
type: concept
status: seed
created: 2026-09-22
tags:
  - concurrency
  - performance
  - latency
  - throughput
aliases:
  - Latency vs. Throughput
  - Latency and Throughput
---

# Latency vs. Throughput

Performance in computing is quantified in two ways: latency and throughput.
- Latency is the measure of how long a single task takes.
- Throughput is the number of tasks a system can handle over a period of time.

For example, if it takes 1 hour for one person to go from point A to point B on a motorcycle and then to a bus carrying 50 people, it takes 2 hours; the bike's latency is lower, but the bus's throughput is 25x that of a motorcycle.

Optimising for one may degrade another.

[[Concurrency]] can help with latency by breaking down a long-running task and executing it in parallel.
[[Concurrency]] can improve throughput by enabling us to perform multiple tasks simultaneously.

Therefore, using [[Concurrency|concurrency]] can improve system performance in three main ways:
- It can reduce latency (i.e., make a unit of work complete faster).
- It can hide latency (that is, allow the system to accomplish something else during a high-latency operation).
- It can increase throughput (that is, make the system able to do more work).
