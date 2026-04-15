# LinkedIn Post: Domain Coupling

**Hook:**
You can't build microservices without coupling. 🛑
The goal isn't to eliminate it—it's to choose the right kind.

**Body:**
When we move to microservices, we often obsess over "decoupling." But services have to talk to each other to get work done. That’s where **Domain Coupling** comes in.

Domain Coupling happens when Service A needs functionality from Service B. 
Example: Your `Order Processor` needs to reserve stock in the `Warehouse`.

Is it bad? Not necessarily. It’s "loose coupling" by nature. But it can smell if:
1️⃣ One service does too much (logic is too centralized).
2️⃣ You're passing complex data structures (leaking internal details).

**The Golden Rule:** Only expose what you absolutely must. Send back the minimum data required.

How do you manage domain coupling in your architecture? 💬

#Microservices #SoftwareArchitecture #SystemDesign #BackendDevelopment #DomainDrivenDesign

![[domain-coupling.png]]
