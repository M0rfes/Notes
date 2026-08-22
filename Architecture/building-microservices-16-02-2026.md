---
title: Service Boundaries
type: study-summary
status: seed
created: 2026-02-16
updated: 2026-03-29
tags: [microservices, architecture, modularity]
aliases: [Service Boundaries, Information Hiding]
summary: Exploration of service boundaries and information hiding in microservice architecture based on Sam Newman's Building Microservices.
entities: [David Parnas, Adrian Colyer, Sam Newman]
topics: [Information Hiding, Modular Decomposition, Service Boundaries]
related: [Architecture/building-microservices-17-02-2026.md]
---

Before making services in a microservice arcature we should know where are the boundaries of each service.

Microservices are just another form of modular decomposition, albeit one that has network-based interaction between the models.

one of the way to define a boundary is Information hiding

Information hiding is a concept developed by David Parnas to look at the most effective way to define module boundaries. Information hiding describes a desire to hide as many details as possible behind a module (or, in our case, microservice) boundary. Parnas looked at the benefits that modules should theoretically give us, namely:

- **Improved development time**: By allowing modules to be developed independently, we can allow for more work to be done in parallel and reduce the impact of adding more developers to a project.
- **Comprehensibility**: Each module can be looked at in isolation and understood in isolation. This in turn makes it easier to understand what the system as a whole does.
- **Flexibility**: Modules can be changed independently from one another, allowing for changes to be made to the functionality of the system without requiring other modules to change. In addition, modules can be combined in different ways to deliver new functionality.

This list of desirable characteristics nicely complements what we are trying to achieve with microservice architectures—and indeed I now see microservices as just another form of modular architecture. Adrian Colyer has actually looked back at a number of David Parnas’s papers from this period and examined them with respect to microservices, and his summaries are well worth reading.

The connections between modules are the assumptions which the modules make about each other.

By reducing the number of assumptions that one module (or microservice) makes about another, we directly impact the connections between them. By keeping the number of assumptions small, it is easier to ensure that we can change one module without impacting others. If a developer changing a module has a clear understanding as to how the module is used by others, it will be easier for the developer to make changes safely in such a way that upstream callers won’t also have to change.
