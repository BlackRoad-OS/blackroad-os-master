# Architecture Decision Record (ADR) Template

**Decision ID:** ADR-[YYYY-MM-DD]-[number]  
**Status:** [Proposed | Accepted | Deprecated | Superseded]  
**Date:** YYYY-MM-DD  
**Deciders:** [List of people involved]  
**Tags:** [comma, separated, tags]

---

## Context and Problem Statement

*Describe the context and problem statement in 2-3 sentences. What is the issue we're trying to address?*

**Example:**
> We need to decide how to implement real-time notifications across our distributed system. Current polling-based approach causes excessive load and delays.

---

## Decision Drivers

*What factors are influencing this decision?*

- Performance requirements (e.g., "sub-100ms latency needed")
- Scalability needs (e.g., "must handle 10k concurrent connections")
- Team expertise (e.g., "team familiar with WebSockets")
- Cost constraints (e.g., "limited budget for infrastructure")
- Compliance requirements (e.g., "must meet SOC 2 standards")
- Time to market (e.g., "need solution in 4 weeks")

---

## Considered Options

### Option 1: [Name]
**Description:**  
*Brief description of this option*

**Pros:**
- ✅ Pro 1
- ✅ Pro 2

**Cons:**
- ❌ Con 1
- ❌ Con 2

**Estimated Effort:** [Low | Medium | High]

---

### Option 2: [Name]
**Description:**  
*Brief description of this option*

**Pros:**
- ✅ Pro 1
- ✅ Pro 2

**Cons:**
- ❌ Con 1
- ❌ Con 2

**Estimated Effort:** [Low | Medium | High]

---

### Option 3: [Name]
**Description:**  
*Brief description of this option*

**Pros:**
- ✅ Pro 1
- ✅ Pro 2

**Cons:**
- ❌ Con 1
- ❌ Con 2

**Estimated Effort:** [Low | Medium | High]

---

## Decision Outcome

**Chosen Option:** [Name of chosen option]

**Rationale:**
*Explain why this option was selected over others. What were the deciding factors?*

**Expected Consequences:**

**Positive:**
- Benefit 1
- Benefit 2

**Negative/Tradeoffs:**
- Tradeoff 1
- Tradeoff 2

---

## Implementation Details

**Repositories Affected:**
- blackroad-os-[name]
- blackroad-os-[name]

**Key Changes:**
1. Change 1
2. Change 2

**Migration Path:**
*If replacing existing system, how do we transition?*

**Timeline:**
- Phase 1: [Description] - [Date]
- Phase 2: [Description] - [Date]

---

## Validation

**How will we know this was the right decision?**

**Success Metrics:**
- Metric 1: [Target value]
- Metric 2: [Target value]

**Review Date:** [YYYY-MM-DD]
*When should we review if this decision still makes sense?*

---

## Related Decisions

- [ADR-YYYY-MM-DD-title](./YYYY-MM-DD-title.md) - Related decision
- [Pattern: Name](../patterns/pattern-name.md) - Related pattern

---

## References

- Link to RFC/proposal
- Link to proof of concept
- External documentation
- Research papers

---

## Notes

*Any additional context, discussion points, or future considerations*

---

## Changelog

| Date | Change | Author |
|------|--------|--------|
| YYYY-MM-DD | Initial decision | [name] |
| YYYY-MM-DD | Updated with feedback | [name] |

---

*Template Version: 1.0*  
*Last Updated: 2025-12-25*
