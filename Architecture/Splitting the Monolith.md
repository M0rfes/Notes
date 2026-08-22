---
title: Splitting Monolith
type: research
status: budding
created: 2026-04-26
updated: 2026-04-26
tags:
  - architecture
  - microservices
  - refactoring
aliases:
  - Monolith Decomposition
  - Service Extraction
summary: A guide on strategies and considerations for decomposing a monolith into microservices, focusing on extraction priorities and verification techniques.
entities:
  - Martin Fowler
topics:
  - Microservices
  - Monolith
  - Strangler Fig Pattern
  - Parallel Run
related:
  - "[[How to split a microservice]]"
  - "[[Coupling]]"
  - "[[DDD]]"
  - "[[DDIA-14-03-2026|DDIA - Reliability]]"
---

After you have decided that [[microservices]] are the right solution for your team, the question is what to extract first. One should define a success metric before starting and clear some low-hanging fruit first, cause these can be a multi-month or years-long endeavour. 

```text
Want to scale the application? Functionality that currently constrains the system’s ability to handle load will be high on the list. Want to improve time to market? Examine the system’s [[Volatility]] to identify the functionality that changes most frequently, and determine whether it would work as microservices.
```

Fundamentally, the decision about which functionality to split into a microservice will be a balance between these two forces—how easy the extraction is versus the benefit of extracting the microservice in the first place.

There are a few ways to go about decomposing your [[monolith]].

## Code First
In code-first, we extract the application code into a separate service, leaving the data in the [[Case For Monolith|monolith]]. If you can't split the code, maybe that portion can't be split into a service yet and can save a lot of pain. The one drawback is that data is usually harder to decompose than code. And could result in wasted effort if the data can't be split.

## Data First
First, we decompose the data before splitting the code out. Decomposing the database is usually the harder part, and if the decomposition is successful, we can go ahead and split the feature out into a service.

## [[Strangler Fig Pattern]]
[Coined by Martin Fowler](https://oreil.ly/u33bI). In this pattern, we wrap the monolith with a newer system that slowly takes over the feature. We can put the monolith behind a gateway and route the request to the new service or to the monolith if the feature is still not extracted. The advantage of these is that the monolith can be unaware of the service, and all the new features can be implemented in the new service.

When implementing a microservice, it can be hard to verify if the service is working as intended. We use a strategy called [[Parallel Run]] to verify if what we did didn't break the behaviour. We do that by running both the microservice and the monolith, and passing the request to both and logging the responses. These will verify that the behaviour is still the same over time.
