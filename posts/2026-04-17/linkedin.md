# LinkedIn Post: Pass-Through Coupling

**Hook:**
The "Postman" trap in Microservices. 📬
Are your services just passing data they don't even use? Watch out for **Pass-Through Coupling**.

**Body:**
Pass-through coupling happens when an intermediary service passes data from a downstream service to another one.

Example: `Order Processor` -> `Warehouse` -> `Shipping`.
The Warehouse doesn't care about the shipping manifest, but it's passing it along.

**Why it’s a problem:**
❌ It leaks implementation details.
❌ A change in the Shipping contract forces a change in the Warehouse.
❌ Services become tightly coupled across the chain.

**3 Ways to Fix It:**
1. **Direct Call:** Let the Order Processor call Shipping directly.
2. **Shift Responsibility:** Let the Warehouse build the manifest if it has enough data.
3. **Opaque Data:** Pass the manifest through the Warehouse as a "blob" it doesn't understand.

Don't let your middle-tier services become glorified data routers.

Have you seen this pattern "in the wild"?

#SoftwareEngineering #API #MicroservicesArchitecture #CleanCode #SystemDesign

![[pass-through-coupling.png]]
