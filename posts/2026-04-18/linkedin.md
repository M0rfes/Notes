# LinkedIn Post: Common Coupling

**Hook:**
Sharing a database between microservices? 🪤
It’s the fastest way to turn your architecture into a "Distributed Monolith."

**Body:**
**Common Coupling** occurs when multiple services use the same shared resource—most often, a shared database table.

Example: `Order Processor` and `Warehouse` both reading/writing to the same `Orders` table.

**The Risks:**
⚠️ Incompatible changes break multiple systems.
⚠️ No single source of truth for state transitions.
⚠️ A DB outage takes down everything at once.

**The "Naive" Fix Trap:**
Adding a thin CRUD service (e.g., an `Order Service`) often just adds overhead without solving the coupling. You might reduce cohesion and increase complexity.

**The Real Fix:**
Hide details. Isolate components. Pick the trade-offs you can live with.

Common coupling is sometimes okay for static data, but for stateful entities? It’s a ticking time bomb. 💣

What's your horror story with shared databases?

#Databases #Microservices #Backend #SystemArchitecture #TechDebt

![[common-coupling.png]]
