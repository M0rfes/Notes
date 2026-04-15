---
title: "Coupling in Microservices"
type: reference
status: seed
created: 2026-04-15
updated: 2026-04-15
tags: [microservices, architecture, coupling]
aliases: [Service Coupling, Coupling Types]
summary: An overview of the four main coupling types in microservice systems — Domain, Temporal, Pass-Through, and Common — with strategies for minimising or replacing each.
entities: [Order Processor, Warehouse, Shipping, Payment]
topics: [Domain Coupling, Temporal Coupling, Pass-Through Coupling, Common Coupling, Loose Coupling, Async Communication, Shared Database, Finite-State Machine]
related:
  - Architecture/building-microservices-17-02-2026.md
  - Architecture/building-microservices-16-02-2026.md
  - Architecture/DDIA-14-03-2026.md
---

When building [[microservices]], we want to reduce coupling between our systems. While we can't completely eliminate coupling, we can minimise it and replace avoidable couplings with acceptable ones. There are a few types of coupling.

## [[Domain Coupling]]

Domain Coupling occurs when one service interacts with another because it needs to use functionality provided by that service. In the example below, the order processor service needs to reserve stock from the Warehouse and take payment from the Payment service.

![[Pasted image 20260414192702.png]]

This type of coupling is unavoidable in a microservice system because multiple services have to work together to service a task. This is what we call [[Loose Coupling]]. But these can get out of hand in many ways; if one service is doing too much, it signals too much logic has been centralised. We might need to decompose that service by domain. Or when the service is passing too complex data structures around, that signals that we are leaking the internal implementation details between services. We should only expose what we absolutely have to and send back the least amount of data possible.

## [[Temporal Coupling]]

These are situations in which 2 or more services must be up and available simultaneously to service a request.

![[Pasted image 20260414194252.png]]

In our example, the `Order Processor` makes a sync call to the `Warehouse` service. These will block the `Order Processor` until the Warehouse responds, and will fail the request if the Warehouse is unreachable. These can be avoided by using an [[Async Communication]] strategy, like a [[message broker]]. There is also a loose coupling.

## [[Pass-Through Coupling]]

Pass-through coupling is when we have to pass data from a downstream service to an intermediary service. These have quite a few issues, one of which is their leaking implementation details, which we are calling a separate service. It also tightly couples the services, because if the final service changes its contract, many services have to change their contracts and be rolled out simultaneously.

![[Pasted image 20260414201942.png]]

In the above example, the Order processor service passes the shipping manifest to the Warehouse, which then passes it to the Shipping service; this couples the Order processor, Warehouse, and Shipping. We can mitigate this in several ways:
1. Let the Order Processor directly call the Shipping service. But this would burden the Order processor, since it now has to ask the Warehouse to reserve the stock and update it once shipping is queued.
2. Let Warehouse build the shipping manifest. The warehouse can know enough about the Order to not only update the stock but also initiate shipping.
3. Make the Shipping Manifest Opaque to the Warehouse. We still pass through the warehouse, but it doesn't know the data structure. We still leak implementation details, but a change in the shipping manifest only requires a change in the Order Processor and Shipping, and not in the warehouse.

## [[Common Coupling]]

Common Coupling occurs when multiple services use the same shared resource, e.g., a [[Shared Database]]. The best-case scenario would be sharing some static data between services that doesn't change often, but even then, backwards-incompatible changes still necessitate changes across multiple systems. Another case could be sharing a database table/entity between services.

![[Pasted image 20260415125317.png]]

Order Processor and Warehouse both share the Order table to track and update the status.
Order Processor changes the state to PLACED and PAID, and Warehouse changes it between RESERVED, PACKING, and DISPATCHED. We can't be sure that one service won't change in a way that breaks another service. With the added drawback of sharing resources between services, if the DB goes down, multiple parts of our service go down with it.

A naive approach to fix it would be to add an Order service that implements a [[finite-state machine]] over order states and serves as the single source of truth for Order.

![[Pasted image 20260415130102.png]]

Even in our contrived example, this gets out of hand quickly because the Order service is just a thin wrapper around CRUD operations on the Order table. We have reduced [[cohesion]] and increased coupling because every service that interacts with orders must now know the order states and handle errors from the Order service when state transitions are invalid.

Common coupling is _sometimes_ OK, but often it's not. Even for simple solutions, it gets out of hand quickly.

---

The goal is not to avoid all couplings, but to be aware of their existence and to choose which ones can be traded for others. The goal should be to hide details and isolate components. These give us greater flexibility to change one service without forcing other services to change for us. See also [[Architecture/building-microservices-17-02-2026|Loose Coupling and Cohesion]].
