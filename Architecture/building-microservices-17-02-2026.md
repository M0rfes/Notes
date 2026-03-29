---
title: //Building Microservices - Chapter 2 (Part 2)
type: study-summary
status: seed
created: 2026-02-17
updated: 2026-03-29
tags: [microservices, architecture, coupling, cohesion]
aliases: [Coupling and Cohesion, Constantine's Law]
summary: Discusses the importance of loose coupling and high cohesion in microservice architectures, referencing Constantine's Law.
entities: [Larry Constantine, Sam Newman]
topics: [Coupling, Cohesion, Constantine's Law, Modular Design]
related: [Architecture/building-microservices-16-02-2026.md]
---

Keeping the theme of boundaries mentioned in [[Architecture/building-microservices-16-02-2026.md|my last post]], let's talk about **[[Coupling]]** and **[[Cohesion]]**.

When services are loosely coupled, a change to one service should not require a change to another. The whole point of a microservice is being able to make a change to one service and deploy it without needing to change any other part of the system. This is really quite important.

**Coupling** is caused by picking an integration that causes change in one service to cause a change in multiple services in your system.

This can happen if a service is exposing too many endpoints or doing a lot of "chatty" services, which not only cause potential performance problems but also cause tight coupling.

As we’ve already touched on, the concepts of coupling and cohesion are obviously related. Logically, if related functionality is spread across our system, changes to this functionality will ripple across those boundaries, implying tighter coupling. **Constantine’s Law**, named for structured design pioneer Larry Constantine, sums this up neatly:

> A structure is stable if cohesion is strong and coupling is low.

**Cohesion** applies to the relationship between things inside a boundary (a microservice in our context), whereas **Coupling** describes the relationship between things across a boundary. There is no absolute best way to organize our code; coupling and cohesion are just one way to articulate the various trade-offs we make around where we group code, and why. All we can strive to do is to find the right balance between these two ideas, one that makes the most sense for your given context and the problems you are currently facing.
