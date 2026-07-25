# LinkedIn Post: Velocity, Volatility, and the Case for the Modular Monolith
**Date:** 2026-04-20
**Source:** [[Case For Monolith]]

## Post Text
Are you building for scale or for complexity?

The industry often pushes microservices as the "end state" of any successful application. But here’s the reality: Microservices are not the prize. They are a technical solution to a specific set of organisational and scaling problems—problems you might not even have yet.

If you jump to microservices too early, you aren't just decomposing your code; you're decomposing your **Velocity**.

Here is why the **Modular Monolith** is the strategic choice for modern development:

1. **Velocity is the Goal:** If you want to move fast, logical modularity beats physical distribution every time. No network latency, no distributed transactions, and no "distributed system tax" on every PR.
2. **Managing Volatility:** Most systems don't fail because they can't scale; they fail because they can't change. High **Volatility** (parts of the system changing frequently) is best handled through clean refactoring within a monolith, not by splitting services across boundaries you don't fully understand yet.
3. **The Shopify Blueprint:** Massive scale doesn't require massive fragmentation. Shopify proves that a well-architected modular monolith can handle incredible traffic while maintaining a unified, productive codebase.
4. **Data-Aware Modularity:** You can achieve "microservice readiness" by decomposing your data *within* the monolith. Start with a shared DB, move to schema-level separation, and only extract the service when the network boundary actually provides value.

**The Bottom Line:**
Don't trade your development velocity for the operational headache of microservices until vertical scaling is exhausted and your domain boundaries are set in stone.

Build for the velocity you need today, not the complexity you might need tomorrow.

#SoftwareArchitecture #Velocity #Volatility #SystemDesign #Microservices #ModularMonolith #EngineeringManagement
