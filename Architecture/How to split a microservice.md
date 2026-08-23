---
title: Splitting Microservices
type: research
status: seed
created: 2026-04-19
updated: 2026-04-19
tags:
  - architecture
  - microservices
  - ddd
  - refactoring
aliases: [Service Decomposition, Splitting Services]
summary: A comprehensive guide on decomposing systems into microservices using DDD, volatility, data compliance, technology runtimes, and organizational structure.
entities: [DDD, Microservices, Rust, C++, C, HIPAA, PCI, PII]
topics: [Bounded Context, Ubiquitous Language, Bimodal IT, Conway's Law, Service Decomposition]
related:
  - Architecture/DDD/DDD.md
  - Architecture/Coupling.md
  - Architecture/building-microservices-16-02-2026.md
---
When splitting up services for a [[Microservices|microservice architecture]], we can use many approaches to define boundaries and ensure system health.

## [[DDD|Domain-Driven Design (DDD)]]

In [[DDD]], we use the concepts of [[Bounded Context]] and [[Ubiquitous Language]] to define service boundaries. 
- A **[[Bounded Context]]** is all about hiding information from the wider world and exposing a clean API. This lets us define clear boundaries between services and enables us to make internal changes without notifying consumers, thereby giving the team freedom to develop and deploy independently. 
- **[[Ubiquitous Language]]** defines a common language across teams; the goal is to eliminate assumptions and translation when talking about a process or goal that the organisation performs or wants to change. 

DDD puts the business domain at the centre of the architecture, ensuring that the software structure reflects the business reality.

## Volatility
Volatility dictates that we split the services based on which parts of the system change the most. One way to do this is the **[[Bimodal IT]]** concept. In Bimodal IT, we divide the system into two modalities:
- **Mode 1 (System-of-Record):** Services that don't change much and have little to do with business innovation. These are optimised for stability and reliability.
- **Mode 2 (System-of-Innovation):** Frequently changing services that require the most business innovation and rapid iteration.

Volatility can be used when speed-to-market is a priority, but be careful not to end up with "two speeds" where every change in Mode 2 is blocked by a required change in Mode 1.

## Data Governance
Sometimes, the data and the rules/policies governing it dictate how to decompose services. 
- **Compliance:** If your service must be [[HIPAA]]- or [[PCI]]-Compliant, it is often wiser to silo the services that need to be audited. 
- **Privacy:** We can simplify the audit process and reduce risk by isolating [[PII]] (Personally Identifiable Information) data into dedicated services.

## Technology & Runtime
We can decompose services by their technical requirements or runtimes. For example, if we are using [[Basics of Rust Concurrency |Rust]], [[C++]], or [[C]] For performance-critical use cases, we might decompose those into separate services to isolate resource-heavy operations or specific hardware requirements.

## Organizational Structure
When designing a system, we must address the organisational structure (often referred to as **[[Conway's Law]]**). A service owned by multiple teams often fails to yield the desired outcomes. 
Your architecture should follow the organisation's structure. If an organisation restructures—for example, if a Warehouse team responsible for both Stock Keeping and Ordering is split into Inventory and Supply Management teams—the underlying service may need to be decomposed to maintain clear ownership and alignment.

# Final Thought

While designing a system, it's not necessary to stick to a single approach; we can mix strategies. For example, you can use a [[Bounded Context]] across your organisational structure so that if organisational changes occur and you have to decompose a service, you can do so easily without impacting consumers. 

You should pick and choose the principles that best solve the specific issues at hand, keeping in mind the trade-offs in [[Coupling]] and [[Cohesion]].