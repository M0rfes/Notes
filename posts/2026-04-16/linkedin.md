# LinkedIn Post: Temporal Coupling

**Hook:**
Is your "distributed system" just a monolith with network latency? 🏗️
If Service A can't work because Service B is down, you’ve got **Temporal Coupling**.

**Body:**
Temporal Coupling occurs when two or more services must be up and available *simultaneously* to handle a request.

Classic Example: A synchronous HTTP call from `Order Processor` to `Warehouse`.
If the Warehouse is slow, the Order Processor hangs. 
If the Warehouse is down, the request fails.

**How to break the chain:**
✅ Use an async communication strategy.
✅ Introduce a [[Message Broker]].
✅ Shift from "I need this now" to "I'll let you know when this happens."

Moving to async doesn't just improve reliability; it improves user experience by reducing blocking calls.

Are you still relying on sync calls for critical paths? 👇

#Microservices #DistributedSystems #MessageBrokers #CloudComputing #Reliability

![[temporal-coupling.png]]
